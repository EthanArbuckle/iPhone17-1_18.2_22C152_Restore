@interface FCUIActivityBaubleDescription
- (FCUIActivityBaubleDescription)initWithActivityDescription:(id)a3;
- (FCUIActivityBaubleDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4;
- (NSString)systemImageName;
- (UIColor)tintColor;
- (id)completeDescriptionWithReferencePointSize:(double)a3 maximumPointSize:(double)a4 referenceDimension:(double)a5;
@end

@implementation FCUIActivityBaubleDescription

- (FCUIActivityBaubleDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCUIActivityBaubleDescription;
  v9 = [(FCUIActivityBaubleDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemImageName, a3);
    objc_storeStrong((id *)&v10->_tintColor, a4);
  }

  return v10;
}

- (FCUIActivityBaubleDescription)initWithActivityDescription:(id)a3
{
  id v4 = a3;
  v5 = [v4 activitySymbolImageName];
  v6 = objc_msgSend(MEMORY[0x263F825C8], "fcui_colorForActivity:", v4);

  id v7 = [(FCUIActivityBaubleDescription *)self initWithSystemImageName:v5 tintColor:v6];
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
  v5 = [[FCUIActivityBaubleCompleteDescription alloc] initWithSystemImageName:self->_systemImageName tintColor:self->_tintColor referencePointSize:a3 maximumPointSize:a4 referenceDimension:a5];
  return v5;
}

@end