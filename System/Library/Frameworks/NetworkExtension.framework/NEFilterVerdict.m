@interface NEFilterVerdict
+ (BOOL)supportsSecureCoding;
- (BOOL)drop;
- (BOOL)needRules;
- (BOOL)shouldReport;
- (NEFilterVerdict)initWithCoder:(id)a3;
- (NEFilterVerdict)initWithDrop:(BOOL)a3 remediate:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)filterAction;
- (void)encodeWithCoder:(id)a3;
- (void)setDrop:(BOOL)a3;
- (void)setNeedRules:(BOOL)a3;
- (void)setShouldReport:(BOOL)shouldReport;
@end

@implementation NEFilterVerdict

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlAppendStringMapKey, 0);
  objc_storeStrong((id *)&self->_remediationButtonTextMapKey, 0);

  objc_storeStrong((id *)&self->_remediationURLMapKey, 0);
}

- (void)setDrop:(BOOL)a3
{
  self->_drop = a3;
}

- (BOOL)drop
{
  return self->_drop;
}

- (void)setNeedRules:(BOOL)a3
{
  self->_needRules = a3;
}

- (BOOL)needRules
{
  return self->_needRules;
}

- (void)setShouldReport:(BOOL)shouldReport
{
  self->_shouldReport = shouldReport;
}

- (BOOL)shouldReport
{
  return self->_shouldReport;
}

- (int64_t)filterAction
{
  if ([(NEFilterVerdict *)self drop] && (!self || !self->_remediate)) {
    return 2;
  }
  BOOL v4 = [(NEFilterVerdict *)self drop];
  int64_t result = 0;
  if (self && v4)
  {
    if (self->_remediate) {
      return 3;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (NEFilterVerdict)initWithDrop:(BOOL)a3 remediate:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NEFilterVerdict;
  int64_t result = [(NEFilterVerdict *)&v7 init];
  if (result)
  {
    result->_drop = a3;
    result->_remediate = a4;
  }
  return result;
}

- (id)description
{
  return [(NEFilterVerdict *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterVerdict drop](self, "drop"), @"drop", v5, a4);
  if (self)
  {
    [v7 appendPrettyBOOL:self->_remediate withName:@"remediate" andIndent:v5 options:a4];
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterVerdict needRules](self, "needRules"), @"needRules", v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterVerdict shouldReport](self, "shouldReport"), @"shouldReport", v5, a4);
    [v7 appendPrettyBOOL:self->_pause withName:@"pause" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:self->_urlAppendString withName:@"urlAppendString" andIndent:v5 options:a4];
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v8, 32, 1), @"urlAppendStringMapKey", v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 16, 1), @"remediationURLMapKey", v5, a4);
    id Property = objc_getProperty(self, v10, 24, 1);
  }
  else
  {
    [v7 appendPrettyBOOL:0 withName:@"remediate" andIndent:v5 options:a4];
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", objc_msgSend(0, "needRules"), @"needRules", v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", objc_msgSend(0, "shouldReport"), @"shouldReport", v5, a4);
    [v7 appendPrettyBOOL:0 withName:@"pause" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:0 withName:@"urlAppendString" andIndent:v5 options:a4];
    [v7 appendPrettyObject:0 withName:@"urlAppendStringMapKey" andIndent:v5 options:a4];
    [v7 appendPrettyObject:0 withName:@"remediationURLMapKey" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"remediationButtonTextMapKey" andIndent:v5 options:a4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDrop:", -[NEFilterVerdict drop](self, "drop"));
  if (self)
  {
    BOOL remediate = self->_remediate;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL remediate = 0;
  if (v4) {
LABEL_3:
  }
    v4[11] = remediate;
LABEL_4:
  if (self)
  {
    BOOL urlAppendString = self->_urlAppendString;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL urlAppendString = 0;
  if (v4) {
LABEL_6:
  }
    v4[12] = urlAppendString;
LABEL_7:
  if (self)
  {
    id Property = objc_getProperty(self, v5, 16, 1);
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id Property = 0;
  if (v4) {
LABEL_9:
  }
    objc_setProperty_atomic(v4, v5, Property, 16);
LABEL_10:
  if (self)
  {
    id v9 = objc_getProperty(self, v5, 24, 1);
    if (!v4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v9 = 0;
  if (v4) {
LABEL_12:
  }
    objc_setProperty_atomic(v4, v5, v9, 24);
LABEL_13:
  if (!self)
  {
    id v10 = 0;
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v10 = objc_getProperty(self, v5, 32, 1);
  if (v4) {
LABEL_15:
  }
    objc_setProperty_atomic(v4, v5, v10, 32);
LABEL_16:
  objc_msgSend(v4, "setNeedRules:", -[NEFilterVerdict needRules](self, "needRules", v10));
  objc_msgSend(v4, "setShouldReport:", -[NEFilterVerdict shouldReport](self, "shouldReport"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[NEFilterVerdict drop](self, "drop"), @"Drop");
  if (self)
  {
    [v8 encodeBool:self->_remediate forKey:@"Remediate"];
    [v8 encodeBool:self->_urlAppendString forKey:@"URLAppendString"];
    objc_msgSend(v8, "encodeObject:forKey:", objc_getProperty(self, v4, 16, 1), @"RemediationURLMapKey");
    objc_msgSend(v8, "encodeObject:forKey:", objc_getProperty(self, v5, 24, 1), @"RemediationButtonTextMapKey");
    id Property = objc_getProperty(self, v6, 32, 1);
  }
  else
  {
    [v8 encodeBool:0 forKey:@"Remediate"];
    [v8 encodeBool:0 forKey:@"URLAppendString"];
    [v8 encodeObject:0 forKey:@"RemediationURLMapKey"];
    [v8 encodeObject:0 forKey:@"RemediationButtonTextMapKey"];
    id Property = 0;
  }
  [v8 encodeObject:Property forKey:@"URLAppendStringKey"];
  objc_msgSend(v8, "encodeBool:forKey:", -[NEFilterVerdict needRules](self, "needRules"), @"NeedRules");
  objc_msgSend(v8, "encodeBool:forKey:", -[NEFilterVerdict shouldReport](self, "shouldReport"), @"ShouldReport");
}

- (NEFilterVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterVerdict;
  SEL v5 = [(NEFilterVerdict *)&v13 init];
  if (v5)
  {
    v5->_drop = [v4 decodeBoolForKey:@"Drop"];
    v5->_BOOL remediate = [v4 decodeBoolForKey:@"Remediate"];
    v5->_BOOL urlAppendString = [v4 decodeBoolForKey:@"URLAppendString"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemediationURLMapKey"];
    remediationURLMapKey = v5->_remediationURLMapKey;
    v5->_remediationURLMapKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemediationButtonTextMapKey"];
    remediationButtonTextMapKey = v5->_remediationButtonTextMapKey;
    v5->_remediationButtonTextMapKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLAppendStringKey"];
    urlAppendStringMapKey = v5->_urlAppendStringMapKey;
    v5->_urlAppendStringMapKey = (NSString *)v10;

    v5->_needRules = [v4 decodeBoolForKey:@"NeedRules"];
    v5->_shouldReport = [v4 decodeBoolForKey:@"ShouldReport"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end