@interface MADServiceURLVideoAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime;
- (MADServiceURLVideoAsset)initWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6;
- (id)identifier;
- (id)url;
- (unint64_t)assetType;
@end

@implementation MADServiceURLVideoAsset

- (MADServiceURLVideoAsset)initWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MADServiceURLVideoAsset;
  v13 = [(MADServiceVideoAsset *)&v16 initWithClientBundleID:a5 clientTeamID:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v14->_identifier, a4);
  }

  return v14;
}

- (unint64_t)assetType
{
  return 5;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)url
{
  return self->_url;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime
{
  v5 = (void *)MEMORY[0x1C186D320](self, a3);
  v6 = [MEMORY[0x1E4F16330] assetWithURL:self->_url];
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "vcp_livePhotoStillDisplayTime");
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end