@interface OSLogEventSerializationMetadata
@end

@implementation OSLogEventSerializationMetadata

void __63___OSLogEventSerializationMetadata_initWithDataRepresentation___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v10 = v7;
  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end