@interface CHSMutableAvocadoDescriptor
- (CHSMutableAvocadoDescriptor)initWithCoder:(id)a3;
- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 displayName:(id)a6 intentType:(id)a7 supportedSizeClasses:(unint64_t)a8 widgetDescription:(id)a9 widgetVisibility:(int64_t)a10;
- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 supportedFamilies:(unint64_t)a6 intentType:(id)a7;
- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6;
@end

@implementation CHSMutableAvocadoDescriptor

- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(CHSWidgetDescriptor *)[CHSMutableWidgetDescriptor alloc] initWithExtensionBundleIdentifier:v10 kind:v11 supportedFamilies:a5 intentType:v12];

  return (CHSMutableAvocadoDescriptor *)v13;
}

- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 supportedFamilies:(unint64_t)a6 intentType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [(CHSWidgetDescriptor *)[CHSMutableWidgetDescriptor alloc] initWithExtensionBundleIdentifier:v12 containerBundleIdentifier:v13 kind:v14 supportedFamilies:a6 intentType:v15];

  return (CHSMutableAvocadoDescriptor *)v16;
}

- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 displayName:(id)a6 intentType:(id)a7 supportedSizeClasses:(unint64_t)a8 widgetDescription:(id)a9 widgetVisibility:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v22 = [(CHSWidgetDescriptor *)[CHSMutableWidgetDescriptor alloc] initWithExtensionBundleIdentifier:v16 containerBundleIdentifier:v17 kind:v18 displayName:v19 intentType:v20 supportedSizeClasses:a8 widgetDescription:v21 widgetVisibility:a10];

  return (CHSMutableAvocadoDescriptor *)v22;
}

- (CHSMutableAvocadoDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CHSWidgetDescriptor *)[CHSMutableWidgetDescriptor alloc] initWithCoder:v4];

  return (CHSMutableAvocadoDescriptor *)v5;
}

@end