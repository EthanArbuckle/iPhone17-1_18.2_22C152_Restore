@interface CHUISWatchComplicationsWidgetSnapshotMetadata
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSGaugeParameters)gauge;
- (CHUISWatchComplicationsWidgetSnapshotMetadata)initWithBSXPCCoder:(id)a3;
- (NSArray)gaugeMaximumLabelData;
- (NSArray)gaugeMinimumLabelData;
- (NSArray)labelData;
- (NSArray)outerLabelData;
- (NSData)gaugeProviderData;
- (NSString)description;
- (id)_encodedLabelData:(id)a3 atDirectory:(id)a4;
- (id)_initWithSnapshotMetadata:(id)a3;
- (id)copyForEncodingAtUrlDirectory:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHUISWatchComplicationsWidgetSnapshotMetadata

- (id)_initWithSnapshotMetadata:(id)a3
{
  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadata;
  v5 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)&v8 init];
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_labelData, v4[1]);
    objc_storeStrong(p_isa + 2, v4[2]);
    objc_storeStrong(p_isa + 3, v4[3]);
    objc_storeStrong(p_isa + 4, v4[4]);
    objc_storeStrong(p_isa + 5, v4[5]);
    objc_storeStrong(p_isa + 6, v4[6]);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v8 = v7;
    }
    else {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = v8;

  labelData = self->_labelData;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke;
  v42[3] = &unk_1E62AF560;
  id v11 = v9;
  id v43 = v11;
  id v12 = (id)[v5 appendObject:labelData counterpart:v42];
  gauge = self->_gauge;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_2;
  v40[3] = &unk_1E62AF588;
  id v14 = v11;
  id v41 = v14;
  id v15 = (id)[v5 appendObject:gauge counterpart:v40];
  gaugeProviderData = self->_gaugeProviderData;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_3;
  v38[3] = &unk_1E62AF5B0;
  id v17 = v14;
  id v39 = v17;
  id v18 = (id)[v5 appendObject:gaugeProviderData counterpart:v38];
  gaugeMinimumLabelData = self->_gaugeMinimumLabelData;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_4;
  v36[3] = &unk_1E62AF560;
  id v20 = v17;
  id v37 = v20;
  id v21 = (id)[v5 appendObject:gaugeMinimumLabelData counterpart:v36];
  gaugeMaximumLabelData = self->_gaugeMaximumLabelData;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_5;
  v34[3] = &unk_1E62AF560;
  id v23 = v20;
  id v35 = v23;
  id v24 = (id)[v5 appendObject:gaugeMaximumLabelData counterpart:v34];
  outerLabelData = self->_outerLabelData;
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_6;
  v32 = &unk_1E62AF560;
  id v26 = v23;
  id v33 = v26;
  id v27 = (id)[v5 appendObject:outerLabelData counterpart:&v29];
  LOBYTE(v23) = objc_msgSend(v5, "isEqual", v29, v30, v31, v32);

  return (char)v23;
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) labelData];
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) gauge];
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) gaugeProviderData];
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) gaugeMinimumLabelData];
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) gaugeMaximumLabelData];
}

uint64_t __57__CHUISWatchComplicationsWidgetSnapshotMetadata_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) outerLabelData];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_labelData];
  id v5 = (id)[v3 appendObject:self->_gauge];
  id v6 = (id)[v3 appendObject:self->_gaugeProviderData];
  id v7 = (id)[v3 appendObject:self->_gaugeMinimumLabelData];
  id v8 = (id)[v3 appendObject:self->_gaugeMaximumLabelData];
  id v9 = (id)[v3 appendObject:self->_outerLabelData];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_labelData withName:@"labelData"];
  id v5 = (id)[v3 appendObject:self->_gauge withName:@"gauge" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_gaugeProviderData withName:@"gaugeProviderData" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_gaugeMinimumLabelData withName:@"gaugeMinimumLabelData" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_gaugeMaximumLabelData withName:@"gaugeMaximumLabelData" skipIfNil:1];
  id v9 = (id)[v3 appendObject:self->_outerLabelData withName:@"outerLabelData" skipIfNil:1];
  unint64_t v10 = [v3 build];

  return (NSString *)v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeCollection:self->_labelData forKey:@"labelData"];
  [v4 encodeObject:self->_gauge forKey:@"gauge"];
  [v4 encodeObject:self->_gaugeProviderData forKey:@"gaugeProviderData"];
  [v4 encodeObject:self->_gaugeMinimumLabelData forKey:@"gaugeMinimumLabelData"];
  [v4 encodeObject:self->_gaugeMaximumLabelData forKey:@"gaugeMaximumLabelData"];
  [v4 encodeObject:self->_outerLabelData forKey:@"outerLabelData"];
}

- (CHUISWatchComplicationsWidgetSnapshotMetadata)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadata;
  id v5 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"labelData"];
    labelData = v5->_labelData;
    v5->_labelData = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gauge"];
    gauge = v5->_gauge;
    v5->_gauge = (CHSGaugeParameters *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gaugeProviderData"];
    gaugeProviderData = v5->_gaugeProviderData;
    v5->_gaugeProviderData = (NSData *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v4 decodeCollectionOfClass:v13 containingClass:objc_opt_class() forKey:@"gaugeMinimumLabelData"];
    gaugeMinimumLabelData = v5->_gaugeMinimumLabelData;
    v5->_gaugeMinimumLabelData = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v4 decodeCollectionOfClass:v16 containingClass:objc_opt_class() forKey:@"gaugeMaximumLabelData"];
    gaugeMaximumLabelData = v5->_gaugeMaximumLabelData;
    v5->_gaugeMaximumLabelData = (NSArray *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [v4 decodeCollectionOfClass:v19 containingClass:objc_opt_class() forKey:@"outerLabelData"];
    outerLabelData = v5->_outerLabelData;
    v5->_outerLabelData = (NSArray *)v20;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CHUISWatchComplicationsWidgetSnapshotMetadata allocWithZone:a3];

  return [(CHUISWatchComplicationsWidgetSnapshotMetadata *)v4 _initWithSnapshotMetadata:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CHUISMutableWatchComplicationsWidgetSnapshotMetadata allocWithZone:a3];

  return [(CHUISWatchComplicationsWidgetSnapshotMetadata *)v4 _initWithSnapshotMetadata:self];
}

- (id)copyForEncodingAtUrlDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self labelData];
  uint64_t v6 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self _encodedLabelData:v5 atDirectory:v4];

  uint64_t v7 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self gaugeMinimumLabelData];
  id v8 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self _encodedLabelData:v7 atDirectory:v4];

  uint64_t v9 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self gaugeMaximumLabelData];
  unint64_t v10 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self _encodedLabelData:v9 atDirectory:v4];

  uint64_t v11 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self outerLabelData];
  uint64_t v12 = [(CHUISWatchComplicationsWidgetSnapshotMetadata *)self _encodedLabelData:v11 atDirectory:v4];

  uint64_t v13 = (void *)[(CHUISWatchComplicationsWidgetSnapshotMetadata *)self copy];
  uint64_t v14 = (void *)v13[1];
  v13[1] = v6;
  id v15 = v6;

  uint64_t v16 = (void *)v13[4];
  v13[4] = v8;
  id v17 = v8;

  id v18 = (void *)v13[5];
  v13[5] = v10;
  id v19 = v10;

  uint64_t v20 = (void *)v13[6];
  v13[6] = v12;

  return v13;
}

- (id)_encodedLabelData:(id)a3 atDirectory:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyForEncodingAtUrlDirectory:", v6, (void)v14);
          [v7 addObject:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)labelData
{
  return self->_labelData;
}

- (CHSGaugeParameters)gauge
{
  return self->_gauge;
}

- (NSData)gaugeProviderData
{
  return self->_gaugeProviderData;
}

- (NSArray)gaugeMinimumLabelData
{
  return self->_gaugeMinimumLabelData;
}

- (NSArray)gaugeMaximumLabelData
{
  return self->_gaugeMaximumLabelData;
}

- (NSArray)outerLabelData
{
  return self->_outerLabelData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerLabelData, 0);
  objc_storeStrong((id *)&self->_gaugeMaximumLabelData, 0);
  objc_storeStrong((id *)&self->_gaugeMinimumLabelData, 0);
  objc_storeStrong((id *)&self->_gaugeProviderData, 0);
  objc_storeStrong((id *)&self->_gauge, 0);

  objc_storeStrong((id *)&self->_labelData, 0);
}

@end