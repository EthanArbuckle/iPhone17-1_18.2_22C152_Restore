@interface DebugHierarchyProperty
- (BOOL)isEditable;
- (DebugHierarchyProperty)initWithName:(id)a3 runtimeTypeName:(id)a4;
- (DebugHierarchyProperty)initWithPropertyDescription:(id)a3;
- (NSString)format;
- (NSString)logicalType;
- (NSString)name;
- (NSString)runtimeTypeName;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (int64_t)options;
- (int64_t)visibility;
- (void)setFormat:(id)a3;
- (void)setLogicalType:(id)a3;
- (void)setName:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setRuntimeTypeName:(id)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation DebugHierarchyProperty

- (DebugHierarchyProperty)initWithPropertyDescription:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"propertyName"];
  v6 = [v4 objectForKeyedSubscript:@"propertyRuntimeType"];
  v7 = [(DebugHierarchyProperty *)self initWithName:v5 runtimeTypeName:v6];
  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"propertyLogicalType"];
    v9 = v8;
    if (v8) {
      v10 = v8;
    }
    else {
      v10 = @"DebugHierarchyLogicalPropertyTypeCustom";
    }
    logicalType = v7->_logicalType;
    v7->_logicalType = &v10->isa;

    v12 = [v4 objectForKeyedSubscript:@"propertyFormat"];
    if (v12) {
      objc_storeStrong((id *)&v7->_format, v12);
    }
    v13 = [v4 objectForKeyedSubscript:@"propertyVisibility"];
    v14 = v13;
    if (v13) {
      id v15 = [v13 integerValue];
    }
    else {
      id v15 = &dword_0 + 1;
    }
    v7->_visibility = (int64_t)v15;
    id v16 = [v4 objectForKeyedSubscript:@"propertyOptions"];
    v17 = v16;
    if (v16) {
      id v16 = [v16 integerValue];
    }
    v7->_options = (int64_t)v16;
  }
  return v7;
}

- (DebugHierarchyProperty)initWithName:(id)a3 runtimeTypeName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DebugHierarchyProperty;
  v9 = [(DebugHierarchyProperty *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_runtimeTypeName, a4);
    v10->_visibility = 1;
  }

  return v10;
}

- (BOOL)isEditable
{
  return ((unint64_t)[(DebugHierarchyProperty *)self options] >> 1) & 1;
}

- (id)dictionaryRepresentation
{
  runtimeTypeName = self->_runtimeTypeName;
  logicalType = self->_logicalType;
  format = self->_format;
  int64_t visibility = self->_visibility;
  int64_t options = self->_options;
  id v7 = self->_name;
  id v8 = runtimeTypeName;
  v9 = logicalType;
  v10 = format;
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  objc_super v12 = Mutable;
  if (v7) {
    CFDictionaryAddValue(Mutable, @"propertyName", v7);
  }
  if (v8) {
    CFDictionaryAddValue(v12, @"propertyRuntimeType", v8);
  }
  if (v9) {
    v13 = v9;
  }
  else {
    v13 = @"DebugHierarchyLogicalPropertyTypeCustom";
  }
  CFDictionaryAddValue(v12, @"propertyLogicalType", v13);
  if (v10) {
    CFDictionaryAddValue(v12, @"propertyFormat", v10);
  }
  if (visibility != 1)
  {
    int64_t valuePtr = visibility;
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v12, @"visibility", v14);
    CFRelease(v14);
  }
  if (options)
  {
    int64_t valuePtr = options;
    CFNumberRef v15 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v12, @"propertyOptions", v15);
    CFRelease(v15);
  }

  return v12;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(DebugHierarchyProperty *)self name];
  v6 = [(DebugHierarchyProperty *)self runtimeTypeName];
  id v7 = +[NSString stringWithFormat:@"<%@ %p, name: %@, runtimeTypeName: %@>", v4, self, v5, v6];

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)runtimeTypeName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRuntimeTypeName:(id)a3
{
}

- (NSString)logicalType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogicalType:(id)a3
{
}

- (NSString)format
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFormat:(id)a3
{
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_int64_t visibility = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_int64_t options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_logicalType, 0);
  objc_storeStrong((id *)&self->_runtimeTypeName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end