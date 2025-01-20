@interface DebugHierarchyFormatSpecifier
+ (id)specifierWithFormat:(id)a3 label:(id)a4;
- (DebugHierarchyFormatSpecifier)initWithFormat:(id)a3 label:(id)a4;
- (NSString)format;
- (NSString)label;
- (void)setFormat:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation DebugHierarchyFormatSpecifier

+ (id)specifierWithFormat:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFormat:v7 label:v6];

  return v8;
}

- (DebugHierarchyFormatSpecifier)initWithFormat:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DebugHierarchyFormatSpecifier;
  v9 = [(DebugHierarchyFormatSpecifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_format, a3);
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

- (NSString)format
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFormat:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end