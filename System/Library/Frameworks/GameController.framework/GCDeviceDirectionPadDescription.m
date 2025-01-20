@interface GCDeviceDirectionPadDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isBoundToSystemGesture;
- (BOOL)isDigital;
- (BOOL)isMappableToSystemGestures;
- (BOOL)isRemappable;
- (GCDeviceDirectionPadDescription)init;
- (GCDeviceDirectionPadDescription)initWithCoder:(id)a3;
- (GCDeviceDirectionPadDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceNameLocalizationKey:(id)a9 sourceSymbolName:(id)a10 sourcePressedThreshold:(float)a11 sourceUpExtendedEventField:(unint64_t)a12 sourceDownExtendedEventField:(unint64_t)a13 sourceLeftExtendedEventField:(unint64_t)a14 sourceRightExtendedEventField:(unint64_t)a15;
- (GCDeviceDirectionPadDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceUpExtendedEventField:(unint64_t)a9 sourceDownExtendedEventField:(unint64_t)a10 sourceLeftExtendedEventField:(unint64_t)a11 sourceRightExtendedEventField:(unint64_t)a12;
- (NSString)sourceNameLocalizationKey;
- (NSString)sourceSymbolName;
- (float)sourcePressedThreshold;
- (id)additionalAliases;
- (id)name;
- (id)nameLocalizationKey;
- (id)symbolName;
- (unint64_t)sourceDownExtendedEventFieldIndex;
- (unint64_t)sourceLeftExtendedEventFieldIndex;
- (unint64_t)sourceRightExtendedEventFieldIndex;
- (unint64_t)sourceUpExtendedEventFieldIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCDeviceDirectionPadDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceDirectionPadDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceNameLocalizationKey:(id)a9 sourceSymbolName:(id)a10 sourcePressedThreshold:(float)a11 sourceUpExtendedEventField:(unint64_t)a12 sourceDownExtendedEventField:(unint64_t)a13 sourceLeftExtendedEventField:(unint64_t)a14 sourceRightExtendedEventField:(unint64_t)a15
{
  v42.receiver = self;
  v42.super_class = (Class)GCDeviceDirectionPadDescription;
  id v20 = a10;
  id v21 = a9;
  id v22 = a7;
  id v23 = a6;
  id v24 = a4;
  id v25 = a3;
  v26 = [(GCDeviceDirectionPadDescription *)&v42 init];
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

  v26->_sourcePressedThreshold = a11;
  v26->_sourceUpExtendedEventFieldIndex = a12;
  v26->_sourceDownExtendedEventFieldIndex = a13;
  v26->_sourceLeftExtendedEventFieldIndex = a14;
  v26->_sourceRightExtendedEventFieldIndex = a15;
  return v26;
}

- (GCDeviceDirectionPadDescription)initWithName:(id)a3 additionalAliases:(id)a4 attributes:(unint64_t)a5 nameLocalizationKey:(id)a6 symbolName:(id)a7 sourceAttributes:(unint64_t)a8 sourceUpExtendedEventField:(unint64_t)a9 sourceDownExtendedEventField:(unint64_t)a10 sourceLeftExtendedEventField:(unint64_t)a11 sourceRightExtendedEventField:(unint64_t)a12
{
  return [(GCDeviceDirectionPadDescription *)self initWithName:a3 additionalAliases:a4 attributes:a5 nameLocalizationKey:a6 symbolName:a7 sourceAttributes:a8 sourceNameLocalizationKey:0.0 sourceSymbolName:a6 sourcePressedThreshold:a7 sourceUpExtendedEventField:a9 sourceDownExtendedEventField:a10 sourceLeftExtendedEventField:a11 sourceRightExtendedEventField:a12];
}

- (GCDeviceDirectionPadDescription)init
{
  return 0;
}

- (GCDeviceDirectionPadDescription)initWithCoder:(id)a3
{
  id v3 = a3;
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v4 = objc_opt_class();
  v5 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v4, objc_opt_class(), 0);
  id v21 = [v3 decodeObjectOfClasses:v5 forKey:@"additionalAliases"];

  uint64_t v20 = [v3 decodeIntegerForKey:@"attributes"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nameLocalizationKey"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"sourceAttributes"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceNameLocalizationKey"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceSymbolName"];
  [v3 decodeFloatForKey:@"sourcePressedThreshold"];
  int v12 = v11;
  uint64_t v13 = [v3 decodeIntegerForKey:@"sourceUpExtendedEventFieldIndex"];
  uint64_t v14 = [v3 decodeIntegerForKey:@"sourceDownExtendedEventFieldIndex"];
  uint64_t v15 = [v3 decodeIntegerForKey:@"sourceLeftExtendedEventFieldIndex"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"sourceRightExtendedEventFieldIndex"];

  LODWORD(v17) = v12;
  v18 = [(GCDeviceDirectionPadDescription *)self initWithName:v22 additionalAliases:v21 attributes:v20 nameLocalizationKey:v6 symbolName:v7 sourceAttributes:v8 sourceNameLocalizationKey:v17 sourceSymbolName:v9 sourcePressedThreshold:v10 sourceUpExtendedEventField:v13 sourceDownExtendedEventField:v14 sourceLeftExtendedEventField:v15 sourceRightExtendedEventField:v16];

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v6 = a3;
  [v6 encodeObject:name forKey:@"name"];
  [v6 encodeObject:self->_additionalAliases forKey:@"additionalAliases"];
  [v6 encodeInteger:self->_attributes forKey:@"attributes"];
  [v6 encodeObject:self->_nameLocalizationKey forKey:@"nameLocalizationKey"];
  [v6 encodeObject:self->_symbolName forKey:@"symbolName"];
  [v6 encodeInteger:self->_sourceAttributes forKey:@"sourceAttributes"];
  [v6 encodeObject:self->_sourceNameLocalizationKey forKey:@"sourceNameLocalizationKey"];
  [v6 encodeObject:self->_sourceSymbolName forKey:@"sourceSymbolName"];
  *(float *)&double v5 = self->_sourcePressedThreshold;
  [v6 encodeFloat:@"sourcePressedThreshold" forKey:v5];
  [v6 encodeInteger:self->_sourceUpExtendedEventFieldIndex forKey:@"sourceUpExtendedEventFieldIndex"];
  [v6 encodeInteger:self->_sourceDownExtendedEventFieldIndex forKey:@"sourceDownExtendedEventFieldIndex"];
  [v6 encodeInteger:self->_sourceLeftExtendedEventFieldIndex forKey:@"sourceLeftExtendedEventFieldIndex"];
  [v6 encodeInteger:self->_sourceRightExtendedEventFieldIndex forKey:@"sourceRightExtendedEventFieldIndex"];
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

- (float)sourcePressedThreshold
{
  return self->_sourcePressedThreshold;
}

- (unint64_t)sourceUpExtendedEventFieldIndex
{
  return self->_sourceUpExtendedEventFieldIndex;
}

- (unint64_t)sourceDownExtendedEventFieldIndex
{
  return self->_sourceDownExtendedEventFieldIndex;
}

- (unint64_t)sourceLeftExtendedEventFieldIndex
{
  return self->_sourceLeftExtendedEventFieldIndex;
}

- (unint64_t)sourceRightExtendedEventFieldIndex
{
  return self->_sourceRightExtendedEventFieldIndex;
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