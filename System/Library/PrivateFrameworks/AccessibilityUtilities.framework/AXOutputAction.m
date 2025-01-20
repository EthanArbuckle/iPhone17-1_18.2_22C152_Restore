@interface AXOutputAction
+ (unint64_t)newOutputActionID;
- (AXIndexMap)outputVariants;
- (AXOutputAction)initWithAXAction:(id)a3;
- (AXOutputAction)initWithString:(id)a3;
- (AXOutputAction)initWithString:(id)a3 brailleString:(id)a4;
- (BOOL)generatesBraille;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPunctuationTranslation;
- (BOOL)replaceCommas;
- (BOOL)wasDivided;
- (NSString)brailleString;
- (NSString)originalString;
- (NSString)string;
- (_NSRange)_rangeOfString;
- (_NSRange)rangeOfString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForVariant:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)outputActionID;
- (void)removeObjectForVariant:(int64_t)a3;
- (void)setBrailleString:(id)a3;
- (void)setGeneratesBraille:(BOOL)a3;
- (void)setObject:(id)a3 forVariant:(int64_t)a4;
- (void)setPerformPunctuationTranslation:(BOOL)a3;
- (void)setReplaceCommas:(BOOL)a3;
- (void)setString:(id)a3;
- (void)setString:(id)a3 overrideOriginalString:(BOOL)a4;
- (void)setWasDivided:(BOOL)a3;
@end

@implementation AXOutputAction

+ (unint64_t)newOutputActionID
{
  uint64_t v2 = arc4random();
  return arc4random() | (unint64_t)(v2 << 32);
}

- (AXOutputAction)initWithAXAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 string];
  v6 = [v4 brailleString];
  v7 = [(AXOutputAction *)self initWithString:v5 brailleString:v6];

  if (v7)
  {
    v8 = [v4 outputVariants];
    uint64_t v9 = [v8 copy];
    variants = v7->_variants;
    v7->_variants = (AXIndexMap *)v9;

    v7->_performPunctuationTranslation = [v4 performPunctuationTranslation];
    v7->_replaceCommas = [v4 replaceCommas];
    v7->_outputActionID = [v4 outputActionID];
  }

  return v7;
}

- (AXOutputAction)initWithString:(id)a3
{
  return [(AXOutputAction *)self initWithString:a3 brailleString:0];
}

- (AXOutputAction)initWithString:(id)a3 brailleString:(id)a4
{
  if (self)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = (NSString *)[v7 copy];
    originalString = self->_originalString;
    self->_originalString = v8;

    v10 = (NSString *)[v6 copy];
    brailleString = self->_brailleString;
    self->_brailleString = v10;

    v12 = (NSString *)[v7 copy];
    string = self->_string;
    self->_string = v12;

    self->_replaceCommas = 1;
    *(_WORD *)&self->_generatesBraille = 1;
    self->_outputActionID = +[AXOutputAction newOutputActionID];
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_string copy];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSString *)self->_originalString copy];
  v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(AXIndexMap *)self->_variants copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  v4[6] = self->_outputActionID;
  *((unsigned char *)v4 + 8) = self->_generatesBraille;
  return v4;
}

- (_NSRange)_rangeOfString
{
  NSUInteger v2 = [(NSString *)self->_originalString rangeOfString:self->_string];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setString:(id)a3 overrideOriginalString:(BOOL)a4
{
  BOOL v4 = a4;
  [(AXOutputAction *)self setString:a3];
  if (v4)
  {
    id v6 = (NSString *)[(NSString *)self->_string copy];
    originalString = self->_originalString;
    self->_originalString = v6;
    MEMORY[0x1F41817F8](v6, originalString);
  }
}

- (void)setObject:(id)a3 forVariant:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    variants = self->_variants;
    id v11 = v7;
    if (!variants)
    {
      uint64_t v9 = (AXIndexMap *)[objc_allocWithZone(MEMORY[0x1E4F48320]) init];
      v10 = self->_variants;
      self->_variants = v9;

      variants = self->_variants;
    }
    id v6 = (id)[(AXIndexMap *)variants setObject:v11 forIndex:a4];
    id v7 = v11;
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (id)objectForVariant:(int64_t)a3
{
  return (id)[(AXIndexMap *)self->_variants objectForIndex:a3];
}

- (void)removeObjectForVariant:(int64_t)a3
{
}

- (id)description
{
  NSUInteger v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AXOutputAction;
  BOOL v4 = [(AXOutputAction *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"[%@] String: %@, Original String: %@, Braille String: %@, variants: %@", v4, self->_string, self->_originalString, self->_brailleString, self->_variants];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[6] == self->_outputActionID;

  return v5;
}

- (unint64_t)hash
{
  return self->_outputActionID;
}

- (AXIndexMap)outputVariants
{
  return self->_variants;
}

- (_NSRange)rangeOfString
{
  NSUInteger length = self->_rangeOfString.length;
  NSUInteger location = self->_rangeOfString.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSString)brailleString
{
  return self->_brailleString;
}

- (void)setBrailleString:(id)a3
{
}

- (NSString)originalString
{
  return self->_originalString;
}

- (BOOL)generatesBraille
{
  return self->_generatesBraille;
}

- (void)setGeneratesBraille:(BOOL)a3
{
  self->_generatesBraille = a3;
}

- (BOOL)performPunctuationTranslation
{
  return self->_performPunctuationTranslation;
}

- (void)setPerformPunctuationTranslation:(BOOL)a3
{
  self->_performPunctuationTranslation = a3;
}

- (BOOL)replaceCommas
{
  return self->_replaceCommas;
}

- (void)setReplaceCommas:(BOOL)a3
{
  self->_replaceCommas = a3;
}

- (BOOL)wasDivided
{
  return self->_wasDivided;
}

- (void)setWasDivided:(BOOL)a3
{
  self->_wasDivided = a3;
}

- (unint64_t)outputActionID
{
  return self->_outputActionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_brailleString, 0);
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_variants, 0);
}

@end