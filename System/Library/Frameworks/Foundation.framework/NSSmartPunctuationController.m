@interface NSSmartPunctuationController
- (BOOL)smartDashesEnabled;
- (BOOL)smartQuotesEnabled;
- (NSSmartPunctuationClient)client;
- (NSSmartPunctuationController)init;
- (NSSmartQuoteOptions)smartQuoteOptions;
- (void)clientDidReplaceRange:(_NSRange)a3 changeInLength:(int64_t)a4;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setSmartDashesEnabled:(BOOL)a3;
- (void)setSmartQuoteOptions:(id)a3;
- (void)setSmartQuotesEnabled:(BOOL)a3;
@end

@implementation NSSmartPunctuationController

- (NSSmartPunctuationController)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSSmartPunctuationController;
  v2 = [(NSSmartPunctuationController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_types = 192;
    v2->_options = [[NSSmartQuoteOptions alloc] initWithLeftSingleQuote:@"‘" rightSingleQuote:@"’" apostrophe:@"’" leftDoubleQuote:@"“" rightDoubleQuote:@"”"];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->_client = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSmartPunctuationController;
  [(NSSmartPunctuationController *)&v3 dealloc];
}

- (NSSmartQuoteOptions)smartQuoteOptions
{
  v2 = self->_options;

  return v2;
}

- (void)setSmartQuoteOptions:(id)a3
{
  options = self->_options;
  if (options != a3)
  {

    self->_options = (NSSmartQuoteOptions *)[a3 copy];
  }
}

- (BOOL)smartQuotesEnabled
{
  return (LOBYTE(self->_types) >> 6) & 1;
}

- (void)setSmartQuotesEnabled:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_types = self->_types & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)smartDashesEnabled
{
  return LOBYTE(self->_types) >> 7;
}

- (void)setSmartDashesEnabled:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_types = self->_types & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (NSSmartPunctuationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  self->_client = (NSSmartPunctuationClient *)a3;
}

- (void)clientDidReplaceRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  if (a3.location) {
    NSUInteger v4 = a3.location - 1;
  }
  else {
    NSUInteger v4 = 0;
  }
  NSUInteger v5 = a3.location != 0;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a3.location) {
    NSUInteger v6 = a3.location - 1;
  }
  else {
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = 1;
  if (a3.location) {
    uint64_t v7 = 2;
  }
  if (self->_client)
  {
    if (self->_options)
    {
      NSUInteger v9 = a3.length + a4;
      NSUInteger v10 = v7 + a3.length + a4;
      if (v10)
      {
        NSUInteger location = a3.location;
        if ([(NSSmartPunctuationController *)self smartQuotesEnabled])
        {
          uint64_t v47 = 0;
          unint64_t v48 = 0;
          v12 = (void *)-[NSSmartPunctuationClient substringForProposedRange:actualRange:](self->_client, "substringForProposedRange:actualRange:", v4, v10, &v47);
          if (v12)
          {
            if (v48)
            {
              v13 = v12;
              uint64_t v14 = [v12 length];
              if (v14 == v48)
              {
                v42 = (void *)[MEMORY[0x1E4F1CA48] array];
                v45 = +[NSCharacterSet alphanumericCharacterSet];
                v43 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
                if (!clientDidReplaceRange_changeInLength__openerCharacterSet) {
                  clientDidReplaceRange_changeInLength__openerCharacterSet = objc_retain(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", +[NSString stringWithFormat:@"([{</@-=%C%C"), 8211, 8212]);
                }
                if (v48)
                {
                  unint64_t v15 = 0;
                  NSUInteger v16 = v9 + location;
                  NSUInteger v44 = v9 + location;
                  do
                  {
                    int v17 = [v13 characterAtIndex:v15];
                    NSUInteger v18 = v47 + v15;
                    if ((v47 + v15 - v6 >= v5 || v18 < v6) && v18 != v16)
                    {
                      int v21 = v17;
                      if (v17 == 39 || v17 == 34)
                      {
                        if (v15)
                        {
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v43, 12, 0, v15);
                          BOOL v23 = v22 != 0;
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", clientDidReplaceRange_changeInLength__openerCharacterSet, 12, 0, v15);
                          BOOL v25 = v24 != 0;
                          objc_msgSend(v13, "rangeOfString:options:range:", -[NSSmartQuoteOptions leftSingleQuote](self->_options, "leftSingleQuote"), 12, 0, v15);
                          BOOL v46 = v26 != 0;
                          objc_msgSend(v13, "rangeOfString:options:range:", -[NSSmartQuoteOptions leftDoubleQuote](self->_options, "leftDoubleQuote"), 12, 0, v15);
                          BOOL v28 = v27 != 0;
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v45, 12, 0, v15);
                          BOOL v30 = v29 != 0;
                        }
                        else
                        {
                          BOOL v25 = 0;
                          BOOL v46 = 0;
                          BOOL v28 = 0;
                          BOOL v30 = 0;
                          BOOL v23 = 0;
                        }
                        if (v15 + 1 >= v48)
                        {
                          BOOL v33 = 0;
                        }
                        else
                        {
                          BOOL v31 = v30;
                          objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v45, 8);
                          BOOL v30 = v31;
                          BOOL v33 = v32 != 0;
                        }
                        int v34 = v23 || v25;
                        if (v21 == 34)
                        {
                          options = self->_options;
                          NSUInteger v16 = v44;
                          if ((v34 | v46) == 1) {
                            v36 = [(NSSmartQuoteOptions *)options leftDoubleQuote];
                          }
                          else {
                            v36 = [(NSSmartQuoteOptions *)options rightDoubleQuote];
                          }
                        }
                        else
                        {
                          NSUInteger v16 = v44;
                          if ((v34 | v28) == 1)
                          {
                            v36 = [(NSSmartQuoteOptions *)self->_options leftSingleQuote];
                          }
                          else
                          {
                            v37 = self->_options;
                            if (v30 && v33) {
                              v36 = [(NSSmartQuoteOptions *)v37 apostrophe];
                            }
                            else {
                              v36 = [(NSSmartQuoteOptions *)v37 rightSingleQuote];
                            }
                          }
                        }
                        v38 = v36;
                        objc_msgSend(v13, "rangeOfString:options:range:", v36, 8, v15, 1);
                        if (!v39)
                        {
                          v40 = [NSQuoteCheckingResult alloc];
                          v41 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](v40, "initWithRange:replacementString:", v47 + v15, 1, v38);
                          [v42 addObject:v41];
                        }
                      }
                    }
                    ++v15;
                  }
                  while (v15 < v48);
                }
                if ([v42 count]) {
                  [(NSSmartPunctuationClient *)self->_client applySmartPunctuationResults:v42];
                }
              }
            }
          }
        }
      }
    }
  }
}

@end