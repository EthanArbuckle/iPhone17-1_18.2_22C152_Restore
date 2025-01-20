@interface _FEDebugReportFormatter
+ (id)defaultFormatter;
- (NSString)indentString;
- (_FEDebugReportFormatter)init;
- (id)stringFromReportComponents:(id)a3;
- (unint64_t)extraBodyIndentLevel;
- (unint64_t)indentLevel;
- (void)setExtraBodyIndentLevel:(unint64_t)a3;
- (void)setIndentLevel:(unint64_t)a3;
- (void)setIndentString:(id)a3;
@end

@implementation _FEDebugReportFormatter

+ (id)defaultFormatter
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_FEDebugReportFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)_FEDebugReportFormatter;
  id v2 = [(_FEDebugReportFormatter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    indentString = v2->_indentString;
    v2->_indentString = (NSString *)@"\t";
  }
  return v3;
}

- (id)stringFromReportComponents:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_FEDebugReport.m", 29, @"Invalid parameter not satisfying: %@", @"components" object file lineNumber description];
  }
  objc_super v6 = [MEMORY[0x263F089D8] string];
  v7 = [v5 header];
  if (([v7 isEqualToString:&stru_2700CBC00] & 1) == 0) {
    [v6 appendFormat:@"%@\n", v7];
  }
  v8 = [v5 body];
  if (([v8 isEqualToString:&stru_2700CBC00] & 1) == 0)
  {
    unint64_t extraBodyIndentLevel = self->_extraBodyIndentLevel;
    if (extraBodyIndentLevel)
    {
      v10 = (void *)[v8 mutableCopy];
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"%*s", extraBodyIndentLevel, "\t");
      v12 = [NSString stringWithFormat:@"\n%@", v11];
      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"\n", v12, 0, 0, objc_msgSend(v8, "length"));

      [v10 insertString:v11 atIndex:0];
      v8 = v10;
    }
    [v6 appendString:v8];
  }
  v13 = [v5 footer];
  if (([v13 isEqualToString:&stru_2700CBC00] & 1) == 0) {
    [v6 appendFormat:@"\n%@", v13];
  }
  unint64_t indentLevel = self->_indentLevel;
  if (indentLevel)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%*s", indentLevel, -[NSString UTF8String](self->_indentString, "UTF8String"));
    v16 = [NSString stringWithFormat:@"\n%@", v15];
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\n", v16, 0, 0, objc_msgSend(v6, "length"));

    [v6 insertString:v15 atIndex:0];
  }

  return v6;
}

- (unint64_t)indentLevel
{
  return self->_indentLevel;
}

- (void)setIndentLevel:(unint64_t)a3
{
  self->_unint64_t indentLevel = a3;
}

- (NSString)indentString
{
  return self->_indentString;
}

- (void)setIndentString:(id)a3
{
}

- (unint64_t)extraBodyIndentLevel
{
  return self->_extraBodyIndentLevel;
}

- (void)setExtraBodyIndentLevel:(unint64_t)a3
{
  self->_unint64_t extraBodyIndentLevel = a3;
}

- (void).cxx_destruct
{
}

@end