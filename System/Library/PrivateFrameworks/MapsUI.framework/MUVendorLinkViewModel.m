@interface MUVendorLinkViewModel
- (MUVendorLinkViewModel)initWithPartnerId:(id)a3 linkType:(int)a4 artworkURL:(id)a5 providerName:(id)a6 appAdamId:(id)a7 appShortName:(id)a8 actionName:(id)a9 fallbackSymbolName:(id)a10;
- (NSString)actionName;
- (NSString)appAdamId;
- (NSString)appShortName;
- (NSString)fallbackSymbolName;
- (NSString)linkTypeString;
- (NSString)partnerId;
- (NSString)providerName;
- (NSString)uniqueIdentifier;
- (NSURL)artworkURL;
- (id)description;
- (int)linkType;
- (void)setActionName:(id)a3;
- (void)setAppAdamId:(id)a3;
- (void)setAppShortName:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setLinkType:(int)a3;
- (void)setPartnerId:(id)a3;
- (void)setProviderName:(id)a3;
@end

@implementation MUVendorLinkViewModel

- (MUVendorLinkViewModel)initWithPartnerId:(id)a3 linkType:(int)a4 artworkURL:(id)a5 providerName:(id)a6 appAdamId:(id)a7 appShortName:(id)a8 actionName:(id)a9 fallbackSymbolName:(id)a10
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)MUVendorLinkViewModel;
  v18 = [(MUVendorLinkViewModel *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_partnerId, a3);
    objc_storeStrong((id *)&v19->_artworkURL, a5);
    objc_storeStrong((id *)&v19->_providerName, a6);
    v19->_linkType = a4;
    objc_storeStrong((id *)&v19->_appAdamId, a7);
    objc_storeStrong((id *)&v19->_appShortName, a8);
    objc_storeStrong((id *)&v19->_actionName, a9);
    objc_storeStrong((id *)&v19->_fallbackSymbolName, a10);
  }

  return v19;
}

- (NSString)uniqueIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v4 = [(MUVendorLinkViewModel *)self linkType];
  if (v4 > 4) {
    v5 = 0;
  }
  else {
    v5 = off_1E5750ED0[v4];
  }
  [v3 addObject:v5];
  v6 = [(MUVendorLinkViewModel *)self providerName];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(MUVendorLinkViewModel *)self providerName];
    [v3 addObject:v8];
  }
  v9 = [(MUVendorLinkViewModel *)self appAdamId];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [(MUVendorLinkViewModel *)self appAdamId];
    [v3 addObject:v11];
  }
  v12 = [(MUVendorLinkViewModel *)self actionName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = [(MUVendorLinkViewModel *)self actionName];
    [v3 addObject:v14];
  }
  v15 = [v3 componentsJoinedByString:@"-"];

  return (NSString *)v15;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(MUVendorLinkViewModel *)self uniqueIdentifier];
  unsigned int v4 = [v2 stringWithFormat:@"Unique Identifier: %@", v3];

  return v4;
}

- (NSString)linkTypeString
{
  unsigned int v2 = [(MUVendorLinkViewModel *)self linkType] - 1;
  if (v2 > 3) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_1E5750EF8[v2]->isa;
  }
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (NSString)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (NSString)appShortName
{
  return self->_appShortName;
}

- (void)setAppShortName:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
}

- (NSString)fallbackSymbolName
{
  return self->_fallbackSymbolName;
}

- (NSString)partnerId
{
  return self->_partnerId;
}

- (void)setPartnerId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partnerId, 0);
  objc_storeStrong((id *)&self->_fallbackSymbolName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_appShortName, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end