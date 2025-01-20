@interface WFVPNParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
@end

@implementation WFVPNParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  return +[WFVPNConfiguration objectWithWFSerializedRepresentation:](WFVPNConfiguration, "objectWithWFSerializedRepresentation:", a3, a4, a5);
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v5 wfSerializedRepresentation];

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end