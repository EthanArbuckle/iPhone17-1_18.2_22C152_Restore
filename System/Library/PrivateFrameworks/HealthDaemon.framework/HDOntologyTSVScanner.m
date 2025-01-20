@interface HDOntologyTSVScanner
- (BOOL)isAtEnd;
- (BOOL)scanLongLong:(int64_t *)a3;
- (BOOL)scanString:(id *)a3;
- (HDOntologyTSVScanner)init;
- (HDOntologyTSVScanner)initWithString:(id)a3;
- (id)description;
@end

@implementation HDOntologyTSVScanner

- (HDOntologyTSVScanner)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyTSVScanner)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDOntologyTSVScanner;
  v5 = [(HDOntologyTSVScanner *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v4];
    scanner = v5->_scanner;
    v5->_scanner = (NSScanner *)v6;

    [(NSScanner *)v5->_scanner setCharactersToBeSkipped:0];
  }

  return v5;
}

- (id)description
{
  v3 = [(NSScanner *)self->_scanner string];
  NSUInteger v4 = [(NSScanner *)self->_scanner scanLocation];
  uint64_t v5 = [v3 length];
  unint64_t v6 = v5 + ~v4;
  if (v6 >= 0xA) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = v5 + ~v4;
  }
  if (v6 >= 0xA) {
    v8 = @"...";
  }
  else {
    v8 = &stru_1F1728D60;
  }
  objc_super v9 = objc_msgSend(v3, "substringWithRange:", v4, v7);
  v10 = [NSString stringWithFormat:@"<%@:%p \"%@\"%@>", objc_opt_class(), self, v9, v8];

  return v10;
}

- (BOOL)isAtEnd
{
  return [(NSScanner *)self->_scanner isAtEnd];
}

- (BOOL)scanLongLong:(int64_t *)a3
{
  BOOL v4 = [(NSScanner *)self->_scanner scanLongLong:a3];
  if (![(NSScanner *)self->_scanner scanString:@"\t" intoString:0]) {
    [(HDOntologyTSVScanner *)self scanString:0];
  }
  return v4;
}

- (BOOL)scanString:(id *)a3
{
  BOOL v5 = [(NSScanner *)self->_scanner scanUpToString:@"\t" intoString:a3];
  BOOL v6 = v5;
  if (a3 && v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E78] stringWithString:*a3];
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"\\t", @"\t", 2, 0, objc_msgSend(v7, "length"));
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"\\n", @"\n", 2, 0, objc_msgSend(v7, "length"));
    v8 = (void *)[v7 copy];

    *a3 = v8;
  }
  [(NSScanner *)self->_scanner scanString:@"\t" intoString:0];
  return v6;
}

- (void).cxx_destruct
{
}

@end