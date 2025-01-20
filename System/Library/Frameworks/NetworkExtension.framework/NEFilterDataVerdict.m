@interface NEFilterDataVerdict
+ (BOOL)supportsSecureCoding;
+ (NEFilterDataVerdict)allowVerdict;
+ (NEFilterDataVerdict)dataVerdictWithPassBytes:(NSUInteger)passBytes peekBytes:(NSUInteger)peekBytes;
+ (NEFilterDataVerdict)dropVerdict;
+ (NEFilterDataVerdict)needRulesVerdict;
+ (NEFilterDataVerdict)pauseVerdict;
+ (NEFilterDataVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey;
- (NEFilterDataVerdict)initWithCoder:(id)a3;
- (NEFilterReportFrequency)statisticsReportFrequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)filterAction;
- (unint64_t)passBytes;
- (unint64_t)peekBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setPassBytes:(unint64_t)a3;
- (void)setPeekBytes:(unint64_t)a3;
- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency;
@end

@implementation NEFilterDataVerdict

- (void)setPeekBytes:(unint64_t)a3
{
  self->_peekBytes = a3;
}

- (unint64_t)peekBytes
{
  return self->_peekBytes;
}

- (void)setPassBytes:(unint64_t)a3
{
  self->_passBytes = a3;
}

- (unint64_t)passBytes
{
  return self->_passBytes;
}

- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency
{
  self->_statisticsReportFrequency = statisticsReportFrequency;
}

- (NEFilterReportFrequency)statisticsReportFrequency
{
  return self->_statisticsReportFrequency;
}

- (int64_t)filterAction
{
  v4.receiver = self;
  v4.super_class = (Class)NEFilterDataVerdict;
  int64_t result = [(NEFilterVerdict *)&v4 filterAction];
  if (!result)
  {
    if ([(NEFilterVerdict *)self drop]
      || self && self->super._remediate
      || [(NEFilterDataVerdict *)self passBytes] != -1)
    {
      return 4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterDataVerdict;
  v7 = -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterDataVerdict passBytes](self, "passBytes"), @"passBytes", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"), @"peekBytes", v5, a4);
  NEFilterReportFrequency v8 = [(NEFilterDataVerdict *)self statisticsReportFrequency];
  self;
  if ((unint64_t)(v8 - 1) > 2) {
    v9 = @"none";
  }
  else {
    v9 = off_1E598FCF0[v8 - 1];
  }
  [v7 appendPrettyObject:v9 withName:@"statisticsReportFrequency" andIndent:v5 options:a4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEFilterDataVerdict;
  id v4 = [(NEFilterVerdict *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setPassBytes:", -[NEFilterDataVerdict passBytes](self, "passBytes"));
  objc_msgSend(v4, "setPeekBytes:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"));
  objc_msgSend(v4, "setStatisticsReportFrequency:", -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NEFilterDataVerdict;
  id v4 = a3;
  [(NEFilterVerdict *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterDataVerdict passBytes](self, "passBytes", v5.receiver, v5.super_class), @"PassBytes");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"), @"PeekBytes");
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency"), @"StatisticsReportFrequency");
}

- (NEFilterDataVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterDataVerdict;
  objc_super v5 = [(NEFilterVerdict *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_passBytes = [v4 decodeInt64ForKey:@"PassBytes"];
    v5->_peekBytes = [v4 decodeInt64ForKey:@"PeekBytes"];
    v5->_statisticsReportFrequency = (int)[v4 decodeIntForKey:@"StatisticsReportFrequency"];
  }

  return v5;
}

+ (NEFilterDataVerdict)pauseVerdict
{
  v2 = [NEFilterDataVerdict alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)NEFilterVerdict;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2) {
      v2->super._pause = 1;
    }
  }

  return v2;
}

+ (NEFilterDataVerdict)dataVerdictWithPassBytes:(NSUInteger)passBytes peekBytes:(NSUInteger)peekBytes
{
  objc_super v6 = [(NEFilterVerdict *)[NEFilterDataVerdict alloc] initWithDrop:0 remediate:0];
  [(NEFilterDataVerdict *)v6 setPassBytes:passBytes];
  [(NEFilterDataVerdict *)v6 setPeekBytes:peekBytes];

  return v6;
}

+ (NEFilterDataVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey
{
  objc_super v5 = remediationURLMapKey;
  objc_super v6 = remediationButtonTextMapKey;
  objc_super v7 = [(NEFilterVerdict *)[NEFilterDataVerdict alloc] initWithDrop:1 remediate:1];
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v5, 16);
    objc_setProperty_atomic(v9, v10, v6, 24);
  }

  return v9;
}

+ (NEFilterDataVerdict)dropVerdict
{
  v2 = [(NEFilterVerdict *)[NEFilterDataVerdict alloc] initWithDrop:1 remediate:0];

  return v2;
}

+ (NEFilterDataVerdict)allowVerdict
{
  v2 = [(NEFilterVerdict *)[NEFilterDataVerdict alloc] initWithDrop:0 remediate:0];
  [(NEFilterDataVerdict *)v2 setPassBytes:-1];

  return v2;
}

+ (NEFilterDataVerdict)needRulesVerdict
{
  v2 = +[NEFilterDataVerdict allowVerdict];
  [v2 setNeedRules:1];

  return (NEFilterDataVerdict *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end