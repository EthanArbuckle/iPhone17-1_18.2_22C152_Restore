@interface CopyBrokerInfoForDeviceID
@end

@implementation CopyBrokerInfoForDeviceID

void __browser_CopyBrokerInfoForDeviceID_block_invoke(void *a1)
{
  v2 = (CFTypeRef *)a1[7];
  v4 = (CFTypeRef *)a1[8];
  v3 = (CFTypeRef *)a1[9];
  v5 = (void *)a1[10];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  Int64 = (const void *)CFNumberCreateInt64();
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 344), Int64);
  if (!Value)
  {
    APSLogErrorAt();
    int v14 = -6727;
    if (!Int64) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v9 = (uint64_t)Value;
  if (v2)
  {
    BrokerGroupID = (const void *)APBrokeredReceiverGetBrokerGroupID((uint64_t)Value);
    CFTypeRef *v2 = CFRetain(BrokerGroupID);
  }
  if (v4)
  {
    ReceiverGroupUUID = (const void *)APBrokeredReceiverGetReceiverGroupUUID(v9);
    CFTypeRef *v4 = CFRetain(ReceiverGroupUUID);
  }
  if (v3)
  {
    PublicReceiverUUID = (const void *)APBrokeredReceiverGetPublicReceiverUUID(v9);
    CFTypeRef *v3 = CFRetain(PublicReceiverUUID);
  }
  if (!v5)
  {
    int v14 = 0;
    if (!Int64) {
      goto LABEL_15;
    }
LABEL_14:
    CFRelease(Int64);
    goto LABEL_15;
  }
  LTPKHash = (const void *)APBrokeredReceiverGetLTPKHash(v9);
  if (LTPKHash) {
    LTPKHash = CFRetain(LTPKHash);
  }
  int v14 = 0;
  void *v5 = LTPKHash;
  if (Int64) {
    goto LABEL_14;
  }
LABEL_15:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v14;
}

@end