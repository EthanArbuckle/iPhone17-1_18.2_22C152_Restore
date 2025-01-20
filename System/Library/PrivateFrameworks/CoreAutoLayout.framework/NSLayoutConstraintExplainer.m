@interface NSLayoutConstraintExplainer
- (NSArray)mutuallyExclusiveConstraints;
- (NSLayoutConstraintExplainer)initWithConstraint:(id)a3;
- (NSMapTable)priorities;
- (NSMapTable)satisfactionChanges;
- (id)description;
- (id)freezeConstraint:(id)a3;
- (id)relaxConstraint:(id)a3;
- (id)requireConstraint:(id)a3;
- (id)thawConstraint:(id)a3;
- (unint64_t)_satisfactionChangeCount:(id)a3 withResults:(id *)a4;
- (void)_freezeErrorVariable:(id)a3 forcingZeroValue:(BOOL)a4 inEngine:(id)a5 accumulatingConstraints:(id)a6 andMutuallyExclusiveConstraints:(id *)a7;
- (void)dealloc;
- (void)recalculateExplanation;
- (void)setMutuallyExclusiveConstraints:(id)a3;
- (void)setPriorities:(id)a3;
- (void)setSatisfactionChanges:(id)a3;
@end

@implementation NSLayoutConstraintExplainer

- (NSLayoutConstraintExplainer)initWithConstraint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSLayoutConstraintExplainer;
  v4 = [(NSLayoutConstraintExplainer *)&v6 init];
  if (v4)
  {
    v4->_constraint = (NSLayoutConstraint *)a3;
    v4->_requiredConstraints = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_relaxedConstraints = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_frozenConstraints = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSLayoutConstraintExplainer *)v4 recalculateExplanation];
  }
  return v4;
}

- (void)dealloc
{
  self->_constraint = 0;
  self->_requiredConstraints = 0;

  self->_relaxedConstraints = 0;
  self->_frozenConstraints = 0;
  [(NSLayoutConstraintExplainer *)self setSatisfactionChanges:0];
  [(NSLayoutConstraintExplainer *)self setPriorities:0];
  [(NSLayoutConstraintExplainer *)self setMutuallyExclusiveConstraints:0];
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraintExplainer;
  [(NSLayoutConstraintExplainer *)&v3 dealloc];
}

- (void)_freezeErrorVariable:(id)a3 forcingZeroValue:(BOOL)a4 inEngine:(id)a5 accumulatingConstraints:(id)a6 andMutuallyExclusiveConstraints:(id *)a7
{
  BOOL v10 = a4;
  if (a7) {
    *a7 = 0;
  }
  if ([a3 shouldBeMinimized])
  {
    double v17 = 0.0;
    if ([a5 hasValue:&v17 forVariable:a3])
    {
      if (!v10)
      {
LABEL_7:
        v14 = [NSErrorVariableConstraint alloc];
        v15 = [(NSErrorVariableConstraint *)v14 initWithVariable:a3 value:v17];
        id v16 = 0;
        [(NSLayoutConstraint *)v15 _addToEngine:a5 mutuallyExclusiveConstraints:&v16];
        if (a7)
        {
          *a7 = v16;
        }
        else if ([v16 count])
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraintExplainer.m", 74, @"Error variable freezing should never fail.");
        }
        [a6 addObject:v15];

        return;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutConstraintExplainer.m", 58, @"Expected engine to contain variable %@", a3);
      if (!v10) {
        goto LABEL_7;
      }
    }
    double v17 = 0.0;
    goto LABEL_7;
  }
}

- (void)recalculateExplanation
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)-[NSLayoutConstraint _layoutEngine]((uint64_t)self->_constraint);
  v4 = (void *)[v3 constraints];
  v5 = (void *)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v74 = 0;
  [(NSLayoutConstraintExplainer *)self setSatisfactionChanges:0];
  [(NSLayoutConstraintExplainer *)self setMutuallyExclusiveConstraints:0];
  [(NSLayoutConstraintExplainer *)self setPriorities:0];
  BOOL v6 = [(NSLayoutConstraint *)self->_constraint isActive];
  if (v3 && v6)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v71 != v9) {
            objc_enumerationMutation(v4);
          }
          v11 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          [v11 unsatisfaction];
          if (v12 != 0.0)
          {
            *(float *)&double v12 = v12;
            objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v12), v11);
          }
        }
        uint64_t v8 = [v4 countByEnumeratingWithState:&v70 objects:v80 count:16];
      }
      while (v8);
    }
    obuint64_t j = v4;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    frozenConstraints = self->_frozenConstraints;
    uint64_t v15 = [(NSMutableSet *)frozenConstraints countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v67 != v17) {
            objc_enumerationMutation(frozenConstraints);
          }
          v19 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", [v19 _markerAndPositiveExtraVar], 0, v3, v13, 0);
          -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _negativeExtraVar]((uint64_t)v19), 0, v3, v13, 0);
        }
        uint64_t v16 = [(NSMutableSet *)frozenConstraints countByEnumeratingWithState:&v66 objects:v79 count:16];
      }
      while (v16);
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    requiredConstraints = self->_requiredConstraints;
    uint64_t v21 = [(NSMutableSet *)requiredConstraints countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v63;
LABEL_21:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v63 != v23) {
          objc_enumerationMutation(requiredConstraints);
        }
        v25 = *(void **)(*((void *)&v62 + 1) + 8 * v24);
        -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", [v25 _markerAndPositiveExtraVar], 1, v3, v13, &v74);
        if ([v74 count]) {
          break;
        }
        -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _negativeExtraVar]((uint64_t)v25), 1, v3, v13, &v74);
        if ([v74 count]) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [(NSMutableSet *)requiredConstraints countByEnumeratingWithState:&v62 objects:v78 count:16];
          if (v22) {
            goto LABEL_21;
          }
          break;
        }
      }
    }
    if (![v74 count]) {
      [(NSLayoutConstraintExplainer *)self _freezeErrorVariable:[(NSLayoutConstraint *)self->_constraint _markerAndPositiveExtraVar] forcingZeroValue:1 inEngine:v3 accumulatingConstraints:v13 andMutuallyExclusiveConstraints:&v74];
    }
    if (![v74 count]) {
      -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _negativeExtraVar]((uint64_t)self->_constraint), 1, v3, v13, &v74);
    }
    if (![v74 count])
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F28E10]);
      [(NSLayoutConstraintExplainer *)self setPriorities:v26];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v27 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v59;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(obj);
            }
            v31 = *(NSLayoutConstraint **)(*((void *)&v58 + 1) + 8 * k);
            objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v31), "floatValue");
            double v57 = 0.0;
            double v33 = fabsf(v32) - fabs(-[NSLayoutConstraint _unsatisfaction:]((id *)&v31->super.isa, &v57));
            [v5 removeObjectForKey:v31];
            if (v33 != 0.0 && v31 != self->_constraint)
            {
              *(float *)&double v34 = v33;
              objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v34), v31);
            }
            v35 = [(NSLayoutConstraintExplainer *)self priorities];
            HIDWORD(v36) = HIDWORD(v57);
            *(float *)&double v36 = v57;
            -[NSMapTable setObject:forKey:](v35, "setObject:forKey:", [NSNumber numberWithFloat:v36], v31);
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
        }
        while (v28);
      }
      [(NSLayoutConstraintExplainer *)self setSatisfactionChanges:v5];
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v37 = [v13 countByEnumeratingWithState:&v53 objects:v76 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v54;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v54 != v39) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * m) _removeFromEngine:v3];
        }
        uint64_t v38 = [v13 countByEnumeratingWithState:&v53 objects:v76 count:16];
      }
      while (v38);
    }

    if ([v74 count])
    {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v42 = v74;
      uint64_t v43 = [v74 countByEnumeratingWithState:&v49 objects:v75 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v50;
        do
        {
          for (uint64_t n = 0; n != v44; ++n)
          {
            if (*(void *)v50 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v49 + 1) + 8 * n);
            if (objc_opt_isKindOfClass()) {
              v47 = (void *)[v47 constrainedConstraint];
            }
            if (([v41 containsObject:v47] & 1) == 0) {
              [v41 addObject:v47];
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v49 objects:v75 count:16];
        }
        while (v44);
      }
      [(NSLayoutConstraintExplainer *)self setMutuallyExclusiveConstraints:v41];
    }
  }
}

- (unint64_t)_satisfactionChangeCount:(id)a3 withResults:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(NSLayoutConstraintExplainer *)self satisfactionChanges]) {
    return 0;
  }
  if (a4) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  else {
    id v7 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(NSLayoutConstraintExplainer *)self satisfactionChanges];
  uint64_t v10 = [(NSMapTable *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v8 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(-[NSMapTable objectForKey:](-[NSLayoutConstraintExplainer satisfactionChanges](self, "satisfactionChanges"), "objectForKey:", v14), "floatValue");
        double v16 = v15;
        objc_msgSend(-[NSMapTable objectForKey:](-[NSLayoutConstraintExplainer priorities](self, "priorities"), "objectForKey:", v14), "floatValue");
        if ((*((unsigned int (**)(id, double, double))a3 + 2))(a3, v17, v16))
        {
          [v7 appendFormat:@"    %@:  satisfaction changes by %f\n", v14, *(void *)&v16];
          ++v8;
        }
      }
      uint64_t v11 = [(NSMapTable *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (a4) {
    *a4 = v7;
  }
  return v8;
}

- (id)description
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v39 = 0;
  objc_msgSend(v3, "appendFormat:", @"============= Satisfaction Explainer %p =============\n", -[NSLayoutConstraint _unsatisfaction:]((id *)&self->_constraint->super.isa, (double *)&v39), self);
  [v3 appendFormat:@"Target constraint: \n    %@\n", self->_constraint];
  if (![(NSLayoutConstraint *)self->_constraint isActive])
  {
    float v15 = @"\nThe constraint is not satisfied because it is inactive.\n";
LABEL_23:
    [v3 appendString:v15];
    return v3;
  }
  if (!-[NSLayoutConstraint _layoutEngine]((uint64_t)self->_constraint))
  {
    float v15 = @"\nThe constraint is active, but cannot be unsatisfied since there is no layout engine yet.\n";
    goto LABEL_23;
  }
  if ([(NSMutableSet *)self->_frozenConstraints count])
  {
    objc_msgSend(v3, "appendFormat:", @"\nFrozen constraints:     (thaw with 'po [%p thawConstraint:<address>]')\n", self);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    frozenConstraints = self->_frozenConstraints;
    uint64_t v5 = [(NSMutableSet *)frozenConstraints countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(frozenConstraints);
          }
          [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v35 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSMutableSet *)frozenConstraints countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v6);
    }
  }
  if ([(NSMutableSet *)self->_requiredConstraints count])
  {
    objc_msgSend(v3, "appendFormat:", @"\nRequired constraints:    (relax with 'po [%p relaxConstraint:<address>]')\n", self);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    requiredConstraints = self->_requiredConstraints;
    uint64_t v10 = [(NSMutableSet *)requiredConstraints countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(requiredConstraints);
          }
          [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v31 + 1) + 8 * j)];
        }
        uint64_t v11 = [(NSMutableSet *)requiredConstraints countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v11);
    }
  }
  [v3 appendFormat:@"\n"];
  [(NSLayoutConstraint *)self->_constraint unsatisfaction];
  if (v14 == 0.0)
  {
    objc_msgSend(v3, "appendFormat:", @"\nThe target constraint is already satisfied.\n", v23);
    return v3;
  }
  [(NSLayoutConstraintExplainer *)self recalculateExplanation];
  v30 = &stru_1EFB3B738;
  if (![(NSArray *)[(NSLayoutConstraintExplainer *)self mutuallyExclusiveConstraints] count])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __42__NSLayoutConstraintExplainer_description__block_invoke;
    v25[3] = &__block_descriptor_40_e11_B24__0d8d16l;
    v25[4] = v39;
    if ([(NSLayoutConstraintExplainer *)self _satisfactionChangeCount:v25 withResults:&v30])
    {
      [v3 appendString:@"Forcing the target constraint to be satisfied would make the following higher priority constraints less satisfied:\n\n"];
      [v3 appendString:v30];
      [v3 appendFormat:@"\nIf the above list only shows correct constraints, then the problem may lie with an even higher priority constraint that was unaffected because the layout engine was able to stretch one of these instead.  You can 'freeze' these correct constraints and re-print the explanation using this lldb command:\npo [%p freezeConstraint:<address-of-constraint>]\n\nThis will cause higher priority constraints to be shown.\n", self];
      return v3;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__NSLayoutConstraintExplainer_description__block_invoke_2;
    v24[3] = &__block_descriptor_40_e11_B24__0d8d16l;
    v24[4] = v39;
    if ([(NSLayoutConstraintExplainer *)self _satisfactionChangeCount:v24 withResults:&v30])
    {
      [v3 appendString:@"The target constraint can be satisfied without making any higher priority constraints less satisfied.  This probably means the layout is ambiguous, which in this case is probably due to opposing constraints of the same priority.  Here's a list of likely candidates:\n\n"];
      [v3 appendString:v30];
      [v3 appendFormat:@"\nIf you cannot alter the priority of the above constraints to resolve the ambiguity, then the problem may lie with a different same-priority constraint that was unaffected because the layout engine happened to stretch these instead.  You can 'freeze' these correct constraints and re-print the explanation using this lldb command:\npo [%p freezeConstraint:<address-of-constraint>]\n\nThis will potentially reveal other problematic constraints.\n", self];
      return v3;
    }
    [v3 appendString:@"Forcing the target constraint to be satisfied didn't seem to effect anything else of note.  This isn't something that should happen under normal circumstances.  Here's the list of all constraints with satisfaction changes.\n\n"];
    [(NSLayoutConstraintExplainer *)self _satisfactionChangeCount:&__block_literal_global_2 withResults:&v30];
    [v3 appendString:v30];
    float v15 = @"\nPlease file a radar with the entire Satisfaction Explainer output above, and include a sample app if possible.\n";
    goto LABEL_23;
  }
  if ([(NSArray *)[(NSLayoutConstraintExplainer *)self mutuallyExclusiveConstraints] containsObject:self->_constraint])
  {
    float v17 = @"The target constraint can't be satisfied because it's mutually exclusive with the following constraints:\n";
  }
  else
  {
    float v17 = @"The additional required constraints cannot be satisfied because the following set are mutually exclusive:\n";
  }
  [v3 appendFormat:v17];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v18 = [(NSLayoutConstraintExplainer *)self mutuallyExclusiveConstraints];
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        if (*(NSLayoutConstraint **)(*((void *)&v26 + 1) + 8 * k) != self->_constraint) {
          [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v26 + 1) + 8 * k)];
        }
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v20);
  }
  return v3;
}

BOOL __42__NSLayoutConstraintExplainer_description__block_invoke(uint64_t a1, double a2, double a3)
{
  return *(double *)(a1 + 32) < a2 && a3 < 0.0;
}

BOOL __42__NSLayoutConstraintExplainer_description__block_invoke_2(uint64_t a1, double a2, double a3)
{
  return *(double *)(a1 + 32) == a2 && a3 < 0.0;
}

uint64_t __42__NSLayoutConstraintExplainer_description__block_invoke_3()
{
  return 1;
}

- (id)requireConstraint:(id)a3
{
  if (self->_constraint != a3)
  {
    if (-[NSMutableSet containsObject:](self->_frozenConstraints, "containsObject:")) {
      [(NSLayoutConstraintExplainer *)self thawConstraint:a3];
    }
    [(NSMutableSet *)self->_requiredConstraints addObject:a3];
  }
  return self;
}

- (id)relaxConstraint:(id)a3
{
  return self;
}

- (id)freezeConstraint:(id)a3
{
  if (self->_constraint != a3)
  {
    if (-[NSMutableSet containsObject:](self->_requiredConstraints, "containsObject:")) {
      [(NSLayoutConstraintExplainer *)self relaxConstraint:a3];
    }
    [(NSMutableSet *)self->_frozenConstraints addObject:a3];
  }
  return self;
}

- (id)thawConstraint:(id)a3
{
  return self;
}

- (NSMapTable)satisfactionChanges
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSatisfactionChanges:(id)a3
{
}

- (NSMapTable)priorities
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPriorities:(id)a3
{
}

- (NSArray)mutuallyExclusiveConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMutuallyExclusiveConstraints:(id)a3
{
}

@end