@interface CVNLPCaptionSensitiveImageParameters
- (CVNLPCaptionSensitiveImageParameters)initWithVisionIdentifier:(id)a3 minConfidence:(double)a4 commonBlockingTokens:(id)a5 categoryBlockingTokens:(id)a6 categoryBlockingTokensAnnex:(id)a7;
- (NSArray)blockingTokens;
- (NSString)visionIdentifier;
- (double)minConfidence;
@end

@implementation CVNLPCaptionSensitiveImageParameters

- (CVNLPCaptionSensitiveImageParameters)initWithVisionIdentifier:(id)a3 minConfidence:(double)a4 commonBlockingTokens:(id)a5 categoryBlockingTokens:(id)a6 categoryBlockingTokensAnnex:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CVNLPCaptionSensitiveImageParameters;
  v17 = [(CVNLPCaptionSensitiveImageParameters *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_visionIdentifier, a3);
    v18->_minConfidence = a4;
    if (v15)
    {
      v22 = (NSArray *)v15;
      blockingTokens = v18->_blockingTokens;
      v18->_blockingTokens = v22;
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21);
      v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v27 = v24;
      if (v14) {
        objc_msgSend_addObjectsFromArray_(v24, v25, (uint64_t)v14, v26);
      }
      if (v16) {
        objc_msgSend_addObjectsFromArray_(v27, v25, (uint64_t)v16, v26);
      }
      blockingTokens = v18->_blockingTokens;
      v18->_blockingTokens = v27;
    }
  }
  return v18;
}

- (NSString)visionIdentifier
{
  return self->_visionIdentifier;
}

- (double)minConfidence
{
  return self->_minConfidence;
}

- (NSArray)blockingTokens
{
  return self->_blockingTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingTokens, 0);
  objc_storeStrong((id *)&self->_visionIdentifier, 0);
}

@end