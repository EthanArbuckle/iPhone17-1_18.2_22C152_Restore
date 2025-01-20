@interface NSISPlaybackOperation
- (NSISPlaybackOperation)init;
- (id)unwrapLinearExpression:(id)a3 onEngine:(id)a4;
- (id)unwrapVariable:(id)a3;
- (void)dealloc;
- (void)playbackOneAction:(id)a3 onEngine:(id)a4;
@end

@implementation NSISPlaybackOperation

- (NSISPlaybackOperation)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSISPlaybackOperation;
  v2 = [(NSISPlaybackOperation *)&v4 init];
  v2->oldIdentsToNewVariables = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2->variableDelegates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return v2;
}

- (id)unwrapVariable:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"ident"];
  id v6 = (id)[(NSMutableDictionary *)self->oldIdentsToNewVariables objectForKey:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(NSClassFromString((NSString *)[a3 objectForKey:@"class"]));
    v7 = objc_alloc_init(NSISPlaybackOperationVariableDelegate);
    -[NSISPlaybackOperationVariableDelegate setVariableDescription:](v7, "setVariableDescription:", [a3 objectForKey:@"description"]);
    -[NSISPlaybackOperationVariableDelegate setMarkedConstraintDescription:](v7, "setMarkedConstraintDescription:", [a3 objectForKey:@"markedConstraintDescription"]);
    -[NSISPlaybackOperationVariableDelegate setVariableIsUserObservable:](v7, "setVariableIsUserObservable:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"userObservable"), "BOOLValue"));
    -[NSISPlaybackOperationVariableDelegate setOrientationHint:](v7, "setOrientationHint:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"orientationHint"), "intValue"));
    [(NSISPlaybackOperationVariableDelegate *)v7 setVariable:v6];
    [v6 setDelegate:v7];
    [(NSMutableArray *)self->variableDelegates addObject:v7];

    [(NSMutableDictionary *)self->oldIdentsToNewVariables setObject:v6 forKey:v5];
  }
  return v6;
}

- (id)unwrapLinearExpression:(id)a3 onEngine:(id)a4
{
  id v6 = [[NSISLinearExpression alloc] initWithEngine:a4];
  v7 = (void *)[a3 objectForKey:@"variables"];
  v8 = (void *)[a3 objectForKey:@"coefficients"];
  uint64_t v9 = [v7 count];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[NSISLinearExpression addVariable:coefficient:](v6, "addVariable:coefficient:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v7 objectAtIndex:i]), NSISUnwrapExactFloat(objc_msgSend(v8, "objectAtIndex:", i)));
  }
  -[NSISLinearExpression incrementConstant:](v6, "incrementConstant:", NSISUnwrapExactFloat((void *)[a3 objectForKey:@"constant"]));
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSISPlaybackOperation;
  [(NSISPlaybackOperation *)&v3 dealloc];
}

- (void)playbackOneAction:(id)a3 onEngine:(id)a4
{
  v7 = (char *)NSSelectorFromString((NSString *)[a3 objectForKey:@"command"]);
  v8 = (void *)[a3 objectForKey:@"args"];
  uint64_t v9 = v8;
  if (v7 == sel_setShouldIntegralize_)
  {
    uint64_t v12 = [v8 objectAtIndex:0];
    [a4 setValue:v12 forKey:@"shouldIntegralize"];
  }
  else if (v7 == sel_optimize)
  {
    [a4 optimize];
  }
  else if (v7 == sel__optimizeWithoutRebuilding)
  {
    [a4 _optimizeWithoutRebuilding];
  }
  else if (v7 == sel_tryToAddConstraintWithMarker_expression_mutuallyExclusiveConstraints_ {
         || v7 == sel_tryToAddConstraintWithMarker_expression_integralizationAdjustment_mutuallyExclusiveConstraints_)
  }
  {
    uint64_t v28 = 0;
    id v13 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    id v14 = -[NSISPlaybackOperation unwrapLinearExpression:onEngine:](self, "unwrapLinearExpression:onEngine:", [v9 objectAtIndex:1], a4);
    if (v7 == sel_tryToAddConstraintWithMarker_expression_integralizationAdjustment_mutuallyExclusiveConstraints_) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 2;
    }
    if (objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v15), "BOOLValue")) {
      v16 = &v28;
    }
    else {
      v16 = 0;
    }
    [a4 tryToAddConstraintWithMarker:v13 expression:v14 mutuallyExclusiveConstraints:v16];
  }
  else if (v7 == sel_addVariableToBeOptimized_priority_)
  {
    id v17 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    double v18 = NSISUnwrapExactFloat((void *)[v9 objectAtIndex:1]);
    [a4 addVariableToBeOptimized:v17 priority:v18];
  }
  else if (v7 == sel_removeVariableToBeOptimized_priority_)
  {
    id v19 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    double v20 = NSISUnwrapExactFloat((void *)[v9 objectAtIndex:1]);
    [a4 removeVariableToBeOptimized:v19 priority:v20];
  }
  else if (v7 == sel_changeVariableToBeOptimized_fromPriority_toPriority_)
  {
    id v21 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    double v22 = NSISUnwrapExactFloat((void *)[v9 objectAtIndex:1]);
    double v23 = NSISUnwrapExactFloat((void *)[v9 objectAtIndex:2]);
    [a4 changeVariableToBeOptimized:v21 fromPriority:v22 toPriority:v23];
  }
  else if (v7 == sel_removeConstraintWithMarker_)
  {
    id v24 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    [a4 removeConstraintWithMarker:v24];
  }
  else if (v7 == sel_constraintDidChangeSuchThatMarker_shouldBeReplacedByMarkerPlusDelta_)
  {
    id v25 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    double v26 = NSISUnwrapExactFloat((void *)[v9 objectAtIndex:1]);
    [a4 constraintDidChangeSuchThatMarker:v25 shouldBeReplacedByMarkerPlusDelta:v26];
  }
  else
  {
    if (v7 != sel_tryToChangeConstraintSuchThatMarker_isReplacedByMarkerPlusDelta_undoHandler_)
    {
      uint64_t v27 = [NSString stringWithFormat:@"Unknown playback selector %@", objc_msgSend(a3, "objectForKey:", @"command"];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0]);
    }
    id v10 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", [v8 objectAtIndex:0]);
    double v11 = NSISUnwrapExactFloat((void *)[v9 objectAtIndex:1]);
    [a4 tryToChangeConstraintSuchThatMarker:v10 isReplacedByMarkerPlusDelta:&__block_literal_global_4 undoHandler:v11];
  }
}

@end