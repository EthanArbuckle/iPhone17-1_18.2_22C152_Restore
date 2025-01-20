@interface INAddMediaMediaItemResolutionResult
+ (INAddMediaMediaItemResolutionResult)unsupportedForReason:(INAddMediaMediaItemUnsupportedReason)reason;
+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INAddMediaMediaItemResolutionResult

+ (INAddMediaMediaItemResolutionResult)unsupportedForReason:(INAddMediaMediaItemUnsupportedReason)reason
{
  v4 = [a1 unsupported];
  [v4 setUnsupportedReason:reason];

  return (INAddMediaMediaItemResolutionResult *)v4;
}

+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___INAddMediaMediaItemResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successesWithResolvedMediaItems_, resolvedMediaItems);

  return (NSArray *)v3;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)INAddMediaMediaItemResolutionResult;
  v4 = [(INIntentResolutionResult *)&v12 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    objc_super v5 = [v4 payloadUnsupported];
    [v5 setReason:1000];

    v6 = [v4 payloadUnsupported];
    unint64_t v7 = [(INIntentResolutionResult *)self unsupportedReason];
    if (!v9 & v8)
    {
      switch(v7)
      {
        case 0x3E8uLL:
          uint64_t v10 = 100;
          break;
        case 0x3E9uLL:
          uint64_t v10 = 101;
          break;
        case 0x3EAuLL:
          uint64_t v10 = 102;
          break;
        case 0x3EBuLL:
          uint64_t v10 = 103;
          break;
        case 0x3ECuLL:
          uint64_t v10 = 104;
          break;
        case 0x3EDuLL:
          uint64_t v10 = 105;
          break;
        case 0x3EEuLL:
          uint64_t v10 = 106;
          break;
        default:
          uint64_t v10 = 0x7FFFFFFFLL;
          break;
      }
    }
    else
    {
      switch(v7)
      {
        case 1uLL:
          uint64_t v10 = 1;
          break;
        case 2uLL:
          uint64_t v10 = 2;
          break;
        case 3uLL:
          uint64_t v10 = 3;
          break;
        case 4uLL:
          uint64_t v10 = 4;
          break;
        case 5uLL:
          uint64_t v10 = 5;
          break;
        case 6uLL:
          uint64_t v10 = 6;
          break;
        case 7uLL:
          uint64_t v10 = 7;
          break;
        case 8uLL:
          uint64_t v10 = 8;
          break;
        default:
          JUMPOUT(0);
      }
    }
    [v6 setAddMediaIntentMediaItemsUnsupportedReason:v10];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INAddMediaMediaItemResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v16 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    char v8 = [v6 payloadUnsupported];
    int v9 = [v8 hasAddMediaIntentMediaItemsUnsupportedReason];

    if (v9)
    {
      uint64_t v10 = [v6 payloadUnsupported];
      int v11 = [v10 addMediaIntentMediaItemsUnsupportedReason];
      if (!v13 & v12)
      {
        switch(v11)
        {
          case 'd':
            uint64_t v14 = 1000;
            break;
          case 'e':
            uint64_t v14 = 1001;
            break;
          case 'f':
            uint64_t v14 = 1002;
            break;
          case 'g':
            uint64_t v14 = 1003;
            break;
          case 'h':
            uint64_t v14 = 1004;
            break;
          case 'i':
            uint64_t v14 = 1005;
            break;
          case 'j':
            uint64_t v14 = 1006;
            break;
          default:
            uint64_t v14 = 0;
            break;
        }
      }
      else
      {
        switch(v11)
        {
          case 1:
            uint64_t v14 = 1;
            break;
          case 2:
            uint64_t v14 = 2;
            break;
          case 3:
            uint64_t v14 = 3;
            break;
          case 4:
            uint64_t v14 = 4;
            break;
          case 5:
            uint64_t v14 = 5;
            break;
          case 6:
            uint64_t v14 = 6;
            break;
          case 7:
            uint64_t v14 = 7;
            break;
          case 8:
            uint64_t v14 = 8;
            break;
          default:
            JUMPOUT(0);
        }
      }
      [v7 setUnsupportedReason:v14];
    }
  }

  return v7;
}

@end