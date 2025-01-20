@interface DBGSnapshotProperty
+ (id)propertyWithDebugHierarchyProperty:(id)a3;
+ (id)propertyWithName:(id)a3;
+ (id)propertyWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5;
- (BOOL)BOOLValue;
- (BOOL)logicalTypeEquals:(id)a3;
- (CGPoint)pointValue;
- (CGRect)rectValue;
- (CGSize)sizeValue;
- (DBGSnapshotNode)snapshotNode;
- (DBGSnapshotProperty)initWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5 fetchStatus:(int64_t)a6;
- (DBGValue)value;
- (DebugHierarchyProperty)backingRuntimeTypeProperty;
- (NSData)dataValue;
- (NSMutableDictionary)subpropertiesMap;
- (NSString)stringValue;
- (double)CGFloatValue;
- (float)floatValue;
- (id)JSONPropertyDescription;
- (id)allSubproperties;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)format;
- (id)logicalType;
- (id)subpropertyWithName:(id)a3;
- (int64_t)fetchStatus;
- (int64_t)integerValue;
- (int64_t)options;
- (int64_t)visibility;
- (void)addSubproperties:(id)a3;
- (void)addSubproperty:(id)a3;
- (void)setBackingRuntimeTypeProperty:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setCGFloatValue:(double)a3;
- (void)setFetchStatus:(int64_t)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setPointValue:(CGPoint)a3;
- (void)setRectValue:(CGRect)a3;
- (void)setSizeValue:(CGSize)a3;
- (void)setSnapshotNode:(id)a3;
- (void)setSubpropertiesMap:(id)a3;
- (void)setValue:(id)a3;
- (void)updateWithJSONPropertyDescription:(id)a3;
@end

@implementation DBGSnapshotProperty

+ (id)propertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4 runtimeTypeName:0 value:0 fetchStatus:0];

  return v5;
}

+ (id)propertyWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithName:v10 runtimeTypeName:v9 value:v8 fetchStatus:4];

  return v11;
}

+ (id)propertyWithDebugHierarchyProperty:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 name];
  v7 = [v4 runtimeTypeName];
  id v8 = [v5 initWithName:v6 runtimeTypeName:v7 value:0 fetchStatus:0];

  [v8 setBackingRuntimeTypeProperty:v4];

  return v8;
}

- (DBGSnapshotProperty)initWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5 fetchStatus:(int64_t)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DBGSnapshotProperty;
  v12 = [(DBGSnapshotProperty *)&v15 initWithName:a3 runtimeTypeName:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a5);
    v13->_fetchStatus = a6;
  }

  return v13;
}

- (id)allSubproperties
{
  v2 = [(DBGSnapshotProperty *)self subpropertiesMap];
  v3 = [v2 allValues];

  return v3;
}

- (id)subpropertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(DBGSnapshotProperty *)self subpropertiesMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)addSubproperty:(id)a3
{
  id v8 = a3;
  id v4 = [(DBGSnapshotProperty *)self snapshotNode];
  [v8 setSnapshotNode:v4];

  id v5 = [(DBGSnapshotProperty *)self subpropertiesMap];

  if (v5)
  {
    v6 = [(DBGSnapshotProperty *)self subpropertiesMap];
    v7 = [v8 name];
    [v6 setObject:v8 forKey:v7];
  }
  else
  {
    v6 = [v8 name];
    v7 = +[NSMutableDictionary dictionaryWithObject:v8 forKey:v6];
    [(DBGSnapshotProperty *)self setSubpropertiesMap:v7];
  }
}

- (void)addSubproperties:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(DBGSnapshotProperty *)self addSubproperty:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)logicalTypeEquals:(id)a3
{
  id v4 = a3;
  id v5 = [(DBGSnapshotProperty *)self logicalType];

  unsigned __int8 v6 = 0;
  if (v4 && v5)
  {
    uint64_t v7 = [(DBGSnapshotProperty *)self logicalType];
    unsigned __int8 v6 = [v7 isEqualToString:v4];
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [(DBGSnapshotProperty *)self value];
  id v4 = [(DBGSnapshotProperty *)self name];
  id v5 = [(DBGSnapshotProperty *)self runtimeTypeName];
  unsigned __int8 v6 = [(DBGSnapshotProperty *)self logicalType];
  uint64_t v7 = [(DBGSnapshotProperty *)self format];
  int64_t v8 = [(DBGSnapshotProperty *)self visibility];
  int64_t v9 = [(DBGSnapshotProperty *)self options];
  id v10 = v3;
  id v11 = v4;
  id v12 = v5;
  v13 = v6;
  id v14 = v7;
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = Mutable;
  if (v10) {
    CFDictionaryAddValue(Mutable, @"propertyValue", v10);
  }
  if (v11) {
    CFDictionaryAddValue(v16, @"propertyName", v11);
  }
  if (v12) {
    CFDictionaryAddValue(v16, @"propertyRuntimeType", v12);
  }
  if (v13) {
    v17 = v13;
  }
  else {
    v17 = @"DebugHierarchyLogicalPropertyTypeCustom";
  }
  CFDictionaryAddValue(v16, @"propertyLogicalType", v17);
  if (v14) {
    CFDictionaryAddValue(v16, @"propertyFormat", v14);
  }
  if (v8 != 1)
  {
    int64_t valuePtr = v8;
    CFNumberRef v18 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v16, @"visibility", v18);
    CFRelease(v18);
  }
  if (v9)
  {
    int64_t valuePtr = v9;
    CFNumberRef v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v16, @"propertyOptions", v19);
    CFRelease(v19);
  }

  return v16;
}

- (id)logicalType
{
  v6.receiver = self;
  v6.super_class = (Class)DBGSnapshotProperty;
  v3 = [(DBGSnapshotProperty *)&v6 logicalType];
  if (!v3)
  {
    id v4 = [(DBGSnapshotProperty *)self backingRuntimeTypeProperty];
    v3 = [v4 logicalType];
  }

  return v3;
}

- (id)format
{
  v6.receiver = self;
  v6.super_class = (Class)DBGSnapshotProperty;
  v3 = [(DBGSnapshotProperty *)&v6 format];
  if (!v3)
  {
    id v4 = [(DBGSnapshotProperty *)self backingRuntimeTypeProperty];
    v3 = [v4 format];
  }

  return v3;
}

- (int64_t)visibility
{
  v6.receiver = self;
  v6.super_class = (Class)DBGSnapshotProperty;
  id v3 = [(DBGSnapshotProperty *)&v6 visibility];
  if (!v3)
  {
    id v4 = [(DBGSnapshotProperty *)self backingRuntimeTypeProperty];
    id v3 = [v4 visibility];
  }
  return (int64_t)v3;
}

- (int64_t)options
{
  v6.receiver = self;
  v6.super_class = (Class)DBGSnapshotProperty;
  id v3 = [(DBGSnapshotProperty *)&v6 options];
  if (!v3)
  {
    id v4 = [(DBGSnapshotProperty *)self backingRuntimeTypeProperty];
    id v3 = [v4 options];
  }
  return (int64_t)v3;
}

- (DebugHierarchyProperty)backingRuntimeTypeProperty
{
  backingRuntimeTypeProperty = self->_backingRuntimeTypeProperty;
  if (!backingRuntimeTypeProperty)
  {
    id v4 = [(DBGSnapshotProperty *)self snapshotNode];
    id v5 = [v4 runtimeType];
    objc_super v6 = [(DBGSnapshotProperty *)self name];
    uint64_t v7 = [v5 propertyWithName:v6];
    int64_t v8 = self->_backingRuntimeTypeProperty;
    self->_backingRuntimeTypeProperty = v7;

    backingRuntimeTypeProperty = self->_backingRuntimeTypeProperty;
  }

  return backingRuntimeTypeProperty;
}

- (BOOL)BOOLValue
{
  id v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)setBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DBGSnapshotProperty *)self value];
  if (v5)
  {
    unsigned __int8 v6 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v7 = [(DBGSnapshotProperty *)self value];
  [v7 setBoolValue:v3];
}

- (int64_t)integerValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(DBGSnapshotProperty *)self value];
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  [(DBGSnapshotProperty *)self value];
  if ((isKindOfClass & 1) == 0 && (v6 & 1) == 0) {
    return 0;
  }
  int64_t v8 = [(DBGSnapshotProperty *)self value];
  id v9 = [v8 integerValue];

  return (int64_t)v9;
}

- (void)setIntegerValue:(int64_t)a3
{
  id v5 = [(DBGSnapshotProperty *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [(DBGSnapshotProperty *)self value];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  [(DBGSnapshotProperty *)self value];
  if (isKindOfClass)
  {
    id v10 = [(DBGSnapshotProperty *)self value];
    [v10 setIntegerValue:a3];
  }
  else
  {
    if ((v8 & 1) == 0) {
      return;
    }
    id v10 = [(DBGSnapshotProperty *)self value];
    id v9 = +[NSNumber numberWithInteger:a3];
    [v10 setEnumValue:v9];
  }
}

- (double)CGFloatValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  [v5 CGFloatValue];
  double v7 = v6;

  return v7;
}

- (void)setCGFloatValue:(double)a3
{
  id v5 = [(DBGSnapshotProperty *)self value];
  if (v5)
  {
    double v6 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v7 = [(DBGSnapshotProperty *)self value];
  [v7 setCGFloatValue:a3];
}

- (CGPoint)pointValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  [v5 point];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setPointValue:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(DBGSnapshotProperty *)self value];
  if (v6)
  {
    double v7 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v8 = [(DBGSnapshotProperty *)self value];
  objc_msgSend(v8, "setPoint:", x, y);
}

- (CGSize)sizeValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setSizeValue:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(DBGSnapshotProperty *)self value];
  if (v6)
  {
    double v7 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v8 = [(DBGSnapshotProperty *)self value];
  objc_msgSend(v8, "setSize:", width, height);
}

- (CGRect)rectValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  [v5 rect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)setRectValue:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(DBGSnapshotProperty *)self value];
  if (v8)
  {
    double v9 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v10 = [(DBGSnapshotProperty *)self value];
  objc_msgSend(v10, "setRect:", x, y, width, height);
}

- (float)floatValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (NSString)stringValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  float v6 = [v5 string];

  return (NSString *)v6;
}

- (NSData)dataValue
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  if (v3)
  {
    id v4 = [(DBGSnapshotProperty *)self value];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGSnapshotProperty *)self value];
  float v6 = [v5 data];

  return (NSData *)v6;
}

- (id)debugDescription
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGSnapshotProperty *)self name];
  float v6 = [(DBGSnapshotProperty *)self runtimeTypeName];
  float v7 = [(DBGSnapshotProperty *)self value];
  int64_t v8 = [(DBGSnapshotProperty *)self visibility];
  if ((unint64_t)(v8 - 1) > 7) {
    double v9 = @"Unsupported Visibility";
  }
  else {
    double v9 = off_24518[v8 - 1];
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; name = %@; type = %@; value = %@; visibilitdouble y = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v10 = v9);

  return v10;
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGSnapshotProperty *)self name];
  float v6 = [(DBGSnapshotProperty *)self value];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; %@ = %@>",
    v4,
    self,
    v5,
  float v7 = v6);

  return v7;
}

- (DBGValue)value
{
  return (DBGValue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setValue:(id)a3
{
}

- (int64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(int64_t)a3
{
  self->_fetchStatus = a3;
}

- (DBGSnapshotNode)snapshotNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotNode);

  return (DBGSnapshotNode *)WeakRetained;
}

- (void)setSnapshotNode:(id)a3
{
}

- (NSMutableDictionary)subpropertiesMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubpropertiesMap:(id)a3
{
}

- (void)setBackingRuntimeTypeProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingRuntimeTypeProperty, 0);
  objc_storeStrong((id *)&self->_subpropertiesMap, 0);
  objc_destroyWeak((id *)&self->_snapshotNode);

  objc_storeStrong((id *)&self->_value, 0);
}

- (void)updateWithJSONPropertyDescription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"visibility"];
  float v6 = v5;
  if (v5) {
    -[DBGSnapshotProperty setVisibility:](self, "setVisibility:", [v5 integerValue]);
  }
  float v7 = [v4 objectForKeyedSubscript:@"propertyRuntimeType"];
  if (v7) {
    [(DBGSnapshotProperty *)self setRuntimeTypeName:v7];
  }
  int64_t v8 = [v4 objectForKeyedSubscript:@"propertyLogicalType"];
  if (v8) {
    [(DBGSnapshotProperty *)self setLogicalType:v8];
  }
  double v9 = [v4 objectForKeyedSubscript:@"propertyFormat"];
  if (v9) {
    [(DBGSnapshotProperty *)self setFormat:v9];
  }
  id v10 = [v4 objectForKeyedSubscript:@"fetchStatus"];
  id v11 = [v10 integerValue];

  [(DBGSnapshotProperty *)self setFetchStatus:v11];
  double v12 = [v4 objectForKeyedSubscript:@"propertyValue"];
  if (v12 && [v9 length])
  {
    double v13 = [(DBGSnapshotProperty *)self logicalType];
    double v14 = [(DBGSnapshotProperty *)self format];
    id v15 = DBGValueClassForPropertyWith(v13, v14);

    if ([v15 conformsToProtocol:&OBJC_PROTOCOL___DBGValueJSONSerialization])
    {
      double v16 = [(DBGSnapshotProperty *)self format];
      id v26 = 0;
      double v17 = [v15 valueWithEncodedValue:v12 format:v16 error:&v26];
      id v18 = v26;

      if (v18)
      {
        CFNumberRef v19 = [v18 localizedDescription];
        NSLog(&cfstr_SError.isa, "-[DBGSnapshotProperty(JSONSerialization) updateWithJSONPropertyDescription:]", v19);

        id v20 = 0;
      }
      else
      {
        id v20 = v17;
      }
    }
    else
    {
      v21 = NSStringFromClass((Class)v15);
      v22 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DBGValueJSONSerialization);
      NSLog(&cfstr_CanTCreateProp.isa, v21, v22);

      id v20 = 0;
    }
    [(DBGSnapshotProperty *)self setValue:v20];
  }
  v23 = [v4 objectForKeyedSubscript:@"propertyOptions"];
  id v24 = [v23 unsignedIntegerValue];

  [(DBGSnapshotProperty *)self setOptions:v24];
  v25 = [(DBGSnapshotProperty *)self snapshotNode];
  [v25 didUpdateProperty:self];
}

- (id)JSONPropertyDescription
{
  BOOL v3 = [(DBGSnapshotProperty *)self value];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___DBGValueJSONSerialization];

  if (v4)
  {
    id v5 = [(DBGSnapshotProperty *)self value];
    float v6 = [v5 JSONCompatibleRepresentation];
  }
  else
  {
    float v6 = 0;
  }
  float v7 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__name];
  int64_t v8 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__runtimeTypeName];
  double v9 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__logicalType];
  id v10 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__format];
  uint64_t v11 = *(void *)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__visibility];
  uint64_t v12 = *(void *)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__options];
  id v13 = v6;
  id v14 = v7;
  id v15 = v8;
  double v16 = v9;
  id v17 = v10;
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v19 = Mutable;
  if (v13) {
    CFDictionaryAddValue(Mutable, @"propertyValue", v13);
  }
  if (v14) {
    CFDictionaryAddValue(v19, @"propertyName", v14);
  }
  if (v15) {
    CFDictionaryAddValue(v19, @"propertyRuntimeType", v15);
  }
  if (v16) {
    id v20 = v16;
  }
  else {
    id v20 = @"DebugHierarchyLogicalPropertyTypeCustom";
  }
  CFDictionaryAddValue(v19, @"propertyLogicalType", v20);
  if (v17) {
    CFDictionaryAddValue(v19, @"propertyFormat", v17);
  }
  if (v11 != 1)
  {
    uint64_t valuePtr = v11;
    CFNumberRef v21 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v19, @"visibility", v21);
    CFRelease(v21);
  }
  if (v12)
  {
    uint64_t valuePtr = v12;
    CFNumberRef v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v19, @"propertyOptions", v22);
    CFRelease(v22);
  }

  return v19;
}

@end