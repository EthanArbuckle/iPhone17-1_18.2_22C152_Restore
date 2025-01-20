@interface NEFilterNewFlowVerdict
+ (BOOL)supportsSecureCoding;
+ (NEFilterNewFlowVerdict)URLAppendStringVerdictWithMapKey:(NSString *)urlAppendMapKey;
+ (NEFilterNewFlowVerdict)allowVerdict;
+ (NEFilterNewFlowVerdict)dropVerdict;
+ (NEFilterNewFlowVerdict)filterDataVerdictWithFilterInbound:(BOOL)filterInbound peekInboundBytes:(NSUInteger)peekInboundBytes filterOutbound:(BOOL)filterOutbound peekOutboundBytes:(NSUInteger)peekOutboundBytes;
+ (NEFilterNewFlowVerdict)needRulesVerdict;
+ (NEFilterNewFlowVerdict)pauseVerdict;
+ (NEFilterNewFlowVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey;
- (BOOL)filterInbound;
- (BOOL)filterOutbound;
- (NEFilterNewFlowVerdict)initWithCoder:(id)a3;
- (NEFilterReportFrequency)statisticsReportFrequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)filterAction;
- (unint64_t)peekInboundBytes;
- (unint64_t)peekOutboundBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setFilterInbound:(BOOL)a3;
- (void)setFilterOutbound:(BOOL)a3;
- (void)setPeekInboundBytes:(unint64_t)a3;
- (void)setPeekOutboundBytes:(unint64_t)a3;
- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency;
@end

@implementation NEFilterNewFlowVerdict

- (void)setPeekOutboundBytes:(unint64_t)a3
{
  self->_peekOutboundBytes = a3;
}

- (unint64_t)peekOutboundBytes
{
  return self->_peekOutboundBytes;
}

- (void)setPeekInboundBytes:(unint64_t)a3
{
  self->_peekInboundBytes = a3;
}

- (unint64_t)peekInboundBytes
{
  return self->_peekInboundBytes;
}

- (void)setFilterOutbound:(BOOL)a3
{
  self->_filterOutbound = a3;
}

- (BOOL)filterOutbound
{
  return self->_filterOutbound;
}

- (void)setFilterInbound:(BOOL)a3
{
  self->_filterInbound = a3;
}

- (BOOL)filterInbound
{
  return self->_filterInbound;
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
  v4.super_class = (Class)NEFilterNewFlowVerdict;
  int64_t result = [(NEFilterVerdict *)&v4 filterAction];
  if (!result)
  {
    if ([(NEFilterNewFlowVerdict *)self filterInbound]
      || [(NEFilterNewFlowVerdict *)self filterOutbound])
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
  v11.super_class = (Class)NEFilterNewFlowVerdict;
  v7 = -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound"), @"filterInbound", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"), @"peekInboundBytes", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"), @"filterOutbound", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"), @"peekOutboundBytes", v5, a4);
  NEFilterReportFrequency v8 = [(NEFilterNewFlowVerdict *)self statisticsReportFrequency];
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
  v6.super_class = (Class)NEFilterNewFlowVerdict;
  id v4 = [(NEFilterVerdict *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setFilterInbound:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound"));
  objc_msgSend(v4, "setFilterOutbound:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"));
  objc_msgSend(v4, "setPeekInboundBytes:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"));
  objc_msgSend(v4, "setPeekOutboundBytes:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"));
  objc_msgSend(v4, "setStatisticsReportFrequency:", -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NEFilterNewFlowVerdict;
  id v4 = a3;
  [(NEFilterVerdict *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[NEFilterNewFlowVerdict filterInbound](self, "filterInbound", v5.receiver, v5.super_class), @"FilterInbound");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEFilterNewFlowVerdict filterOutbound](self, "filterOutbound"), @"FilterOutbound");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterNewFlowVerdict peekInboundBytes](self, "peekInboundBytes"), @"PeekInboundBytes");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterNewFlowVerdict peekOutboundBytes](self, "peekOutboundBytes"), @"PeekOutboundBytes");
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterNewFlowVerdict statisticsReportFrequency](self, "statisticsReportFrequency"), @"StatisticsReportFrequency");
}

- (NEFilterNewFlowVerdict)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterNewFlowVerdict;
  objc_super v5 = [(NEFilterVerdict *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_filterInbound = [v4 decodeBoolForKey:@"FilterInbound"];
    v5->_filterOutbound = [v4 decodeBoolForKey:@"FilterOutbound"];
    v5->_peekInboundBytes = [v4 decodeInt64ForKey:@"PeekInboundBytes"];
    v5->_peekOutboundBytes = [v4 decodeInt64ForKey:@"PeekOutboundBytes"];
    v5->_statisticsReportFrequency = (int)[v4 decodeIntForKey:@"StatisticsReportFrequency"];
  }

  return v5;
}

+ (NEFilterNewFlowVerdict)pauseVerdict
{
  v2 = [NEFilterNewFlowVerdict alloc];
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

+ (NEFilterNewFlowVerdict)filterDataVerdictWithFilterInbound:(BOOL)filterInbound peekInboundBytes:(NSUInteger)peekInboundBytes filterOutbound:(BOOL)filterOutbound peekOutboundBytes:(NSUInteger)peekOutboundBytes
{
  BOOL v7 = filterOutbound;
  BOOL v9 = filterInbound;
  v10 = [(NEFilterVerdict *)[NEFilterNewFlowVerdict alloc] initWithDrop:0 remediate:0];
  [(NEFilterNewFlowVerdict *)v10 setFilterInbound:v9];
  [(NEFilterNewFlowVerdict *)v10 setPeekInboundBytes:peekInboundBytes];
  [(NEFilterNewFlowVerdict *)v10 setFilterOutbound:v7];
  [(NEFilterNewFlowVerdict *)v10 setPeekOutboundBytes:peekOutboundBytes];

  return v10;
}

+ (NEFilterNewFlowVerdict)URLAppendStringVerdictWithMapKey:(NSString *)urlAppendMapKey
{
  v3 = urlAppendMapKey;
  objc_super v4 = +[NEFilterNewFlowVerdict allowVerdict];
  objc_super v6 = v4;
  if (v4)
  {
    v4[12] = 1;
    objc_setProperty_atomic(v4, v5, v3, 32);
  }

  return (NEFilterNewFlowVerdict *)v6;
}

+ (NEFilterNewFlowVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey
{
  objc_super v5 = remediationURLMapKey;
  objc_super v6 = remediationButtonTextMapKey;
  BOOL v7 = [(NEFilterVerdict *)[NEFilterNewFlowVerdict alloc] initWithDrop:1 remediate:1];
  BOOL v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v5, 16);
    objc_setProperty_atomic(v9, v10, v6, 24);
  }

  return v9;
}

+ (NEFilterNewFlowVerdict)dropVerdict
{
  v2 = [(NEFilterVerdict *)[NEFilterNewFlowVerdict alloc] initWithDrop:1 remediate:0];

  return v2;
}

+ (NEFilterNewFlowVerdict)allowVerdict
{
  v2 = [(NEFilterVerdict *)[NEFilterNewFlowVerdict alloc] initWithDrop:0 remediate:0];
  [(NEFilterNewFlowVerdict *)v2 setFilterInbound:0];
  [(NEFilterNewFlowVerdict *)v2 setFilterOutbound:0];

  return v2;
}

+ (NEFilterNewFlowVerdict)needRulesVerdict
{
  v2 = +[NEFilterNewFlowVerdict allowVerdict];
  [v2 setNeedRules:1];

  return (NEFilterNewFlowVerdict *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end