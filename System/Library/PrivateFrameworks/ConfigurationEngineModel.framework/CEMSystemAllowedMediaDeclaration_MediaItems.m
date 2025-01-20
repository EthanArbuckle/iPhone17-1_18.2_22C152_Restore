@interface CEMSystemAllowedMediaDeclaration_MediaItems
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAllMedia:(id)a3 withCd:(id)a4 withDvd:(id)a5 withBd:(id)a6 withBlankcd:(id)a7 withBlankdvd:(id)a8 withBlankbd:(id)a9 withDvdram:(id)a10 withDiskImage:(id)a11 withHarddiskInternal:(id)a12 withHarddiskExternal:(id)a13 withNetworkdisk:(id)a14;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadBd;
- (NSArray)payloadBlankbd;
- (NSArray)payloadBlankcd;
- (NSArray)payloadBlankdvd;
- (NSArray)payloadCd;
- (NSArray)payloadDiskImage;
- (NSArray)payloadDvd;
- (NSArray)payloadDvdram;
- (NSArray)payloadHarddiskExternal;
- (NSArray)payloadHarddiskInternal;
- (NSArray)payloadNetworkdisk;
- (NSString)payloadAllMedia;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllMedia:(id)a3;
- (void)setPayloadBd:(id)a3;
- (void)setPayloadBlankbd:(id)a3;
- (void)setPayloadBlankcd:(id)a3;
- (void)setPayloadBlankdvd:(id)a3;
- (void)setPayloadCd:(id)a3;
- (void)setPayloadDiskImage:(id)a3;
- (void)setPayloadDvd:(id)a3;
- (void)setPayloadDvdram:(id)a3;
- (void)setPayloadHarddiskExternal:(id)a3;
- (void)setPayloadHarddiskInternal:(id)a3;
- (void)setPayloadNetworkdisk:(id)a3;
@end

@implementation CEMSystemAllowedMediaDeclaration_MediaItems

+ (NSSet)allowedPayloadKeys
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"all-media";
  v6[1] = @"cd";
  v6[2] = @"dvd";
  v6[3] = @"bd";
  v6[4] = @"blankcd";
  v6[5] = @"blankdvd";
  v6[6] = @"blankbd";
  v6[7] = @"dvdram";
  v6[8] = @"disk-image";
  v6[9] = @"harddisk-internal";
  v6[10] = @"harddisk-external";
  v6[11] = @"networkdisk";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAllMedia:(id)a3 withCd:(id)a4 withDvd:(id)a5 withBd:(id)a6 withBlankcd:(id)a7 withBlankdvd:(id)a8 withBlankbd:(id)a9 withDvdram:(id)a10 withDiskImage:(id)a11 withHarddiskInternal:(id)a12 withHarddiskExternal:(id)a13 withNetworkdisk:(id)a14
{
  id v33 = a14;
  id v19 = a13;
  id v32 = a12;
  id v31 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  v28 = objc_opt_new();
  [v28 setPayloadAllMedia:v27];

  [v28 setPayloadCd:v26];
  [v28 setPayloadDvd:v25];

  [v28 setPayloadBd:v24];
  [v28 setPayloadBlankcd:v23];

  [v28 setPayloadBlankdvd:v22];
  [v28 setPayloadBlankbd:v21];

  [v28 setPayloadDvdram:v20];
  [v28 setPayloadDiskImage:v31];

  [v28 setPayloadHarddiskInternal:v32];
  [v28 setPayloadHarddiskExternal:v19];

  [v28 setPayloadNetworkdisk:v33];

  return v28;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemAllowedMediaDeclaration_MediaItems allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v50 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"all-media" isRequired:0 defaultValue:0 error:&v50];
  id v14 = v50;
  payloadAllMedia = self->_payloadAllMedia;
  self->_payloadAllMedia = v13;

  if (!v14)
  {
    id v49 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"cd" validator:&__block_literal_global_37 isRequired:0 defaultValue:0 error:&v49];
    id v14 = v49;
    payloadCd = self->_payloadCd;
    self->_payloadCd = v16;

    if (!v14)
    {
      id v48 = 0;
      v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"dvd" validator:&__block_literal_global_146 isRequired:0 defaultValue:0 error:&v48];
      id v14 = v48;
      payloadDvd = self->_payloadDvd;
      self->_payloadDvd = v18;

      if (!v14)
      {
        id v47 = 0;
        id v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"bd" validator:&__block_literal_global_148 isRequired:0 defaultValue:0 error:&v47];
        id v14 = v47;
        payloadBd = self->_payloadBd;
        self->_payloadBd = v20;

        if (!v14)
        {
          id v46 = 0;
          id v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"blankcd" validator:&__block_literal_global_150 isRequired:0 defaultValue:0 error:&v46];
          id v14 = v46;
          payloadBlankcd = self->_payloadBlankcd;
          self->_payloadBlankcd = v22;

          if (!v14)
          {
            id v45 = 0;
            id v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"blankdvd" validator:&__block_literal_global_152 isRequired:0 defaultValue:0 error:&v45];
            id v14 = v45;
            payloadBlankdvd = self->_payloadBlankdvd;
            self->_payloadBlankdvd = v24;

            if (!v14)
            {
              id v44 = 0;
              id v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"blankbd" validator:&__block_literal_global_154 isRequired:0 defaultValue:0 error:&v44];
              id v14 = v44;
              payloadBlankbd = self->_payloadBlankbd;
              self->_payloadBlankbd = v26;

              if (!v14)
              {
                id v43 = 0;
                v28 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"dvdram" validator:&__block_literal_global_156 isRequired:0 defaultValue:0 error:&v43];
                id v14 = v43;
                payloadDvdram = self->_payloadDvdram;
                self->_payloadDvdram = v28;

                if (!v14)
                {
                  id v42 = 0;
                  v30 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"disk-image" validator:&__block_literal_global_158 isRequired:0 defaultValue:0 error:&v42];
                  id v14 = v42;
                  payloadDiskImage = self->_payloadDiskImage;
                  self->_payloadDiskImage = v30;

                  if (!v14)
                  {
                    id v41 = 0;
                    id v32 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"harddisk-internal" validator:&__block_literal_global_160 isRequired:0 defaultValue:0 error:&v41];
                    id v14 = v41;
                    payloadHarddiskInternal = self->_payloadHarddiskInternal;
                    self->_payloadHarddiskInternal = v32;

                    if (!v14)
                    {
                      id v40 = 0;
                      v34 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"harddisk-external" validator:&__block_literal_global_162 isRequired:0 defaultValue:0 error:&v40];
                      id v14 = v40;
                      payloadHarddiskExternal = self->_payloadHarddiskExternal;
                      self->_payloadHarddiskExternal = v34;

                      if (!v14)
                      {
                        id v39 = 0;
                        v36 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"networkdisk" validator:&__block_literal_global_164 isRequired:0 defaultValue:0 error:&v39];
                        id v14 = v39;
                        payloadNetworkdisk = self->_payloadNetworkdisk;
                        self->_payloadNetworkdisk = v36;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"all-media" withValue:self->_payloadAllMedia isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"cd" withValue:self->_payloadCd itemSerializer:&__block_literal_global_167 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"dvd" withValue:self->_payloadDvd itemSerializer:&__block_literal_global_169 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"bd" withValue:self->_payloadBd itemSerializer:&__block_literal_global_171 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"blankcd" withValue:self->_payloadBlankcd itemSerializer:&__block_literal_global_173 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"blankdvd" withValue:self->_payloadBlankdvd itemSerializer:&__block_literal_global_175 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"blankbd" withValue:self->_payloadBlankbd itemSerializer:&__block_literal_global_177 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"dvdram" withValue:self->_payloadDvdram itemSerializer:&__block_literal_global_179_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"disk-image" withValue:self->_payloadDiskImage itemSerializer:&__block_literal_global_181_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"harddisk-internal" withValue:self->_payloadHarddiskInternal itemSerializer:&__block_literal_global_183_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"harddisk-external" withValue:self->_payloadHarddiskExternal itemSerializer:&__block_literal_global_185_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"networkdisk" withValue:self->_payloadNetworkdisk itemSerializer:&__block_literal_global_187_1 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CEMSystemAllowedMediaDeclaration_MediaItems;
  v4 = [(CEMPayloadBase *)&v30 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAllMedia copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadCd copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadDvd copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadBd copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadBlankcd copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadBlankdvd copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadBlankbd copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSArray *)self->_payloadDvdram copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSArray *)self->_payloadDiskImage copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSArray *)self->_payloadHarddiskInternal copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSArray *)self->_payloadHarddiskExternal copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSArray *)self->_payloadNetworkdisk copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  return v4;
}

- (NSString)payloadAllMedia
{
  return self->_payloadAllMedia;
}

- (void)setPayloadAllMedia:(id)a3
{
}

- (NSArray)payloadCd
{
  return self->_payloadCd;
}

- (void)setPayloadCd:(id)a3
{
}

- (NSArray)payloadDvd
{
  return self->_payloadDvd;
}

- (void)setPayloadDvd:(id)a3
{
}

- (NSArray)payloadBd
{
  return self->_payloadBd;
}

- (void)setPayloadBd:(id)a3
{
}

- (NSArray)payloadBlankcd
{
  return self->_payloadBlankcd;
}

- (void)setPayloadBlankcd:(id)a3
{
}

- (NSArray)payloadBlankdvd
{
  return self->_payloadBlankdvd;
}

- (void)setPayloadBlankdvd:(id)a3
{
}

- (NSArray)payloadBlankbd
{
  return self->_payloadBlankbd;
}

- (void)setPayloadBlankbd:(id)a3
{
}

- (NSArray)payloadDvdram
{
  return self->_payloadDvdram;
}

- (void)setPayloadDvdram:(id)a3
{
}

- (NSArray)payloadDiskImage
{
  return self->_payloadDiskImage;
}

- (void)setPayloadDiskImage:(id)a3
{
}

- (NSArray)payloadHarddiskInternal
{
  return self->_payloadHarddiskInternal;
}

- (void)setPayloadHarddiskInternal:(id)a3
{
}

- (NSArray)payloadHarddiskExternal
{
  return self->_payloadHarddiskExternal;
}

- (void)setPayloadHarddiskExternal:(id)a3
{
}

- (NSArray)payloadNetworkdisk
{
  return self->_payloadNetworkdisk;
}

- (void)setPayloadNetworkdisk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNetworkdisk, 0);
  objc_storeStrong((id *)&self->_payloadHarddiskExternal, 0);
  objc_storeStrong((id *)&self->_payloadHarddiskInternal, 0);
  objc_storeStrong((id *)&self->_payloadDiskImage, 0);
  objc_storeStrong((id *)&self->_payloadDvdram, 0);
  objc_storeStrong((id *)&self->_payloadBlankbd, 0);
  objc_storeStrong((id *)&self->_payloadBlankdvd, 0);
  objc_storeStrong((id *)&self->_payloadBlankcd, 0);
  objc_storeStrong((id *)&self->_payloadBd, 0);
  objc_storeStrong((id *)&self->_payloadDvd, 0);
  objc_storeStrong((id *)&self->_payloadCd, 0);

  objc_storeStrong((id *)&self->_payloadAllMedia, 0);
}

@end