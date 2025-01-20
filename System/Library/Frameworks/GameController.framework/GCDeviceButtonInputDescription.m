@interface GCDeviceButtonInputDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isBoundToSystemGesture;
- (BOOL)isDigital;
- (BOOL)isMappableToSystemGestures;
- (BOOL)isRemappable;
- (BOOL)supportsTouch;
- (GCDeviceButtonInputDescription)init;
- (GCDeviceButtonInputDescription)initWithCoder:(id)a3;
- (GCDeviceButtonInputDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceExtendedEventField:(int64_t)a9;
- (GCDeviceButtonInputDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceNameLocalizationKey:(id)a9 sourceSymbolName:(id)a10 sourceTouchedThreshold:(float)a11 sourcePressedThreshold:(float)a12 sourceExtendedEventField:(int64_t)a13;
- (NSString)sourceNameLocalizationKey;
- (NSString)sourceSymbolName;
- (float)sourcePressedThreshold;
- (float)sourceTouchedThreshold;
- (id)additionalAliases;
- (id)name;
- (id)nameLocalizationKey;
- (id)symbolName;
- (int64_t)sourceExtendedEventFieldIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDeviceButtonInputDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceButtonInputDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceNameLocalizationKey:(id)a9 sourceSymbolName:(id)a10 sourceTouchedThreshold:(float)a11 sourcePressedThreshold:(float)a12 sourceExtendedEventField:(int64_t)a13
{
  v41.receiver = self;
  v41.super_class = (Class)GCDeviceButtonInputDescription;
  id v20 = a10;
  id v21 = a9;
  id v22 = a7;
  id v23 = a6;
  id v24 = a4;
  id v25 = a3;
  v26 = [(GCDeviceButtonInputDescription *)&v41 init];
  uint64_t v27 = [v25 copy];

  name = v26->_name;
  v26->_name = (NSString *)v27;

  v29 = (void *)[v24 copy];
  v30 = v29;
  if (!v29)
  {
    v30 = +[NSSet set];
  }
  objc_storeStrong((id *)&v26->_additionalAliases, v30);
  if (!v29) {

  }
  v26->_attributes = a5;
  uint64_t v31 = [v23 copy];

  nameLocalizationKey = v26->_nameLocalizationKey;
  v26->_nameLocalizationKey = (NSString *)v31;

  uint64_t v33 = [v22 copy];
  symbolName = v26->_symbolName;
  v26->_symbolName = (NSString *)v33;

  v26->_sourceAttributes = a8;
  uint64_t v35 = [v21 copy];

  sourceNameLocalizationKey = v26->_sourceNameLocalizationKey;
  v26->_sourceNameLocalizationKey = (NSString *)v35;

  uint64_t v37 = [v20 copy];
  sourceSymbolName = v26->_sourceSymbolName;
  v26->_sourceSymbolName = (NSString *)v37;

  v26->_sourceTouchedThreshold = a11;
  v26->_sourcePressedThreshold = a12;
  v26->_sourceExtendedEventFieldIndex = a13;
  return v26;
}

- (GCDeviceButtonInputDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceExtendedEventField:(int64_t)a9
{
  return [(GCDeviceButtonInputDescription *)self initWithName:a3 additionalAliases:a4 attributes:a5 nameLocalizationKey:a6 symbolName:a7 sourceAttributes:a8 sourceNameLocalizationKey:0.0 sourceSymbolName:0.0 sourceTouchedThreshold:a6 sourcePressedThreshold:a7 sourceExtendedEventField:a9];
}

- (GCDeviceButtonInputDescription)init
{
  return 0;
}

- (GCDeviceButtonInputDescription)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v3 decodeObjectOfClasses:v6 forKey:@"additionalAliases"];

  uint64_t v8 = [v3 decodeIntegerForKey:@"attributes"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nameLocalizationKey"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  uint64_t v11 = [v3 decodeIntegerForKey:@"sourceAttributes"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceNameLocalizationKey"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceSymbolName"];
  [v3 decodeFloatForKey:@"sourceTouchedThreshold"];
  int v15 = v14;
  [v3 decodeFloatForKey:@"sourcePressedThreshold"];
  int v17 = v16;
  uint64_t v18 = [v3 decodeIntegerForKey:@"sourceExtendedEventFieldIndex"];

  LODWORD(v19) = v15;
  LODWORD(v20) = v17;
  id v21 = [(GCDeviceButtonInputDescription *)self initWithName:v4 additionalAliases:v7 attributes:v8 nameLocalizationKey:v9 symbolName:v10 sourceAttributes:v11 sourceNameLocalizationKey:v19 sourceSymbolName:v20 sourceTouchedThreshold:v12 sourcePressedThreshold:v13 sourceExtendedEventField:v18];

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v7 = a3;
  [v7 encodeObject:name forKey:@"name"];
  [v7 encodeObject:self->_additionalAliases forKey:@"additionalAliases"];
  [v7 encodeInteger:self->_attributes forKey:@"attributes"];
  [v7 encodeObject:self->_nameLocalizationKey forKey:@"nameLocalizationKey"];
  [v7 encodeObject:self->_symbolName forKey:@"symbolName"];
  [v7 encodeInteger:self->_sourceAttributes forKey:@"sourceAttributes"];
  [v7 encodeObject:self->_sourceNameLocalizationKey forKey:@"sourceNameLocalizationKey"];
  [v7 encodeObject:self->_sourceSymbolName forKey:@"sourceSymbolName"];
  *(float *)&double v5 = self->_sourceTouchedThreshold;
  [v7 encodeFloat:@"sourceTouchedThreshold" forKey:v5];
  *(float *)&double v6 = self->_sourcePressedThreshold;
  [v7 encodeFloat:@"sourcePressedThreshold" forKey:v6];
  [v7 encodeInteger:self->_sourceExtendedEventFieldIndex forKey:@"sourceExtendedEventFieldIndex"];
}

- (BOOL)isRemappable
{
  return (LOBYTE(self->_attributes) >> 1) & 1;
}

- (BOOL)isMappableToSystemGestures
{
  return (BYTE1(self->_attributes) >> 6) & 1;
}

- (BOOL)isBoundToSystemGesture
{
  return BYTE1(self->_attributes) >> 7;
}

- (BOOL)isDigital
{
  return self->_sourceAttributes & 1;
}

- (BOOL)supportsTouch
{
  return BYTE2(self->_sourceAttributes) & 1;
}

- (id)name
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)additionalAliases
{
  return objc_getProperty(self, a2, 48, 1);
}

- (id)nameLocalizationKey
{
  return objc_getProperty(self, a2, 56, 1);
}

- (id)symbolName
{
  return objc_getProperty(self, a2, 64, 1);
}

- (NSString)sourceNameLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)sourceSymbolName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (float)sourceTouchedThreshold
{
  return self->_sourceTouchedThreshold;
}

- (float)sourcePressedThreshold
{
  return self->_sourcePressedThreshold;
}

- (int64_t)sourceExtendedEventFieldIndex
{
  return self->_sourceExtendedEventFieldIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSymbolName, 0);
  objc_storeStrong((id *)&self->_sourceNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_additionalAliases, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end