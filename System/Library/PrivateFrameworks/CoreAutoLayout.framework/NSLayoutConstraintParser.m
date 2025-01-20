@interface NSLayoutConstraintParser
+ (id)constraintsWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6;
- (NSLayoutConstraintParser)initWithFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6;
- (_NSRange)rangeOfName;
- (double)parseConstant;
- (id)constraints;
- (id)description;
- (id)parseView;
- (uint64_t)descriptionLineWithCurrentCharacterPointer;
- (uint64_t)layoutItemForKey:(uint64_t)result;
- (uint64_t)metricForKey:(uint64_t)result;
- (void)dealloc;
- (void)failWithDescription:(id)a3;
- (void)findContainerView;
- (void)finishConstraint;
- (void)flushWidthConstraints;
- (void)parse;
- (void)parseConnection;
- (void)parseOp;
- (void)parsePredicate;
- (void)parsePredicateList;
- (void)parsePredicateWithParentheses;
@end

@implementation NSLayoutConstraintParser

+ (id)constraintsWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6
{
  v6 = [[NSLayoutConstraintParser alloc] initWithFormat:a3 options:a4 metrics:a5 views:a6];
  [(NSLayoutConstraintParser *)v6 parse];
  id v7 = [(NSLayoutConstraintParser *)v6 constraints];

  return v7;
}

- (void)parse
{
  if (self->_currentCharacter) {
    return;
  }
  unint64_t lineLength = self->_lineLength;
  if (lineLength)
  {
    lineChars = self->_lineChars;
    int v5 = *(unsigned __int8 *)lineChars;
    if (v5 == 72)
    {
      self->_useHorizontalArrangement = 1;
      self->_unint64_t currentCharacter = 1;
      if (lineLength < 2 || lineChars[1] != 58)
      {
        v6 = @"Expected ':' after 'H' to specify horizontal arrangement";
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    if (v5 == 86)
    {
      self->_useHorizontalArrangement = 0;
      self->_unint64_t currentCharacter = 1;
      if (lineLength < 2 || lineChars[1] != 58)
      {
        v6 = @"Expected ':' after 'V' to specify vertical arrangement";
LABEL_13:
        [(NSLayoutConstraintParser *)self failWithDescription:v6];
        goto LABEL_14;
      }
LABEL_11:
      self->_unint64_t currentCharacter = 2;
      goto LABEL_14;
    }
  }
  self->_useHorizontalArrangement = 1;
LABEL_14:
  unint64_t currentCharacter = self->_currentCharacter;
  unint64_t v8 = self->_lineLength;
  if (currentCharacter < v8 && self->_lineChars[currentCharacter] == 124)
  {
    self->_parsedLeftView = 0;
    unint64_t v9 = currentCharacter + 1;
    self->_unint64_t currentCharacter = v9;
    if (v9 >= v8)
    {
      [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a connection after the '|' character"];
    }
    else
    {
      [(NSLayoutConstraintParser *)self parseConnection];
      self->_parsedRightView = (NSLayoutItem *)[(NSLayoutConstraintParser *)self parseView];
      [(NSLayoutConstraintParser *)self finishConstraint];
      [(NSLayoutConstraintParser *)self flushWidthConstraints];
      self->_parsedLeftView = self->_parsedRightView;
      self->_parsedRightView = 0;
    }
  }
  else
  {
    self->_parsedLeftView = (NSLayoutItem *)[(NSLayoutConstraintParser *)self parseView];
    [(NSLayoutConstraintParser *)self flushWidthConstraints];
  }
  unint64_t v10 = self->_currentCharacter;
  unint64_t v11 = self->_lineLength;
  if (v10 >= v11) {
    goto LABEL_29;
  }
  while (1)
  {
    [(NSLayoutConstraintParser *)self parseConnection];
    unint64_t v12 = self->_currentCharacter;
    if (v12 < self->_lineLength)
    {
      int v13 = self->_lineChars[v12];
      if (v13 == 91)
      {
        self->_parsedRightView = (NSLayoutItem *)[(NSLayoutConstraintParser *)self parseView];
        [(NSLayoutConstraintParser *)self finishConstraint];
        [(NSLayoutConstraintParser *)self flushWidthConstraints];
        self->_parsedLeftView = self->_parsedRightView;
        self->_parsedRightView = 0;
        goto LABEL_25;
      }
      if (v13 == 124) {
        break;
      }
    }
    [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a view or '|'"];
LABEL_25:
    unint64_t v10 = self->_currentCharacter;
    unint64_t v11 = self->_lineLength;
    if (v10 >= v11) {
      goto LABEL_29;
    }
  }
  self->_unint64_t currentCharacter = v12 + 1;
  self->_parsedRightView = 0;
  [(NSLayoutConstraintParser *)self finishConstraint];
  self->_parsedLeftView = 0;
  self->_parsedRightView = 0;
  unint64_t v10 = self->_currentCharacter;
  unint64_t v11 = self->_lineLength;
LABEL_29:
  if (v10 < v11) {
    [(NSLayoutConstraintParser *)self failWithDescription:@"Expected the end of the format string"];
  }
  constraints = self->_constraints;
  alignmentConstraints = self->_alignmentConstraints;
  [(NSMutableArray *)constraints addObjectsFromArray:alignmentConstraints];
}

- (void)finishConstraint
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obj = self->_incompleteConstraints;
  uint64_t v48 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v48)
  {
    char v46 = 0;
    p_parsedLeftView = &self->_parsedLeftView;
    p_parsedRightView = &self->_parsedRightView;
    uint64_t v47 = *(void *)v50;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v50 != v47) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v49 + 1) + 8 * v3);
        if (self->_parsedConstrainedWidthView)
        {
          [*(id *)(*((void *)&v49 + 1) + 8 * v3) _setFirstItem:p_parsedLeftView attribute:p_parsedRightView];
          p_unflushedWidthConstraints = &self->_unflushedWidthConstraints;
        }
        else
        {
          if (!self->_useHorizontalArrangement
            || (id v7 = p_parsedLeftView, v6 = p_parsedRightView, (self->_opts & 0x30000) != 0x20000))
          {
            v6 = p_parsedLeftView;
            id v7 = p_parsedRightView;
          }
          unint64_t v8 = *v7;
          unint64_t v9 = *v6;
          if (UseMarginAttributesForDefaultSpacingToSuperview_onceToken != -1) {
            dispatch_once(&UseMarginAttributesForDefaultSpacingToSuperview_onceToken, &__block_literal_global_825);
          }
          if (UseMarginAttributesForDefaultSpacingToSuperview_wantsMarginAttributeSupport) {
            int v10 = objc_msgSend((id)objc_msgSend(v4, "symbolicConstant"), "isEqualToString:", @"NSSpace");
          }
          else {
            int v10 = 0;
          }
          unint64_t opts = self->_opts;
          uint64_t v12 = opts & 0x30000;
          if (_CAL_sdk_version_mask)
          {
            if (self->_useHorizontalArrangement && (opts & 0x80000) != 0) {
              [(NSLayoutConstraintParser *)self failWithDescription:@"BaselineToBaseline format option not valid for horizontal layout"];
            }
            if (v9)
            {
              uint64_t v17 = 4;
              if ((opts & 0x80000) != 0) {
                uint64_t v17 = 11;
              }
              uint64_t v18 = 2;
              if (!v12) {
                uint64_t v18 = 6;
              }
              if (self->_useHorizontalArrangement) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v17;
              }
              v20 = v4;
              containerView = v9;
            }
            else
            {
              [(NSLayoutConstraintParser *)self findContainerView];
              containerView = self->_containerView;
              if (v10) {
                containerView = (NSLayoutItem *)[(NSLayoutItem *)self->_containerView nsli_layoutMarginsItem];
              }
              uint64_t v24 = 5;
              if (v12) {
                uint64_t v24 = 1;
              }
              if (self->_useHorizontalArrangement) {
                uint64_t v19 = v24;
              }
              else {
                uint64_t v19 = 3;
              }
              v20 = v4;
            }
            objc_msgSend(v20, "_setSecondItem:attribute:", containerView, v19, p_parsedLeftView, p_parsedRightView);
            if (v8)
            {
              uint64_t v25 = 3;
              if ((opts & 0x80000) != 0) {
                uint64_t v25 = 12;
              }
              uint64_t v26 = 5;
              if (v12) {
                uint64_t v26 = 1;
              }
              if (self->_useHorizontalArrangement) {
                uint64_t v27 = v26;
              }
              else {
                uint64_t v27 = v25;
              }
              [v4 _setFirstItem:v8 attribute:v27];
            }
            else
            {
              [(NSLayoutConstraintParser *)self findContainerView];
              v28 = self->_containerView;
              if (v10) {
                v28 = (NSLayoutItem *)[(NSLayoutItem *)self->_containerView nsli_layoutMarginsItem];
              }
              uint64_t v29 = 2;
              if (!v12) {
                uint64_t v29 = 6;
              }
              if (self->_useHorizontalArrangement) {
                uint64_t v30 = v29;
              }
              else {
                uint64_t v30 = 4;
              }
              [v4 _setFirstItem:v28 attribute:v30];
              if (!v9) {
                [(NSLayoutConstraintParser *)self failWithDescription:@"No view was specified for this constraint"];
              }
            }
          }
          else
          {
            if (v9)
            {
              uint64_t v13 = 2;
              if (!v12) {
                uint64_t v13 = 6;
              }
              if (self->_useHorizontalArrangement) {
                uint64_t v14 = v13;
              }
              else {
                uint64_t v14 = 4;
              }
              v15 = v4;
              v16 = v9;
            }
            else
            {
              [(NSLayoutConstraintParser *)self findContainerView];
              if (self->_useHorizontalArrangement)
              {
                uint64_t v22 = 5;
                if (v10) {
                  uint64_t v22 = 17;
                }
                uint64_t v23 = 13;
                if (!v10) {
                  uint64_t v23 = 1;
                }
                if (v12) {
                  uint64_t v14 = v23;
                }
                else {
                  uint64_t v14 = v22;
                }
              }
              else if (v10)
              {
                uint64_t v14 = 15;
              }
              else
              {
                uint64_t v14 = 3;
              }
              v16 = self->_containerView;
              v15 = v4;
            }
            objc_msgSend(v15, "_setSecondItem:attribute:", v16, v14, p_parsedLeftView, p_parsedRightView);
            if (v8)
            {
              uint64_t v31 = 5;
              if (v12) {
                uint64_t v31 = 1;
              }
              if (self->_useHorizontalArrangement) {
                uint64_t v32 = v31;
              }
              else {
                uint64_t v32 = 3;
              }
              [v4 _setFirstItem:v8 attribute:v32];
            }
            else
            {
              [(NSLayoutConstraintParser *)self findContainerView];
              if (self->_useHorizontalArrangement)
              {
                BOOL v33 = v10 == 0;
                if (v12)
                {
                  uint64_t v34 = 2;
                  uint64_t v35 = 14;
                }
                else
                {
                  uint64_t v34 = 6;
                  uint64_t v35 = 18;
                }
              }
              else
              {
                BOOL v33 = v10 == 0;
                uint64_t v34 = 4;
                uint64_t v35 = 16;
              }
              if (v33) {
                uint64_t v36 = v34;
              }
              else {
                uint64_t v36 = v35;
              }
              [v4 _setFirstItem:self->_containerView attribute:v36];
              if (!v9) {
                [(NSLayoutConstraintParser *)self failWithDescription:@"No view was specified for this constraint"];
              }
            }
            if (v9) {
              BOOL v37 = v8 == 0;
            }
            else {
              BOOL v37 = 1;
            }
            if (v37 && ((v10 ^ 1) & 1) == 0)
            {
              [v4 setSymbolicConstant:0];
              [v4 setConstant:0.0];
            }
          }
          int opts_low = LOWORD(self->_opts);
          p_unflushedWidthConstraints = &self->_constraints;
          if (!((LOWORD(self->_opts) == 0) | v46 & 1))
          {
            for (uint64_t i = 1; i != 13; ++i)
            {
              if ((opts_low & (1 << i)) != 0 && v9 != 0 && v8 != 0)
              {
                if (self->_useHorizontalArrangement == ((i > 0xC) | (0x2E6u >> i) & 1))
                {
                  v42 = @"Options mask required views to be aligned on a horizontal edge, which is not allowed for layout that is also horizontal.";
                  if (i <= 0xC) {
                    v42 = off_1E5C574B8[i];
                  }
                  [(NSLayoutConstraintParser *)self failWithDescription:v42];
                }
                [(NSMutableArray *)self->_alignmentConstraints addObject:+[NSLayoutConstraint constraintWithItem:v9 attribute:i relatedBy:0 toItem:v8 attribute:i]];
              }
            }
            char v46 = 1;
            p_unflushedWidthConstraints = &self->_constraints;
          }
        }
        ConstraintDidPerformInitialSetup((uint64_t)v4);
        [(NSMutableArray *)*p_unflushedWidthConstraints addObject:v4];
        ++v3;
      }
      while (v3 != v48);
      uint64_t v48 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v48);
  }
  [(NSMutableArray *)self->_incompleteConstraints removeAllObjects];
}

- (void)parseConnection
{
  unint64_t currentCharacter = self->_currentCharacter;
  unint64_t lineLength = self->_lineLength;
  if (currentCharacter >= lineLength || (lineChars = self->_lineChars, lineChars[currentCharacter] != 45))
  {
    unint64_t v11 = objc_alloc_init(NSLayoutConstraint);
    *(_DWORD *)((char *)&v11->_layoutConstraintFlags + 2) |= 0x40u;
    [(NSLayoutConstraint *)v11 _setRelation:0];
    goto LABEL_8;
  }
  unint64_t v6 = currentCharacter + 1;
  self->_unint64_t currentCharacter = v6;
  if (v6 < lineLength)
  {
    int v7 = lineChars[v6];
    if (v7 == 124 || v7 == 91)
    {
      unint64_t v11 = objc_alloc_init(NSLayoutConstraint);
      *(_DWORD *)((char *)&v11->_layoutConstraintFlags + 2) |= 0x40u;
      [(NSLayoutConstraint *)v11 _setRelation:0];
      [(NSLayoutConstraint *)v11 setSymbolicConstant:@"NSSpace"];
LABEL_8:
      [(NSMutableArray *)self->_incompleteConstraints addObject:v11];

      return;
    }
  }
  [(NSLayoutConstraintParser *)self parsePredicateWithParentheses];
  unint64_t v8 = self->_currentCharacter;
  if (v8 < self->_lineLength)
  {
    int v9 = self->_lineChars[v8];
    if (v9 == 44)
    {
      int v10 = @"Expected a '-' here. To specify a list of constraints, you must use parentheses around the list of constraints";
      goto LABEL_17;
    }
    if (v9 == 45)
    {
      self->_unint64_t currentCharacter = v8 + 1;
      return;
    }
  }
  int v10 = @"Expected a '-' here";
LABEL_17:
  [(NSLayoutConstraintParser *)self failWithDescription:v10];
}

- (void)findContainerView
{
  parsedLeftView = self->_parsedLeftView;
  if (!parsedLeftView) {
    parsedLeftView = self->_parsedRightView;
  }
  v4 = (NSLayoutItem *)[(NSLayoutItem *)parsedLeftView nsli_superitem];
  self->_containerView = v4;
  if (!v4)
  {
    [(NSLayoutConstraintParser *)self failWithDescription:@"Unable to interpret '|' character, because the related view doesn't have a superview"];
  }
}

- (void)parsePredicate
{
  [(NSLayoutConstraintParser *)self parseOp];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_incompleteConstraints lastObject];
  [(NSLayoutConstraintParser *)self parseConstant];
  objc_msgSend(v3, "setConstant:");
  unint64_t currentCharacter = self->_currentCharacter;
  if (currentCharacter >= self->_lineLength || self->_lineChars[currentCharacter] != 64) {
    return;
  }
  self->_unint64_t currentCharacter = currentCharacter + 1;
  [(NSLayoutConstraintParser *)self parseConstant];
  if (v5 <= 0.0)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid priority specified: %g. Priority must be greater than 0", *(void *)&v5);
    goto LABEL_8;
  }
  if (v5 > 1000.0)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid priority specified: %g. Priority cannot be higher than NSLayoutPriorityRequired, which is 1000.", *(void *)&v5];
LABEL_8:
    [(NSLayoutConstraintParser *)self failWithDescription:v6];
    return;
  }
  *(float *)&double v5 = v5;
  [v3 setPriority:v5];
}

- (double)parseConstant
{
  unint64_t currentCharacter = self->_currentCharacter;
  if (currentCharacter >= self->_lineLength) {
    goto LABEL_15;
  }
  v4 = &self->_lineChars[currentCharacter];
  int v5 = *(unsigned __int8 *)v4;
  if (v5 != 45 && (v5 - 48) > 9)
  {
    if (v5 == 95 || (v5 & 0xFFFFFFDF) - 65 <= 0x19)
    {
      uint64_t v12 = [(NSLayoutConstraintParser *)self rangeOfName];
      uint64_t v14 = (void *)[[NSString alloc] initWithBytes:&self->_lineChars[v12] length:v13 encoding:1];
      id v15 = [(NSDictionary *)self->_metrics objectForKey:v14];
      if (v15)
      {
        [v15 doubleValue];
        double v7 = v16;
LABEL_27:

        return v7;
      }
      id v18 = [(NSDictionary *)self->_views objectForKey:v14];
      if (v18)
      {
        if (self->_parsedConstrainedWidthView)
        {
          id v19 = v18;
          v20 = (void *)[(NSMutableArray *)self->_incompleteConstraints lastObject];
          if (self->_useHorizontalArrangement) {
            uint64_t v21 = 7;
          }
          else {
            uint64_t v21 = 8;
          }
          [v20 _setSecondItem:v19 attribute:v21];
          goto LABEL_26;
        }
        uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"It's not possible to set a space equal to the width or height of a view.  Perhaps you want to use a view as a spacer? [view1][spacer(==view1)][view2]", v23);
      }
      else
      {
        uint64_t v22 = [NSString stringWithFormat:@"Encountered metric with name \"%@\", but value was not specified in metrics or views dictionaries", v14];
      }
      [(NSLayoutConstraintParser *)self failWithDescription:v22];
LABEL_26:
      double v7 = 0.0;
      goto LABEL_27;
    }
LABEL_15:
    [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a number or key from the metrics dictionary, but encountered something else"];
    return 0.0;
  }
  uint64_t v24 = 0;
  double v7 = strtod_l(v4, &v24, 0);
  unint64_t v8 = self->_currentCharacter;
  int v9 = (char *)&self->_lineChars[v8];
  int v10 = (char *)(v24 - v9);
  if (v24 == v9)
  {
    [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a number or a key from the metrics dictionary, but encountered something else"];
    unint64_t v8 = self->_currentCharacter;
  }
  self->_unint64_t currentCharacter = (unint64_t)&v10[v8];
  return v7;
}

- (void)parseOp
{
  unint64_t currentCharacter = self->_currentCharacter;
  if (currentCharacter < self->_lineLength)
  {
    int v4 = self->_lineChars[currentCharacter];
    if ((v4 - 60) > 2)
    {
      unint64_t v8 = objc_alloc_init(NSLayoutConstraint);
      [(NSLayoutConstraint *)v8 _setRelation:0];
      goto LABEL_19;
    }
    switch(v4)
    {
      case '<':
        int v5 = objc_alloc_init(NSLayoutConstraint);
        unint64_t v8 = v5;
        uint64_t v6 = -1;
        break;
      case '>':
        int v5 = objc_alloc_init(NSLayoutConstraint);
        unint64_t v8 = v5;
        uint64_t v6 = 1;
        break;
      case '=':
        int v5 = objc_alloc_init(NSLayoutConstraint);
        unint64_t v8 = v5;
        uint64_t v6 = 0;
        break;
      default:
        unint64_t v8 = 0;
        goto LABEL_15;
    }
    [(NSLayoutConstraint *)v5 _setRelation:v6];
LABEL_15:
    unint64_t v7 = self->_currentCharacter;
    self->_unint64_t currentCharacter = v7 + 1;
    if (v7 + 1 < self->_lineLength && self->_lineChars[v7 + 1] == 61) {
      self->_unint64_t currentCharacter = v7 + 2;
    }
    else {
      [(NSLayoutConstraintParser *)self failWithDescription:@"Unknown relation. Must be ==, >=, or <="];
    }
LABEL_19:
    if (v8)
    {
      *(_DWORD *)((char *)&v8->_layoutConstraintFlags + 2) |= 0x40u;
      [(NSMutableArray *)self->_incompleteConstraints addObject:v8];
    }
    return;
  }
  [(NSLayoutConstraintParser *)self failWithDescription:@"Expected more input"];
}

- (id)parseView
{
  unint64_t currentCharacter = self->_currentCharacter;
  unint64_t lineLength = self->_lineLength;
  if (currentCharacter < lineLength && self->_lineChars[currentCharacter] == 91)
  {
    unint64_t v5 = currentCharacter + 1;
    self->_unint64_t currentCharacter = v5;
    if (v5 >= lineLength) {
      [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a view"];
    }
    uint64_t v6 = [(NSLayoutConstraintParser *)self rangeOfName];
    uint64_t v8 = v7;
    if (!v7) {
      [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a view. View names must start with a letter or an underscore, then contain letters, numbers, and underscores."];
    }
    int v9 = (void *)[[NSString alloc] initWithBytes:&self->_lineChars[v6] length:v8 encoding:1];
    int v10 = [(NSDictionary *)self->_views objectForKey:v9];
    if (!v10) {
      -[NSLayoutConstraintParser failWithDescription:](self, "failWithDescription:", [NSString stringWithFormat:@"%@ is not a key in the views dictionary.", v9]);
    }

    self->_parsedConstrainedWidthView = v10;
    unint64_t v11 = self->_currentCharacter;
    unint64_t v12 = self->_lineLength;
    if (v11 < v12)
    {
      int v13 = self->_lineChars[v11];
      if (v13 == 93)
      {
        self->_unint64_t currentCharacter = v11 + 1;
        goto LABEL_21;
      }
      if (v13 == 40)
      {
        unint64_t v14 = v11 + 1;
        self->_unint64_t currentCharacter = v14;
        if (v14 >= v12) {
          [(NSLayoutConstraintParser *)self failWithDescription:@"Unexpectedly ran out of character fodder in the middle of parsing a view"];
        }
        incompleteConstraints = self->_incompleteConstraints;
        self->_incompleteConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSLayoutConstraintParser *)self parsePredicateList];
        unint64_t v16 = self->_currentCharacter;
        unint64_t v17 = self->_lineLength;
        if (v16 < v17 && (lineChars = self->_lineChars, lineChars[v16] == 41))
        {
          self->_unint64_t currentCharacter = v16 + 1;
          if (v16 + 1 < v17 && lineChars[v16 + 1] == 93)
          {
            self->_unint64_t currentCharacter = v16 + 2;
            [(NSLayoutConstraintParser *)self finishConstraint];
LABEL_26:

            self->_incompleteConstraints = incompleteConstraints;
            goto LABEL_21;
          }
          v20 = @"Expected ']' after specifying thickness.";
        }
        else
        {
          v20 = @"A predicate on a view's thickness must end with '' and the view must end with ']'");
        }
        [(NSLayoutConstraintParser *)self failWithDescription:v20];
        goto LABEL_26;
      }
    }
    [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a ']' here. That is how you give the end of a view."];
LABEL_21:
    self->_parsedConstrainedWidthView = 0;
    return v10;
  }
  [(NSLayoutConstraintParser *)self failWithDescription:@"Expected a view"];
  return 0;
}

- (_NSRange)rangeOfName
{
  NSUInteger currentCharacter = self->_currentCharacter;
  unint64_t lineLength = self->_lineLength;
  NSUInteger v5 = currentCharacter;
  if (currentCharacter < lineLength)
  {
    lineChars = self->_lineChars;
    int v7 = lineChars[currentCharacter];
    BOOL v8 = v7 != 95 && (v7 & 0xFFFFFFDF) - 65 > 0x19;
    NSUInteger v5 = currentCharacter;
    if (!v8)
    {
      unint64_t v9 = currentCharacter + 1;
      do
      {
        NSUInteger v5 = v9;
        self->_NSUInteger currentCharacter = v9;
        if (v9 >= lineLength) {
          break;
        }
        int v10 = lineChars[v9++];
      }
      while ((v10 - 48) < 0xA || v10 == 95 || (v10 & 0xFFFFFFDF) - 65 < 0x1A);
    }
  }
  NSUInteger v12 = v5 - currentCharacter;
  result.length = v12;
  result.location = currentCharacter;
  return result;
}

- (void)flushWidthConstraints
{
  [(NSMutableArray *)self->_constraints addObjectsFromArray:self->_unflushedWidthConstraints];
  unflushedWidthConstraints = self->_unflushedWidthConstraints;
  [(NSMutableArray *)unflushedWidthConstraints removeAllObjects];
}

- (NSLayoutConstraintParser)initWithFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)NSLayoutConstraintParser;
  int v10 = [(NSLayoutConstraintParser *)&v15 init];
  if (v10)
  {
    _CALSDKVersionInit();
    v10->_line = (NSString *)a3;
    v10->_lineChars = (const char *)[a3 cStringUsingEncoding:1];
    v10->_unint64_t lineLength = [a3 lengthOfBytesUsingEncoding:1];
    v10->_unint64_t opts = a4;
    v10->_NSUInteger currentCharacter = 0;
    v10->_constraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10->_incompleteConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10->_unflushedWidthConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (LOWORD(v10->_opts)) {
      v10->_alignmentConstraints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v10->_metrics = (NSDictionary *)a5;
    v10->_views = (NSDictionary *)a6;
    if (v10->_lineLength)
    {
      if (v10->_lineChars) {
        return v10;
      }
      NSUInteger v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      unint64_t v14 = @"Unable to parse constraint format: It contains non-ASCII characters.";
    }
    else
    {
      NSUInteger v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      unint64_t v14 = @"Unable to parse constraint format: It's an empty string.";
    }
    objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v14 userInfo:0]);
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraintParser;
  [(NSLayoutConstraintParser *)&v3 dealloc];
}

- (id)constraints
{
  v2 = self->_constraints;
  return v2;
}

- (void)parsePredicateWithParentheses
{
  unint64_t currentCharacter = self->_currentCharacter;
  if (currentCharacter < self->_lineLength)
  {
    int v4 = self->_lineChars[currentCharacter];
    if (v4 == 45)
    {
      uint64_t v6 = @"Cannot tell if this - is a minus sign or an accidental extra bar in the connection. Use parentheses around negative numbers.";
LABEL_12:
      [(NSLayoutConstraintParser *)self failWithDescription:v6];
      return;
    }
    if (v4 == 40)
    {
      self->_unint64_t currentCharacter = currentCharacter + 1;
      [(NSLayoutConstraintParser *)self parsePredicateList];
      unint64_t v5 = self->_currentCharacter;
      if (v5 < self->_lineLength && self->_lineChars[v5] == 41)
      {
        self->_unint64_t currentCharacter = v5 + 1;
        return;
      }
      uint64_t v6 = @"Expected a '' at the end of a constraint modifier, or a ',' before another constraint modifier");
      goto LABEL_12;
    }
  }
  [(NSLayoutConstraintParser *)self parsePredicate];
}

- (void)parsePredicateList
{
  for (uint64_t i = self; ; self = i)
  {
    [(NSLayoutConstraintParser *)self parsePredicate];
    unint64_t currentCharacter = i->_currentCharacter;
    if (currentCharacter >= i->_lineLength || i->_lineChars[currentCharacter] != 44) {
      break;
    }
    i->_unint64_t currentCharacter = currentCharacter + 1;
  }
}

- (uint64_t)descriptionLineWithCurrentCharacterPointer
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)[MEMORY[0x1E4F28E78] string];
    unint64_t v3 = 0;
    unint64_t v4 = *(void *)(v1 + 96);
    do
    {
      if (v3 == v4) {
        unint64_t v5 = @"^";
      }
      else {
        unint64_t v5 = @" ";
      }
      [v2 appendFormat:v5];
      ++v3;
      unint64_t v4 = *(void *)(v1 + 96);
    }
    while (v3 <= v4);
    return [NSString stringWithFormat:@"%@ \n%@", *(void *)(v1 + 8), v2];
  }
  return result;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p \n%@>", v4, self, -[NSLayoutConstraintParser descriptionLineWithCurrentCharacterPointer]((uint64_t)self)];
}

- (void)failWithDescription:(id)a3
{
  unint64_t v5 = (void *)[MEMORY[0x1E4F28E78] string];
  unint64_t v6 = 0;
  unint64_t currentCharacter = self->_currentCharacter;
  while (1)
  {
    if (v6 == currentCharacter) {
      BOOL v8 = @"^";
    }
    else {
      BOOL v8 = @" ";
    }
    [v5 appendFormat:v8];
    ++v6;
    unint64_t currentCharacter = self->_currentCharacter;
    if (v6 > currentCharacter)
    {
      unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unable to parse constraint format: \n%@ \n%@", a3, -[NSLayoutConstraintParser descriptionLineWithCurrentCharacterPointer]((uint64_t)self)), 0 reason userInfo];
      objc_exception_throw(v9);
    }
  }
}

- (uint64_t)metricForKey:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 48) objectForKey:a2];
  }
  return result;
}

- (uint64_t)layoutItemForKey:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 56) objectForKey:a2];
  }
  return result;
}

@end