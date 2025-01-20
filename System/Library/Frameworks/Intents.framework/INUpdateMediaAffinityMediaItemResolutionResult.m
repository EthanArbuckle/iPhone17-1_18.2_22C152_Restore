@interface INUpdateMediaAffinityMediaItemResolutionResult
+ (INUpdateMediaAffinityMediaItemResolutionResult)unsupportedForReason:(INUpdateMediaAffinityMediaItemUnsupportedReason)reason;
+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INUpdateMediaAffinityMediaItemResolutionResult

+ (INUpdateMediaAffinityMediaItemResolutionResult)unsupportedForReason:(INUpdateMediaAffinityMediaItemUnsupportedReason)reason
{
  v4 = [a1 unsupported];
  [v4 setUnsupportedReason:reason];

  return (INUpdateMediaAffinityMediaItemResolutionResult *)v4;
}

+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___INUpdateMediaAffinityMediaItemResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successesWithResolvedMediaItems_, resolvedMediaItems);

  return (NSArray *)v3;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)INUpdateMediaAffinityMediaItemResolutionResult;
  v4 = [(INIntentResolutionResult *)&v10 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    objc_super v5 = [v4 payloadUnsupported];
    [v5 setReason:1000];

    v6 = [v4 payloadUnsupported];
    unint64_t v7 = [(INIntentResolutionResult *)self unsupportedReason];
    switch(v7)
    {
      case 1uLL:
        uint64_t v8 = 1;
        break;
      case 2uLL:
        uint64_t v8 = 2;
        break;
      case 3uLL:
        uint64_t v8 = 3;
        break;
      case 4uLL:
        uint64_t v8 = 4;
        break;
      case 5uLL:
        uint64_t v8 = 5;
        break;
      case 6uLL:
        uint64_t v8 = 6;
        break;
      case 7uLL:
        uint64_t v8 = 7;
        break;
      case 8uLL:
        uint64_t v8 = 8;
        break;
      default:
        switch(v7)
        {
          case 0x3E8uLL:
            uint64_t v8 = 100;
            break;
          case 0x3E9uLL:
            uint64_t v8 = 101;
            break;
          case 0x3EAuLL:
            uint64_t v8 = 102;
            break;
          case 0x3EBuLL:
            uint64_t v8 = 103;
            break;
          default:
            uint64_t v8 = 0x7FFFFFFFLL;
            break;
        }
        break;
    }
    [v6 setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:v8];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INUpdateMediaAffinityMediaItemResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v14 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    uint64_t v8 = [v6 payloadUnsupported];
    int v9 = [v8 hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason];

    if (v9)
    {
      objc_super v10 = [v6 payloadUnsupported];
      int v11 = [v10 updateMediaAffinityIntentMediaItemsUnsupportedReason];
      switch(v11)
      {
        case 1:
          uint64_t v12 = 1;
          break;
        case 2:
          uint64_t v12 = 2;
          break;
        case 3:
          uint64_t v12 = 3;
          break;
        case 4:
          uint64_t v12 = 4;
          break;
        case 5:
          uint64_t v12 = 5;
          break;
        case 6:
          uint64_t v12 = 6;
          break;
        case 7:
          uint64_t v12 = 7;
          break;
        case 8:
          uint64_t v12 = 8;
          break;
        default:
          switch(v11)
          {
            case 'd':
              uint64_t v12 = 1000;
              break;
            case 'e':
              uint64_t v12 = 1001;
              break;
            case 'f':
              uint64_t v12 = 1002;
              break;
            case 'g':
              uint64_t v12 = 1003;
              break;
            default:
              uint64_t v12 = 0;
              break;
          }
          break;
      }
      [v7 setUnsupportedReason:v12];
    }
  }

  return v7;
}

@end