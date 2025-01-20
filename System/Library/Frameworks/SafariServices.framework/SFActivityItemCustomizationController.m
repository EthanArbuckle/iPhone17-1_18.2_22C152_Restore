@interface SFActivityItemCustomizationController
@end

@implementation SFActivityItemCustomizationController

id __88___SFActivityItemCustomizationController__customizationGroupsForActivityViewController___block_invoke(uint64_t a1, void *a2)
{
  switch([a2 integerValue])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      v2 = _WBSLocalizedString();
      break;
    default:
      v2 = 0;
      break;
  }

  return v2;
}

uint64_t __88___SFActivityItemCustomizationController__customizationGroupsForActivityViewController___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 32), "_contentTypeForAllowedContentAtIndex:", objc_msgSend(a2, "selectedOptionIndex"));
  v3 = *(void **)(a1 + 32);

  return [v3 _customizationsDidChange];
}

uint64_t __54___SFActivityItemCustomizationController_setDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      if (!*(unsigned char *)(a1 + 40)) {
        goto LABEL_7;
      }
      uint64_t v3 = *(unsigned char *)(a1 + 41) == 0;
      break;
    case 2:
      if (!*(unsigned char *)(a1 + 40)) {
        goto LABEL_7;
      }
      int v4 = *(unsigned __int8 *)(a1 + 42);
      goto LABEL_11;
    case 3:
      v5 = [[_SFWebArchiveProvider alloc] initWithWebView:*(void *)(a1 + 32)];
      v6 = v5;
      if (*(unsigned char *)(a1 + 43)) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = [(_SFWebArchiveProvider *)v5 canGenerateWebArchive];
      }

      break;
    case 4:
      int v4 = *(unsigned __int8 *)(a1 + 44);
LABEL_11:
      uint64_t v3 = v4 != 0;
      break;
    case 5:
LABEL_7:
      uint64_t v3 = 0;
      break;
    default:
      uint64_t v3 = 1;
      break;
  }
  return v3;
}

@end