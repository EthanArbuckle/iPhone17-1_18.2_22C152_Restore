@interface MPCModelRadioContentReference
+ (BOOL)supportsSecureCoding;
+ (MPCModelRadioContentReference)referenceWithMPModelObject:(id)a3;
+ (MPCModelRadioContentReference)referenceWithMPModelObject:(id)a3 containerModelPlayEvent:(id)a4;
+ (MPCModelRadioContentReference)referenceWithStoreIdentifier:(id)a3 trackInfo:(id)a4;
- (ICRadioContentReference)ICRadioContentReference;
- (MPCModelRadioContentReference)initWithCoder:(id)a3;
- (MPCModelRadioContentReference)initWithICRadioContentReference:(id)a3;
- (MPIdentifierSet)referenceModelObjectIdentifiers;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPCModelRadioContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceModelObjectIdentifiers, 0);

  objc_storeStrong((id *)&self->_ICRadioContentReference, 0);
}

- (MPIdentifierSet)referenceModelObjectIdentifiers
{
  return self->_referenceModelObjectIdentifiers;
}

- (ICRadioContentReference)ICRadioContentReference
{
  return self->_ICRadioContentReference;
}

- (void)encodeWithCoder:(id)a3
{
  ICRadioContentReference = self->_ICRadioContentReference;
  id v5 = a3;
  [v5 encodeObject:ICRadioContentReference forKey:@"cr"];
  [v5 encodeObject:self->_referenceModelObjectIdentifiers forKey:@"ids"];
}

- (MPCModelRadioContentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCModelRadioContentReference;
  id v5 = [(MPCModelRadioContentReference *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cr"];
    ICRadioContentReference = v5->_ICRadioContentReference;
    v5->_ICRadioContentReference = (ICRadioContentReference *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ids"];
    referenceModelObjectIdentifiers = v5->_referenceModelObjectIdentifiers;
    v5->_referenceModelObjectIdentifiers = (MPIdentifierSet *)v8;
  }
  return v5;
}

- (MPCModelRadioContentReference)initWithICRadioContentReference:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioContentReference;
  id v5 = [(MPCModelRadioContentReference *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    ICRadioContentReference = v5->_ICRadioContentReference;
    v5->_ICRadioContentReference = (ICRadioContentReference *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPCModelRadioContentReference)referenceWithStoreIdentifier:(id)a3 trackInfo:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F892C8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[v6 alloc] initWithStoreIdentifier:v8 trackInfo:v7];

  v10 = objc_alloc_init((Class)a1);
  objc_super v11 = (void *)v10[1];
  v10[1] = v9;

  return (MPCModelRadioContentReference *)v10;
}

+ (MPCModelRadioContentReference)referenceWithMPModelObject:(id)a3 containerModelPlayEvent:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "mpc_radioContentReference");
  uint64_t v9 = v8;
  if (!v8)
  {
    v22 = 0;
    goto LABEL_23;
  }
  if (v7 && [v8 conformsToProtocol:&unk_26CC776C0])
  {
    id v10 = v9;
    uint64_t v11 = [v7 itemType];
    if (v11 == 3)
    {
      v23 = [v7 playlist];
      v24 = [v23 identifiers];
      v14 = [v24 universalStore];

      v21 = [v14 globalPlaylistID];
      if (![v21 length])
      {
        v28 = [v14 universalCloudLibraryID];
        if ([v28 length]) {
          [v10 setContainerID:v28];
        }

        goto LABEL_20;
      }
    }
    else
    {
      if (v11 != 1)
      {
LABEL_21:

        goto LABEL_22;
      }
      v12 = [v7 album];
      v13 = [v12 identifiers];
      v14 = [v13 universalStore];

      uint64_t v15 = [v14 purchasedAdamID];
      if (v15 || (uint64_t v15 = [v14 subscriptionAdamID]) != 0 || (uint64_t v15 = objc_msgSend(v14, "adamID")) != 0)
      {
        v16 = (char *)&v31 + 1;
        uint64_t quot = v15;
        do
        {
          lldiv_t v18 = lldiv(quot, 10);
          uint64_t quot = v18.quot;
          if (v18.rem >= 0) {
            LOBYTE(v19) = v18.rem;
          }
          else {
            uint64_t v19 = -v18.rem;
          }
          *(v16 - 2) = v19 + 48;
          v20 = (const UInt8 *)(v16 - 2);
          --v16;
        }
        while (v18.quot);
        if (v15 < 0)
        {
          *(v16 - 2) = 45;
          v20 = (const UInt8 *)(v16 - 2);
        }
        v21 = (void *)CFStringCreateWithBytes(0, v20, (char *)&v31 - (char *)v20, 0x8000100u, 0);
      }
      else
      {
        v29 = [v6 identifiers];
        v30 = [v29 personalizedStore];
        v21 = [v30 cloudAlbumID];

        if (![v21 length]) {
          goto LABEL_20;
        }
      }
    }
    [v10 setContainerID:v21];
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:
  v22 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v22 + 1, v9);
  uint64_t v25 = [v6 identifiers];
  id v26 = v22[2];
  v22[2] = (id)v25;

LABEL_23:

  return (MPCModelRadioContentReference *)v22;
}

+ (MPCModelRadioContentReference)referenceWithMPModelObject:(id)a3
{
  return (MPCModelRadioContentReference *)[a1 referenceWithMPModelObject:a3 containerModelPlayEvent:0];
}

@end