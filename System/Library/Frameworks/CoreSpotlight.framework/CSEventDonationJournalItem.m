@interface CSEventDonationJournalItem
- (BOOL)hasHTMLContent;
- (BOOL)hasTextContent;
- (CSEventDonationJournalItem)initWithIdentifier:(id *)a3 itemObj:(id *)a4 attrDictObj:(id *)a5 customDictObj:(id *)a6 contentObj:(id *)a7 htmlObj:(id *)a8 embeddingsObj:(id *)a9 flags:(unsigned int)a10;
- (id)attributesForKeys:(id)a3 bundleID:(id)a4;
@end

@implementation CSEventDonationJournalItem

- (CSEventDonationJournalItem)initWithIdentifier:(id *)a3 itemObj:(id *)a4 attrDictObj:(id *)a5 customDictObj:(id *)a6 contentObj:(id *)a7 htmlObj:(id *)a8 embeddingsObj:(id *)a9 flags:(unsigned int)a10
{
  v24.receiver = self;
  v24.super_class = (Class)CSEventDonationJournalItem;
  result = [(CSEventDonationJournalItem *)&v24 init];
  if (result)
  {
    long long v17 = *(_OWORD *)&a3->var0;
    result->_identifier.reference = ($37FF168C8709F524D812460C59637AB1)a3->var2;
    *(_OWORD *)&result->_identifier.containerBytes = v17;
    long long v18 = *(_OWORD *)&a4->var0;
    result->_itemObj.reference = ($37FF168C8709F524D812460C59637AB1)a4->var2;
    *(_OWORD *)&result->_itemObj.containerBytes = v18;
    long long v19 = *(_OWORD *)&a5->var0;
    result->_attrDictObj.reference = ($37FF168C8709F524D812460C59637AB1)a5->var2;
    *(_OWORD *)&result->_attrDictObj.containerBytes = v19;
    long long v20 = *(_OWORD *)&a6->var0;
    result->_customDictObj.reference = ($37FF168C8709F524D812460C59637AB1)a6->var2;
    *(_OWORD *)&result->_customDictObj.containerBytes = v20;
    long long v21 = *(_OWORD *)&a7->var0;
    result->_contentObj.reference = ($37FF168C8709F524D812460C59637AB1)a7->var2;
    *(_OWORD *)&result->_contentObj.containerBytes = v21;
    long long v22 = *(_OWORD *)&a8->var0;
    result->_htmlObj.reference = ($37FF168C8709F524D812460C59637AB1)a8->var2;
    *(_OWORD *)&result->_htmlObj.containerBytes = v22;
    long long v23 = *(_OWORD *)&a9->var0;
    result->_embeddingsObj.reference = ($37FF168C8709F524D812460C59637AB1)a9->var2;
    *(_OWORD *)&result->_embeddingsObj.containerBytes = v23;
    result->_flags = a10;
  }
  return result;
}

- (BOOL)hasTextContent
{
  if (self)
  {
    if (_MDPlistGetPlistObjectType() == 244) {
      return 1;
    }
  }
  else if (_MDPlistGetPlistObjectType() == 244)
  {
    return 1;
  }
  return _MDPlistGetPlistObjectType() == 245;
}

- (BOOL)hasHTMLContent
{
  return _MDPlistGetPlistObjectType() == 246;
}

- (id)attributesForKeys:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v11);
        if ([(CSEventDonationJournalItem *)self hasHTMLContent]
          && [v12 isEqualToString:@"kMDItemHTMLContentData"]
          || [(CSEventDonationJournalItem *)self hasTextContent]
          && [v12 isEqualToString:@"kMDItemTextContent"])
        {
          uint64_t v13 = (uint64_t)sub_100020710(kCFAllocatorDefault);
        }
        else
        {
          if (![v12 isEqualToString:@"kMDItemExtraData"]
            || !sub_10004A930(v20, v14)
            || !self
            || !self->_customDictObj.containerLength
            || (id v15 = v12,
                [v15 UTF8String],
                strlen((const char *)[v15 UTF8String]),
                !_MDPlistDictionaryGetPlistObjectForKey()))
          {
            id v16 = v12;
            [v16 UTF8String];
            strlen((const char *)[v16 UTF8String]);
            if (!_MDPlistDictionaryGetPlistObjectForKey()) {
              goto LABEL_21;
            }
          }
          uint64_t v13 = _MDPlistContainerCopyObject();
        }
        long long v17 = (void *)v13;
        if (v13) {
          [v21 setObject:v13 forKey:v12];
        }

LABEL_21:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v18 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      id v9 = v18;
    }
    while (v18);
  }

  return v21;
}

@end