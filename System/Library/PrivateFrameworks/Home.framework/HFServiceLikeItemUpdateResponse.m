@interface HFServiceLikeItemUpdateResponse
- (HFCharacteristicBatchReadResponse)readResponse;
- (HFCharacteristicValueDisplayMetadata)displayMetadata;
- (HFServiceLikeItemUpdateResponse)initWithDisplayMetadata:(id)a3 readResponse:(id)a4 standardResults:(id)a5;
- (NSDictionary)standardResults;
@end

@implementation HFServiceLikeItemUpdateResponse

- (HFCharacteristicBatchReadResponse)readResponse
{
  return self->_readResponse;
}

- (HFServiceLikeItemUpdateResponse)initWithDisplayMetadata:(id)a3 readResponse:(id)a4 standardResults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFServiceLikeItemUpdateResponse;
  v12 = [(HFServiceLikeItemUpdateResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayMetadata, a3);
    objc_storeStrong((id *)&v13->_readResponse, a4);
    objc_storeStrong((id *)&v13->_standardResults, a5);
  }

  return v13;
}

- (HFCharacteristicValueDisplayMetadata)displayMetadata
{
  return self->_displayMetadata;
}

- (NSDictionary)standardResults
{
  return self->_standardResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardResults, 0);
  objc_storeStrong((id *)&self->_readResponse, 0);
  objc_storeStrong((id *)&self->_displayMetadata, 0);
}

@end