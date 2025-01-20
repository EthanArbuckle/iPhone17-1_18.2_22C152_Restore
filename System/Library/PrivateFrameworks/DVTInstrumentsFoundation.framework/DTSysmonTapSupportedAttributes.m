@interface DTSysmonTapSupportedAttributes
+ (id)localCoalitionAttributes;
+ (id)localCoalitionAttributesMap;
+ (id)localProcessAttributes;
+ (id)localProcessAttributesMap;
+ (id)localSystemAttributes;
+ (id)localSystemAttributesMap;
@end

@implementation DTSysmonTapSupportedAttributes

+ (id)localProcessAttributes
{
  if (qword_268707FE0 != -1) {
    dispatch_once(&qword_268707FE0, &unk_26E515788);
  }
  v2 = (void *)qword_268707FD8;
  return v2;
}

+ (id)localSystemAttributes
{
  if (qword_268707FF0 != -1) {
    dispatch_once(&qword_268707FF0, &unk_26E515A28);
  }
  v2 = (void *)qword_268707FE8;
  return v2;
}

+ (id)localCoalitionAttributes
{
  if (qword_268708000 != -1) {
    dispatch_once(&qword_268708000, &unk_26E515AC8);
  }
  v2 = (void *)qword_268707FF8;
  return v2;
}

+ (id)localProcessAttributesMap
{
  if (qword_268708010 != -1) {
    dispatch_once(&qword_268708010, &unk_26E515B48);
  }
  v2 = (void *)qword_268708008;
  return v2;
}

+ (id)localSystemAttributesMap
{
  if (qword_268708020 != -1) {
    dispatch_once(&qword_268708020, &unk_26E515C08);
  }
  v2 = (void *)qword_268708018;
  return v2;
}

+ (id)localCoalitionAttributesMap
{
  if (qword_268708030 != -1) {
    dispatch_once(&qword_268708030, &unk_26E515948);
  }
  v2 = (void *)qword_268708028;
  return v2;
}

@end