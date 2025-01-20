@interface INWidgetDescriptor
- (INWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5 preferredSizeClass:(int64_t)a6;
- (id)description;
- (int64_t)preferredSizeClass;
@end

@implementation INWidgetDescriptor

- (int64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (id)description
{
  v3 = NSString;
  v4 = [(INConfigurableDescriptor *)self extensionBundleIdentifier];
  v5 = [(INConfigurableDescriptor *)self kind];
  v6 = [(INConfigurableDescriptor *)self intentClassName];
  v7 = [NSNumber numberWithInteger:self->_preferredSizeClass];
  v8 = [v3 stringWithFormat:@"extensionBundleIdentifier: %@, kind: %@, intentClassName: %@, preferredSizeClass: %@", v4, v5, v6, v7];

  return v8;
}

- (INWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5 preferredSizeClass:(int64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)INWidgetDescriptor;
  result = [(INConfigurableDescriptor *)&v8 initWithExtensionBundleIdentifier:a3 kind:a4 intentClassName:a5];
  if (result) {
    result->_preferredSizeClass = a6;
  }
  return result;
}

@end