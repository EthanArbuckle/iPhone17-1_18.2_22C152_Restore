@interface _HKCFGTerminal
+ (id)_terminalMatchingDoubleWithCondition:(id)a3;
+ (id)_terminalMatchingIntegerWithCondition:(id)a3;
+ (id)terminalMatchingAnyDouble;
+ (id)terminalMatchingAnyInteger;
+ (id)terminalMatchingCharacterInSet:(id)a3;
+ (id)terminalMatchingCharacterInString:(id)a3;
+ (id)terminalMatchingSequenceOfCharactersInSet:(id)a3;
+ (id)terminalMatchingString:(id)a3;
+ (id)terminalMatchingString:(id)a3 caseSensitive:(BOOL)a4;
- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4;
- (id)_label;
- (id)characterSet;
- (unint64_t)_minimumLength;
- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4;
@end

@implementation _HKCFGTerminal

- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  v7 = [a3 scanner];
  uint64_t v8 = [v7 scanLocation];
  id v12 = 0;
  BOOL v9 = [(_HKCFGTerminal *)self _scanValue:&v12 withScanner:v7];
  id v10 = v12;
  if (v9)
  {
    v11 = +[_HKCFGTerminalNode nodeWithValue:rangeOfString:](_HKCFGTerminalNode, "nodeWithValue:rangeOfString:", v10, v8, [v7 scanLocation] - v8);
    v6[2](v6, v11);
  }
  [v7 setScanLocation:v8];
}

+ (id)terminalMatchingString:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (![v7 length])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"_HKContextFreeGrammar.m" lineNumber:507 description:@"CFG terminal expression cannot be empty string"];
  }
  uint64_t v8 = objc_alloc_init(_HKCFGStringTerminal);
  [(_HKCFGStringTerminal *)v8 setString:v7];

  [(_HKCFGStringTerminal *)v8 setCaseSensitive:v4];

  return v8;
}

+ (id)terminalMatchingString:(id)a3
{
  return (id)[a1 terminalMatchingString:a3 caseSensitive:1];
}

+ (id)terminalMatchingCharacterInSet:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(_HKCFGCharacterTerminal);
  [(_HKCFGCharacterTerminal *)v4 setCharacterSet:v3];

  return v4;
}

+ (id)terminalMatchingCharacterInString:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:a3];
  v5 = [a1 terminalMatchingCharacterInSet:v4];

  return v5;
}

+ (id)terminalMatchingAnyInteger
{
  return (id)[a1 _terminalMatchingIntegerWithCondition:0];
}

+ (id)_terminalMatchingIntegerWithCondition:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(_HKCFGIntegerTerminal);
  [(_HKCFGIntegerTerminal *)v4 setCondition:v3];

  return v4;
}

+ (id)terminalMatchingAnyDouble
{
  return (id)[a1 _terminalMatchingDoubleWithCondition:0];
}

+ (id)_terminalMatchingDoubleWithCondition:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(_HKCFGDoubleTerminal);
  [(_HKCFGDoubleTerminal *)v4 setCondition:v3];

  return v4;
}

+ (id)terminalMatchingSequenceOfCharactersInSet:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(_HKCFGCharacterSequenceTerminal);
  [(_HKCFGCharacterSequenceTerminal *)v4 setCharacterSet:v3];

  return v4;
}

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  return 0;
}

- (id)_label
{
  return 0;
}

- (unint64_t)_minimumLength
{
  return 0;
}

- (id)characterSet
{
  return 0;
}

@end