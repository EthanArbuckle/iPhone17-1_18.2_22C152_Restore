@interface XRSchemaElementsRecursiveParser
- (id)errorMessagesReplacements;
- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6;
- (void)_handleStart;
- (void)elementWithName:(id)a3 parser:(id)a4 key:(id)a5 finishedWithErrorReplacement:(id)a6;
@end

@implementation XRSchemaElementsRecursiveParser

- (void)_handleStart
{
  if (!self->super.parent)
  {
    self->_errorReplacementsByKey = (NSMutableDictionary *)objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (void)elementWithName:(id)a3 parser:(id)a4 key:(id)a5 finishedWithErrorReplacement:(id)a6
{
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->super.parent && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [self->super.parent elementWithName:v13 parser:v26 key:v10 finishedWithError:v11];
  }
  else
  {
    id v14 = self->super.context;
    v20 = [self->_errorReplacementsByKey objectForKeyedSubscript:v15];
    if (v20)
    {
      [v14 reportProblemWithElement:v18 failure:(uint64_t)v10 Key:v19 usedForErrorReplacement:v11 isNotUnique:v12];
    }
    else
    {
      v21 = [XRSchemaErrorReplacementElement alloc];
      v23 = [v21 initWithName:v22 key:v26 replacementString:v11];
      [self->_errorReplacementsByKey setObject:(uint64_t)v23 forKeyedSubscript:(uint64_t)v11];
    }
  }
}

- (id)errorMessagesReplacements
{
  return (id)((uint64_t (*)(NSMutableDictionary *, char *))MEMORY[0x270F9A6D0])(self->_errorReplacementsByKey, sel_allValues);
}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 isEqualToString:v12] == YES
    || [v10 isEqualToString:v15 key:v16 value:v17])
  {
    v21 = [XRSchemaAnnotationContainingElementParser alloc];
    uint64_t v24 = [v21 initWithElementName:v22 context:v10];
    v28 = [v11 objectForKeyedSubscript:v25 key:@"name" default:v26 default:v27];
    [v24 setDelegate:self];
    [v24 setKey:v32 value:(uint64_t)v28 forKey:v33];
  }
  else if ([v10 isEqualToString:@"xs:simpleType"] == YES) {
         || [v10 isEqualToString:v35 @"xs:simpleContent" v36 v37])
  }
  {
    v38 = [XRSchemaSimpleTypeElementParser alloc];
    uint64_t v24 = [v38 initWithElementName:v39 context:(uint64_t)v10];
    [v24 setDelegate:self];
    [v24 setIdentifier:v44 forKey:@"xs:pattern" value:v45];
  }
  else
  {
    v47 = [XRSchemaElementsRecursiveParser alloc];
    uint64_t v24 = [v47 initWithElementName:v48 context:(uint64_t)v10];
  }
  objc_storeStrong((id *)(v24 + 16), self);
  *(void *)(v24 + 24) = a5;
  *(void *)(v24 + 32) = a6;
  [v24 handleStart:v50, v51, v52, v53];

  return (id)v24;
}

- (void).cxx_destruct
{
}

@end