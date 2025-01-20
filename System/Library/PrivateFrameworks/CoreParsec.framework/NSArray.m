@interface NSArray
@end

@implementation NSArray

id __39__NSArray_SFExtras__sf_asCardSections___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(v3, "parsec_stringForKey:", @"type");
  switch(objc_msgSend(v4, "sf_cardSectionType"))
  {
    case 1u:
      uint64_t v5 = objc_msgSend(v3, "sf_asTitleCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 2u:
      uint64_t v5 = objc_msgSend(v3, "sf_asRichTitleCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 3u:
      uint64_t v5 = objc_msgSend(v3, "sf_asRowCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 4u:
      uint64_t v5 = objc_msgSend(v3, "sf_asDescriptionCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 5u:
      uint64_t v5 = objc_msgSend(v3, "sf_asMediaInfoCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 6u:
      uint64_t v5 = objc_msgSend(v3, "sf_asMediaPlayerCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 7u:
      uint64_t v5 = objc_msgSend(v3, "sf_asSocialMediaPostCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 8u:
      uint64_t v5 = objc_msgSend(v3, "sf_asMetaInfoCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 9u:
      uint64_t v5 = objc_msgSend(v3, "sf_asScoreboardCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0xAu:
      uint64_t v5 = objc_msgSend(v3, "sf_asNowPlayingCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0xBu:
      uint64_t v5 = objc_msgSend(v3, "sf_asKeyValueDataCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0xCu:
      uint64_t v5 = objc_msgSend(v3, "sf_asTableRowCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0xDu:
      uint64_t v5 = objc_msgSend(v3, "sf_asDetailedRowCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0xEu:
      uint64_t v5 = objc_msgSend(v3, "sf_asTextColumnsCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0xFu:
      uint64_t v5 = objc_msgSend(v3, "sf_asAppLinkCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0x10u:
      uint64_t v5 = objc_msgSend(v3, "sf_asTrackListCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0x11u:
      uint64_t v5 = objc_msgSend(v3, "sf_asStockChartCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0x12u:
      uint64_t v5 = objc_msgSend(v3, "sf_asWebCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0x13u:
      uint64_t v5 = objc_msgSend(v3, "sf_asFlightCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0x14u:
      uint64_t v5 = objc_msgSend(v3, "sf_asSuggestionCardSection:", *(void *)(a1 + 32));
      goto LABEL_28;
    case 0x15u:
      uint64_t v5 = objc_msgSend(v3, "sf_asWatchListCardSection:", *(void *)(a1 + 32));
LABEL_28:
      v7 = (void *)v5;
      break;
    default:
      if (PARLogHandleForCategory_onceToken_364 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
      }
      v6 = PARLogHandleForCategory_logHandles_1_365;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_19C7E7000, v6, OS_LOG_TYPE_ERROR, "unknown card section type: %@", (uint8_t *)&v9, 0xCu);
      }
      v7 = 0;
      break;
  }

  return v7;
}

uint64_t __74__NSArray_ParsecExtras__parsec_mapAndFilterObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__NSArray_ParsecExtras__parsec_filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end