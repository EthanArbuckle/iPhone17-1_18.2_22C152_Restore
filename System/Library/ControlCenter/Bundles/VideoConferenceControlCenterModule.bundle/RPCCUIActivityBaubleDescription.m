@interface RPCCUIActivityBaubleDescription
- (NSString)systemImageName;
- (RPCCUIActivityBaubleDescription)initWithActivityDescription:(id)a3;
- (RPCCUIActivityBaubleDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4;
- (UIColor)tintColor;
- (id)completeDescriptionWithReferencePointSize:(double)a3 maximumPointSize:(double)a4 referenceDimension:(double)a5;
@end

@implementation RPCCUIActivityBaubleDescription

- (RPCCUIActivityBaubleDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPCCUIActivityBaubleDescription;
  v9 = [(RPCCUIActivityBaubleDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemImageName, a3);
    objc_storeStrong((id *)&v10->_tintColor, a4);
  }

  return v10;
}

- (RPCCUIActivityBaubleDescription)initWithActivityDescription:(id)a3
{
  id v4 = a3;
  v5 = [v4 activitySymbolImageName];
  v6 = +[UIColor rpccui_colorForActivity:v4];

  id v7 = [(RPCCUIActivityBaubleDescription *)self initWithSystemImageName:v5 tintColor:v6];
  return v7;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_systemImageName, 0);
}

- (id)completeDescriptionWithReferencePointSize:(double)a3 maximumPointSize:(double)a4 referenceDimension:(double)a5
{
  v5 = [[RPCCUIActivityBaubleCompleteDescription alloc] initWithSystemImageName:self->_systemImageName tintColor:self->_tintColor referencePointSize:a3 maximumPointSize:a4 referenceDimension:a5];

  return v5;
}

@end