@interface NSDictionary(SFExtras)
- (id)sf_asActionItem:()SFExtras;
- (id)sf_asAirport;
- (id)sf_asAppLink:()SFExtras;
- (id)sf_asAppLinkCardSection:()SFExtras;
- (id)sf_asButton:()SFExtras;
- (id)sf_asColor:()SFExtras;
- (id)sf_asDescriptionCardSection:()SFExtras;
- (id)sf_asDetailedRowCardSection:()SFExtras;
- (id)sf_asFlight;
- (id)sf_asFlightCardSection:()SFExtras;
- (id)sf_asFormattedText:()SFExtras;
- (id)sf_asImage:()SFExtras;
- (id)sf_asKeyValueDataCardSection:()SFExtras;
- (id)sf_asMediaDetail:()SFExtras;
- (id)sf_asMediaInfoCardSection:()SFExtras;
- (id)sf_asMediaItem:()SFExtras;
- (id)sf_asMediaOffer:()SFExtras;
- (id)sf_asMediaPlayerCardSection:()SFExtras;
- (id)sf_asMetaInfoCardSection:()SFExtras;
- (id)sf_asNowPlayingCardSection:()SFExtras;
- (id)sf_asPunchout:()SFExtras;
- (id)sf_asResultEntity;
- (id)sf_asRichText:()SFExtras;
- (id)sf_asRichTitleCardSection:()SFExtras;
- (id)sf_asRowCardSection:()SFExtras;
- (id)sf_asScoreboardCardSection:()SFExtras;
- (id)sf_asSearchResult:()SFExtras factory:;
- (id)sf_asSocialMediaPostCardSection:()SFExtras;
- (id)sf_asStockChartCardSection:()SFExtras;
- (id)sf_asSuggestion:()SFExtras;
- (id)sf_asSuggestionCardSection:()SFExtras;
- (id)sf_asTableAlignmentSchema;
- (id)sf_asTableRowCardSection:()SFExtras;
- (id)sf_asTextColumnsCardSection:()SFExtras;
- (id)sf_asTitleCardSection:()SFExtras;
- (id)sf_asTopic;
- (id)sf_asTrack:()SFExtras;
- (id)sf_asTrackListCardSection:()SFExtras;
- (id)sf_asWatchListCardSection:()SFExtras;
- (id)sf_asWatchListItem:()SFExtras;
- (id)sf_asWebCardSection:()SFExtras;
- (id)sf_imageForKey:()SFExtras reply:;
- (uint64_t)sf_asPunchout;
- (uint64_t)sf_textColorForKey:()SFExtras;
- (void)sf_baseCardSection:()SFExtras reply:;
@end

@implementation NSDictionary(SFExtras)

- (id)sf_asResultEntity
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A348]);
  v3 = objc_msgSend(a1, "parsec_stringForKey:", @"name");
  [v2 setName:v3];

  v4 = objc_msgSend(a1, "parsec_stringForKey:", @"maps_encrypted_muid");
  objc_msgSend(v2, "setMaps_encrypted_muid:", v4);

  id v5 = objc_alloc_init(MEMORY[0x1E4F9A1C8]);
  v6 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"location_type_info");
  v7 = objc_msgSend(v6, "parsec_stringForKey:", @"address");
  [v5 setAddress:v7];

  objc_msgSend(v2, "setLocation_type_info:", v5);

  return v2;
}

- (id)sf_asWatchListCardSection:()SFExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F9A560];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);
  v7 = [a1 objectForKey:@"watch_list_item"];
  v8 = objc_msgSend(v7, "sf_asWatchListItem:", v5);

  [v6 setWatchListItem:v8];

  return v6;
}

- (id)sf_asSuggestionCardSection:()SFExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F9A488];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  v7 = objc_msgSend(a1, "parsec_stringForKey:", @"suggestion");
  v8 = [MEMORY[0x1E4F9A378] textWithString:v7];
  [v6 setSuggestionText:v8];

  objc_msgSend(v6, "setIsContact:", objc_msgSend(a1, "parsec_BOOLForKey:", @"is_contact"));
  v9 = (void *)MEMORY[0x1E4F9A378];
  v10 = objc_msgSend(a1, "parsec_stringForKey:", @"detail_text");
  v11 = [v9 textWithString:v10];
  [v6 setDetailText:v11];

  return v6;
}

- (id)sf_asFlightCardSection:()SFExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F9A0C8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  v7 = objc_msgSend(a1, "parsec_numberForKey:", @"selected_leg_index");
  v8 = v7;
  if (v7) {
    objc_msgSend(v6, "setSelectedLegIndex:", objc_msgSend(v7, "unsignedIntegerValue"));
  }
  v9 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"flight");
  v10 = objc_msgSend(v9, "sf_asFlight");
  [v6 setFlight:v10];

  return v6;
}

- (id)sf_asWebCardSection:()SFExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F9A580];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  v7 = objc_msgSend(a1, "parsec_stringForKey:", @"html");
  if (v7) {
    [v6 setHtmlString:v7];
  }

  return v6;
}

- (id)sf_asStockChartCardSection:()SFExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F9A468];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  v7 = objc_msgSend(a1, "parsec_URLForKey:", @"third_party_content");
  if (v7) {
    [v6 setThirdPartyContentURL:v7];
  }

  return v6;
}

- (id)sf_asTextColumnsCardSection:()SFExtras
{
  v4 = (objc_class *)MEMORY[0x1E4F9A4D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  v7 = objc_msgSend(a1, "parsec_arrayForKey:", @"columns");
  v8 = objc_msgSend(v7, "parsec_mapAndFilterObjectsUsingBlock:", &__block_literal_global_908);
  [v6 setColumns:v8];

  return v6;
}

- (id)sf_asDetailedRowCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A040]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "sf_imageForKey:reply:", @"thumbnail", v4);
  [v5 setThumbnail:v6];

  objc_msgSend(v5, "setPreventThumbnailImageScaling:", objc_msgSend(a1, "parsec_BOOLForKey:", @"thumbnail_image_scaling"));
  v7 = [a1 objectForKey:@"title"];
  v8 = objc_msgSend(v7, "sf_asRichText:", v4);
  [v5 setTitle:v8];

  v9 = [a1 objectForKey:@"secondary_title"];
  v10 = objc_msgSend(v9, "sf_asFormattedText:", v4);
  [v5 setSecondaryTitle:v10];

  v11 = objc_msgSend(a1, "sf_imageForKey:reply:", @"secondary_image", v4);
  [v5 setSecondaryTitleImage:v11];

  objc_msgSend(v5, "setIsSecondaryTitleDetached:", objc_msgSend(a1, "parsec_BOOLForKey:", @"secondary_title_detached"));
  v12 = objc_msgSend(a1, "parsec_arrayForKey:", @"descriptions");
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __54__NSDictionary_SFExtras__sf_asDetailedRowCardSection___block_invoke;
  v32[3] = &unk_1E59001E0;
  id v33 = v4;
  id v13 = v4;
  v14 = objc_msgSend(v12, "parsec_mapObjectsUsingBlock:", v32);
  [v5 setDescriptions:v14];

  v15 = [a1 objectForKey:@"footnote"];
  v16 = objc_msgSend(v15, "sf_asRichText:", v13);
  [v5 setFootnote:v16];

  v17 = [a1 objectForKey:@"trailing_top_text"];
  v18 = objc_msgSend(v17, "sf_asFormattedText:", v13);
  [v5 setTrailingTopText:v18];

  v19 = [a1 objectForKey:@"trailing_middle_text"];
  v20 = objc_msgSend(v19, "sf_asFormattedText:", v13);
  [v5 setTrailingMiddleText:v20];

  v21 = [a1 objectForKey:@"trailing_bottom_text"];
  v22 = objc_msgSend(v21, "sf_asFormattedText:", v13);
  [v5 setTrailingBottomText:v22];

  v23 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"action_item");
  v24 = objc_msgSend(v23, "sf_asActionItem:", v13);
  [v5 setAction:v24];

  v25 = [a1 objectForKey:@"button"];
  v26 = objc_msgSend(v25, "sf_asButton:", v13);
  [v5 setButton:v26];

  v27 = [a1 objectForKey:@"background_color"];
  v28 = objc_msgSend(v27, "sf_asColor:", v13);
  [v5 setBackgroundColor:v28];

  v29 = [a1 objectForKey:@"top_text"];
  v30 = objc_msgSend(v29, "sf_asRichText:", v13);
  [v5 setTopText:v30];

  return v5;
}

- (id)sf_asColor:()SFExtras
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F99F98]);
  v3 = objc_msgSend(a1, "parsec_numberForKey:", @"red_component");
  [v3 floatValue];
  [v2 setRedComponent:v4];

  id v5 = objc_msgSend(a1, "parsec_numberForKey:", @"green_component");
  [v5 floatValue];
  [v2 setGreenComponent:v6];

  v7 = objc_msgSend(a1, "parsec_numberForKey:", @"blue_component");
  [v7 floatValue];
  [v2 setBlueComponent:v8];

  v9 = objc_msgSend(a1, "parsec_numberForKey:", @"alpha_component");
  [v9 floatValue];
  [v2 setAlphaComponent:v10];

  return v2;
}

- (id)sf_asButton:()SFExtras
{
  float v4 = (objc_class *)MEMORY[0x1E4F99EE0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v5);
  [v6 setImage:v7];

  float v8 = objc_msgSend(a1, "sf_imageForKey:reply:", @"selected_image", v5);

  [v6 setSelectedImage:v8];

  return v6;
}

- (id)sf_asTableRowCardSection:()SFExtras
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "parsec_numberForKey:", @"row_type");
  uint64_t v6 = [v5 integerValue];

  switch(v6)
  {
    case 0:
      v7 = (objc_class *)MEMORY[0x1E4F9A4B8];
      goto LABEL_9;
    case 1:
      id v12 = objc_alloc_init(MEMORY[0x1E4F9A4B8]);
      [v12 setIsSubHeader:1];
      goto LABEL_10;
    case 2:
      v7 = (objc_class *)MEMORY[0x1E4F9A4B0];
LABEL_9:
      id v12 = objc_alloc_init(v7);
LABEL_10:
      objc_msgSend(a1, "sf_baseCardSection:reply:", v12, v4);
      id v13 = objc_msgSend(a1, "parsec_stringForKey:", @"table_id");
      [v12 setTableIdentifier:v13];

      v14 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"alignment_schema");
      v15 = objc_msgSend(v14, "sf_asTableAlignmentSchema");
      [v12 setAlignmentSchema:v15];

      v16 = objc_msgSend(a1, "parsec_arrayForKey:", @"value");
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __51__NSDictionary_SFExtras__sf_asTableRowCardSection___block_invoke;
      v26[3] = &unk_1E59001E0;
      id v27 = v4;
      v17 = objc_msgSend(v16, "parsec_mapObjectsUsingBlock:", v26);
      [v12 setData:v17];

      v18 = objc_msgSend(a1, "parsec_stringForKey:", @"tab_group_id");
      [v12 setTabGroupIdentifier:v18];

      objc_msgSend(v12, "setReducedRowHeight:", objc_msgSend(a1, "parsec_BOOLForKey:", @"reduced_row_height"));
      v19 = objc_msgSend(a1, "parsec_numberForKey:", @"vertical_align");
      objc_msgSend(v12, "setVerticalAlign:", objc_msgSend(v19, "sf_asRowAlignment"));

      objc_msgSend(v12, "setHasTopPadding:", objc_msgSend(a1, "parsec_BOOLForKey:", @"card_padding_top"));
      v20 = objc_msgSend(a1, "parsec_numberForKey:", @"align_rows_to_header");
      v21 = v20;
      if (v20) {
        uint64_t v22 = [v20 BOOLValue];
      }
      else {
        uint64_t v22 = 1;
      }
      [v12 setAlignRowsToHeader:v22];
      id v23 = v12;

      goto LABEL_18;
    case 3:
      if (PARLogHandleForCategory_onceToken_364 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
      }
      uint64_t v24 = PARLogHandleForCategory_logHandles_1_365;
      if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      v9 = "table row card section footer unsupported";
      float v10 = v24;
      uint32_t v11 = 2;
      break;
    default:
      if (PARLogHandleForCategory_onceToken_364 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_364, &__block_literal_global_1085);
      }
      uint64_t v8 = PARLogHandleForCategory_logHandles_1_365;
      if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_365, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = v6;
      v9 = "unknown table row card section row type: %ld";
      float v10 = v8;
      uint32_t v11 = 12;
      break;
  }
  _os_log_error_impl(&dword_19C7E7000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_17:
  id v23 = 0;
LABEL_18:

  return v23;
}

- (id)sf_asTableAlignmentSchema
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A4A0]);
  v3 = objc_msgSend(a1, "parsec_arrayForKey:", @"column_align");
  id v4 = objc_msgSend(a1, "parsec_arrayForKey:", @"within_column_align");
  id v5 = objc_msgSend(a1, "parsec_arrayForKey:", @"equal_width");
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __51__NSDictionary_SFExtras__sf_asTableAlignmentSchema__block_invoke;
  v14 = &unk_1E5900310;
  id v15 = v4;
  id v16 = v5;
  id v6 = v5;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v3, "parsec_mapObjectsUsingBlock:", &v11);
  objc_msgSend(v2, "setTableColumnAlignment:", v8, v11, v12, v13, v14);

  v9 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"metadata");
  [v2 setMetadata:v9];

  return v2;
}

- (id)sf_asKeyValueDataCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A170]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_arrayForKey:", @"keys");
  id v7 = objc_msgSend(a1, "parsec_arrayForKey:", @"values");
  if ([v6 count] && (uint64_t v8 = objc_msgSend(v6, "count"), v8 == objc_msgSend(v7, "count")))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__NSDictionary_SFExtras__sf_asKeyValueDataCardSection___block_invoke;
    v13[3] = &unk_1E59002E8;
    id v14 = v7;
    v9 = objc_msgSend(v6, "parsec_mapAndFilterObjectsUsingBlock:", v13);
    [v5 setData:v9];

    float v10 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v4);
    [v5 setAccessoryImage:v10];

    id v11 = v5;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)sf_asNowPlayingCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A260]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"subtitle");
  [v5 setSubtitle:v7];

  uint64_t v8 = objc_msgSend(a1, "parsec_arrayForKey:", @"movies");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__NSDictionary_SFExtras__sf_asNowPlayingCardSection___block_invoke;
  v12[3] = &unk_1E59001E0;
  id v13 = v4;
  id v9 = v4;
  float v10 = objc_msgSend(v8, "parsec_mapObjectsUsingBlock:", v12);
  [v5 setMovies:v10];

  return v5;
}

- (id)sf_asScoreboardCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A3B0]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"sub_title");
  [v5 setSubtitle:v7];

  uint64_t v8 = objc_msgSend(a1, "parsec_stringForKey:", @"readable_string");
  [v5 setAccessibilityDescription:v8];

  id v9 = objc_msgSend(a1, "parsec_arrayForKey:", @"images");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__NSDictionary_SFExtras__sf_asScoreboardCardSection___block_invoke;
  v21[3] = &unk_1E59002C0;
  id v22 = v4;
  id v10 = v4;
  id v11 = objc_msgSend(v9, "parsec_mapAndFilterObjectsUsingBlock:", v21);

  if ([v11 count] == 2)
  {
    uint64_t v12 = objc_msgSend(a1, "parsec_arrayForKey:", @"scores");
    if ([v12 count] == 2)
    {
      id v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [v11 objectAtIndexedSubscript:0];
      [v14 setScore:v13];

      id v15 = [v12 objectAtIndexedSubscript:1];
      id v16 = [v11 objectAtIndexedSubscript:1];
      [v16 setScore:v15];
    }
    v17 = [v11 objectAtIndexedSubscript:0];
    [v5 setTeam1:v17];

    v18 = [v11 objectAtIndexedSubscript:1];
    [v5 setTeam2:v18];

    v19 = objc_msgSend(a1, "parsec_stringForKey:", @"event_status");
    [v5 setEventStatus:v19];
  }

  return v5;
}

- (id)sf_asMetaInfoCardSection:()SFExtras
{
  id v4 = (objc_class *)MEMORY[0x1E4F9A240];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setTrending:", objc_msgSend(a1, "parsec_BOOLForKey:", @"trending"));
  id v7 = objc_msgSend(a1, "parsec_URLForKey:", @"host_page_url");
  [v6 setHostPageURL:v7];

  uint64_t v8 = objc_msgSend(a1, "parsec_URLForKey:", @"content_url");
  [v6 setContentURL:v8];

  id v9 = objc_msgSend(a1, "sf_imageForKey:reply:", @"badge_image", v5);

  [v6 setBadge:v9];

  return v6;
}

- (id)sf_asSocialMediaPostCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A430]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setName:v6];

  objc_msgSend(v5, "setNameNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", @"title_nowrap"));
  id v7 = objc_msgSend(a1, "parsec_numberForKey:", @"title_maxlines");
  [v5 setNameMaxLines:v7];

  uint64_t v8 = objc_msgSend(a1, "parsec_stringForKey:", @"subtitle");
  [v5 setHandle:v8];

  id v9 = objc_msgSend(a1, "sf_imageForKey:reply:", @"title_glyph", v4);
  [v5 setVerifiedGlyph:v9];

  id v10 = objc_msgSend(a1, "sf_imageForKey:reply:", @"thumbnail", v4);
  [v5 setProfilePicture:v10];

  id v11 = objc_alloc_init(MEMORY[0x1E4F9A378]);
  uint64_t v12 = [a1 objectForKeyedSubscript:@"formatted_text"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__NSDictionary_SFExtras__sf_asSocialMediaPostCardSection___block_invoke;
  v19[3] = &unk_1E59001E0;
  id v20 = v4;
  id v13 = v4;
  id v14 = objc_msgSend(v12, "parsec_mapAndFilterObjectsUsingBlock:", v19);
  [v11 setFormattedTextPieces:v14];

  [v5 setPost:v11];
  id v15 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v13);
  [v5 setPicture:v15];

  id v16 = objc_msgSend(a1, "parsec_stringForKey:", @"date");
  [v5 setTimestamp:v16];

  v17 = objc_msgSend(a1, "parsec_stringForKey:", @"footnote");
  [v5 setFootnote:v17];

  return v5;
}

- (id)sf_asMediaPlayerCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A238]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = objc_msgSend(a1, "parsec_arrayForKey:", @"trailers");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NSDictionary_SFExtras__sf_asMediaPlayerCardSection___block_invoke;
  v11[3] = &unk_1E5900298;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "parsec_mapAndFilterObjectsUsingBlock:", v11);
  [v5 setMediaItems:v9];

  return v5;
}

- (id)sf_asMediaInfoCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A218]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "sf_asMediaItem:", v4);
  [v5 setMediaItem:v6];

  id v7 = objc_msgSend(a1, "parsec_arrayForKey:", @"sections");
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke;
  v27[3] = &unk_1E59001E0;
  id v8 = v4;
  id v28 = v8;
  id v9 = objc_msgSend(v7, "parsec_mapObjectsUsingBlock:", v27);
  [v5 setDetails:v9];

  id v10 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"action_button");
  id v11 = objc_msgSend(v10, "sf_asActionItem:", v8);
  [v5 setPlayAction:v11];

  id v12 = objc_msgSend(a1, "parsec_arrayForKey:", @"buy_button_sections");
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke_2;
  v25 = &unk_1E59001E0;
  id v26 = v8;
  id v13 = v8;
  id v14 = objc_msgSend(v12, "parsec_mapObjectsUsingBlock:", &v22);
  objc_msgSend(v5, "setOffers:", v14, v22, v23, v24, v25);

  id v15 = objc_msgSend(a1, "parsec_stringForKey:", @"watchlist_identifier");
  [v5 setWatchListIdentifier:v15];

  id v16 = objc_msgSend(a1, "parsec_stringForKey:", @"watchlist_button_label");
  [v5 setWatchListButtonLabel:v16];

  v17 = objc_msgSend(a1, "parsec_stringForKey:", @"watchlist_confirmation_text");
  [v5 setWatchListConfirmationText:v17];

  v18 = objc_msgSend(a1, "parsec_stringForKey:", @"watchlist_continuation_text");
  [v5 setWatchListContinuationText:v18];

  objc_msgSend(v5, "setIsMediaContainer:", objc_msgSend(a1, "parsec_BOOLForKey:", @"is_media_container"));
  v19 = [a1 objectForKey:@"special_offer"];
  id v20 = objc_msgSend(v19, "sf_asRichText:", v13);
  [v5 setSpecialOfferButtonLabel:v20];

  return v5;
}

- (id)sf_asMediaOffer:()SFExtras
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F9A230];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v6 setLabel:v7];

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"subtitle");
  [v6 setSublabel:v8];

  id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"offer_type");
  [v6 setOfferIdentifier:v9];

  uint64_t v10 = objc_msgSend(a1, "parsec_stringForKey:", @"adam_id");
  id v11 = (void *)v10;
  if (v10)
  {
    v21[0] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v6 setStoreIdentifiers:v12];
  }
  else
  {
    [v6 setStoreIdentifiers:0];
  }
  id v13 = objc_msgSend(a1, "parsec_URLForKey:", @"url");
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
    id v20 = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v14 setUrls:v15];

    id v16 = [v6 offerIdentifier];
    if (v16)
    {
      [v14 setActionTarget:v16];
    }
    else
    {
      v17 = objc_msgSend(a1, "parsec_stringForKey:", @"action_target_id");
      [v14 setActionTarget:v17];
    }
    [v6 setPunchout:v14];
  }
  objc_msgSend(v6, "setIsEnabled:", objc_msgSend(a1, "parsec_BOOLForKey:", @"enabled"));
  v18 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v5);

  [v6 setImage:v18];

  return v6;
}

- (id)sf_asTrack:()SFExtras
{
  id v4 = (objc_class *)MEMORY[0x1E4F9A500];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"name");
  [v6 setTitle:v7];

  id v8 = objc_msgSend(a1, "parsec_URLForKey:", @"preview_url");
  [v6 setPreview:v8];
  objc_msgSend(v6, "setHighlighted:", objc_msgSend(a1, "parsec_BOOLForKey:", @"highlighted"));
  id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"number");
  [v6 setNumber:v9];

  uint64_t v10 = objc_msgSend(a1, "parsec_stringForKey:", @"length");
  [v6 setDuration:v10];

  id v11 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"action_button");
  id v12 = objc_msgSend(v11, "sf_asActionItem:", v5);

  [v6 setPlayAction:v12];

  return v6;
}

- (id)sf_asAppLink:()SFExtras
{
  id v4 = (objc_class *)MEMORY[0x1E4F99EC0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v6 setTitle:v7];

  id v8 = objc_msgSend(a1, "parsec_URLForKey:", @"url");
  id v9 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v8];
  [v6 setAppPunchout:v9];

  uint64_t v10 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v5);

  [v6 setImage:v10];
  id v11 = objc_msgSend(a1, "parsec_stringForKey:", @"image_align");
  objc_msgSend(v6, "setImageAlign:", objc_msgSend(v11, "sf_asImageAlignment"));

  return v6;
}

- (id)sf_asWatchListItem:()SFExtras
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A568]);
  v3 = objc_msgSend(a1, "parsec_stringForKey:", @"watchlist_identifier");
  [v2 setWatchListIdentifier:v3];

  id v4 = objc_msgSend(a1, "parsec_stringForKey:", @"added_to_upnext_text");
  [v2 setAddedToUpNextText:v4];

  id v5 = objc_msgSend(a1, "parsec_stringForKey:", @"add_to_upnext_text");
  [v2 setAddToUpNextText:v5];

  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"in_upnext_text");
  [v2 setInUpNextText:v6];

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"season_episode_format");
  [v2 setSeasonEpisodeTextFormat:v7];

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"continue_in_format");
  [v2 setContinueInTextFormat:v8];

  id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"open_button");
  [v2 setOpenButtonTitle:v9];

  uint64_t v10 = objc_msgSend(a1, "parsec_stringForKey:", @"install_button");
  [v2 setInstallButtonTitle:v10];

  id v11 = objc_msgSend(a1, "parsec_stringForKey:", @"purchase_offer_format");
  [v2 setPurchaseOfferTextFormat:v11];

  id v12 = objc_msgSend(a1, "parsec_stringForKey:", @"watch_live_in_format");
  [v2 setWatchLiveTextFormat:v12];

  return v2;
}

- (id)sf_asMediaDetail:()SFExtras
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A210]);
  v3 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v2 setTitle:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F9A4C0]);
  id v5 = objc_msgSend(a1, "parsec_stringForKey:", @"description");
  [v4 setText:v5];

  id v6 = objc_msgSend(a1, "parsec_numberForKey:", @"description_maxlines");
  objc_msgSend(v4, "setMaxLines:", objc_msgSend(v6, "unsignedIntegerValue"));

  [v2 setContent:v4];

  return v2;
}

- (id)sf_asMediaItem:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A220]);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = (void *)MEMORY[0x1E4F9A4C0];
  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"subtitle");
  id v9 = [v7 textWithString:v8];
  [v5 setSubtitleText:v9];

  uint64_t v10 = objc_msgSend(a1, "parsec_numberForKey:", @"subtitle_maxlines");
  uint64_t v11 = [v10 unsignedIntegerValue];
  id v12 = [v5 subtitleText];
  [v12 setMaxLines:v11];

  id v13 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v4);
  [v5 setThumbnail:v13];

  id v14 = objc_msgSend(a1, "sf_imageForKey:reply:", @"rt_glyph", v4);
  [v5 setReviewGlyph:v14];

  id v15 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image_overlay", v4);
  [v5 setOverlayImage:v15];

  id v16 = objc_msgSend(a1, "parsec_stringForKey:", @"rt_text");
  [v5 setReviewText:v16];

  v17 = (void *)MEMORY[0x1E4F9A2F8];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke;
  v38[3] = &unk_1E5900270;
  v38[4] = a1;
  v18 = objc_msgSend(&unk_1EED830D8, "parsec_mapAndFilterObjectsUsingBlock:", v38);
  v19 = [v17 punchoutWithURLs:v18];
  [v5 setPunchout:v19];

  id v20 = [a1 objectForKey:@"trailer_url"];

  if (v20)
  {
    v21 = objc_msgSend(a1, "parsec_stringForKey:", @"caption");
    [v5 setTitle:v21];

    uint64_t v22 = objc_msgSend(a1, "parsec_URLForKey:", @"trailer_url");
    uint64_t v23 = objc_msgSend(v22, "sf_asPunchout");

    [v23 setActionTarget:@"trailer"];
    [v5 setPunchout:v23];
  }
  uint64_t v24 = objc_msgSend(a1, "parsec_stringForKey:", @"content_rating_text");
  [v5 setContentAdvisory:v24];

  v25 = objc_msgSend(a1, "parsec_arrayForKey:", @"more_glyphs");
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_2;
  v36[3] = &unk_1E59001E0;
  id v26 = v4;
  id v37 = v26;
  id v27 = objc_msgSend(v25, "parsec_mapAndFilterObjectsUsingBlock:", v36);

  id v28 = objc_msgSend(a1, "parsec_arrayForKey:", @"subtitle_custom_line_breaking");
  [v5 setSubtitleCustomLineBreaking:v28];

  uint64_t v29 = objc_msgSend(a1, "parsec_arrayForKey:", @"buy_button_sections");
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_3;
  v34[3] = &unk_1E59001E0;
  id v35 = v26;
  id v30 = v26;
  v31 = objc_msgSend(v29, "parsec_mapObjectsUsingBlock:", v34);
  [v5 setBuyOptions:v31];

  v32 = [v27 firstObject];
  [v5 setContentAdvisoryImage:v32];

  return v5;
}

- (id)sf_asDescriptionCardSection:()SFExtras
{
  id v4 = (objc_class *)MEMORY[0x1E4F9A038];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);
  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v6 setTitle:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F9A4C0]);
  id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"description");
  [v8 setText:v9];

  uint64_t v10 = objc_msgSend(a1, "parsec_numberForKey:", @"description_maxlines");
  objc_msgSend(v8, "setMaxLines:", objc_msgSend(v10, "unsignedIntegerValue"));

  [v6 setDescriptionText:v8];
  uint64_t v11 = objc_msgSend(a1, "parsec_stringForKey:", @"description_expand_text");
  [v6 setExpandText:v11];

  id v12 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v5);
  [v6 setImage:v12];

  objc_msgSend(v6, "setTitleNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", @"title_nowrap"));
  id v13 = objc_msgSend(a1, "parsec_numberForKey:", @"title_weight");
  [v6 setTitleWeight:v13];

  id v14 = objc_msgSend(a1, "parsec_numberForKey:", @"description_size");
  [v6 setDescriptionSize:v14];

  id v15 = objc_msgSend(a1, "parsec_numberForKey:", @"description_weight");
  [v6 setDescriptionWeight:v15];

  objc_msgSend(v6, "setDescriptionExpand:", objc_msgSend(a1, "parsec_BOOLForKey:", @"description_expand"));
  id v16 = objc_msgSend(a1, "parsec_stringForKey:", @"image_align");
  objc_msgSend(v6, "setImageAlign:", objc_msgSend(v16, "sf_asImageAlignment"));

  v17 = objc_msgSend(a1, "parsec_stringForKey:", @"text_align");
  objc_msgSend(v6, "setTextAlign:", objc_msgSend(v17, "sf_asTextAlignment"));

  v18 = objc_msgSend(a1, "parsec_stringForKey:", @"attribution_text");
  [v6 setAttributionText:v18];

  v19 = objc_msgSend(a1, "parsec_URLForKey:", @"attribution_url");
  [v6 setAttributionURL:v19];

  id v20 = objc_msgSend(a1, "sf_imageForKey:reply:", @"attribution_glyph", v5);

  [v6 setAttributionGlyph:v20];

  return v6;
}

- (id)sf_asTrackListCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A508]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = objc_msgSend(a1, "parsec_arrayForKey:", @"tracks");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__NSDictionary_SFExtras__sf_asTrackListCardSection___block_invoke;
  v11[3] = &unk_1E59001E0;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "parsec_mapObjectsUsingBlock:", v11);
  [v5 setTracks:v9];

  return v5;
}

- (id)sf_asAppLinkCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F99EC8]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = objc_msgSend(a1, "parsec_arrayForKey:", @"sections");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__NSDictionary_SFExtras__sf_asAppLinkCardSection___block_invoke;
  v11[3] = &unk_1E59001E0;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "parsec_mapObjectsUsingBlock:", v11);
  [v5 setAppLinks:v9];

  return v5;
}

- (id)sf_asTitleCardSection:()SFExtras
{
  id v4 = (objc_class *)MEMORY[0x1E4F9A4E8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v6 setTitle:v7];

  return v6;
}

- (id)sf_asRichTitleCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A380]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"title");
  [v5 setTitle:v6];

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"title_align");
  objc_msgSend(v5, "setIsCentered:", objc_msgSend(v7, "isEqualToString:", @"center"));

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"subtitle");
  [v5 setSubtitle:v8];

  id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"content_rating_text");
  [v5 setContentAdvisory:v9];

  uint64_t v10 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image", v4);
  [v5 setTitleImage:v10];

  uint64_t v11 = objc_msgSend(a1, "parsec_stringForKey:", @"description");
  [v5 setDescriptionText:v11];

  id v12 = objc_msgSend(a1, "sf_imageForKey:reply:", @"rt_glyph", v4);
  [v5 setReviewGlyph:v12];

  id v13 = objc_msgSend(a1, "parsec_stringForKey:", @"rt_text");
  [v5 setReviewText:v13];

  objc_msgSend(v5, "setReviewNewLine:", objc_msgSend(a1, "parsec_BOOLForKey:", @"rt_newline"));
  id v14 = objc_msgSend(a1, "parsec_arrayForKey:", @"more_glyphs");
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke;
  v39[3] = &unk_1E59001E0;
  id v15 = v4;
  id v40 = v15;
  id v16 = objc_msgSend(v14, "parsec_mapAndFilterObjectsUsingBlock:", v39);
  [v5 setMoreGlyphs:v16];

  v17 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"auxiliary_info");
  v18 = objc_msgSend(v17, "parsec_stringForKey:", @"top_text");
  [v5 setAuxiliaryTopText:v18];

  v19 = objc_msgSend(v17, "parsec_stringForKey:", @"middle_text");
  [v5 setAuxiliaryMiddleText:v19];

  id v20 = objc_msgSend(v17, "parsec_stringForKey:", @"bottom_text");
  [v5 setAuxiliaryBottomText:v20];

  objc_msgSend(v5, "setAuxiliaryBottomTextColor:", objc_msgSend(v17, "sf_textColorForKey:", @"bottom_text_color"));
  v21 = objc_msgSend(v17, "parsec_numberForKey:", @"align");
  [v5 setAuxiliaryAlignment:v21];

  objc_msgSend(v5, "setHideVerticalDivider:", objc_msgSend(a1, "parsec_BOOLForKey:", @"hide_vertical_divider"));
  uint64_t v22 = objc_msgSend(a1, "parsec_stringForKey:", @"title_align");
  objc_msgSend(v5, "setTitleAlign:", objc_msgSend(v22, "sf_asTextAlignment"));

  uint64_t v23 = objc_msgSend(a1, "parsec_numberForKey:", @"title_weight");
  [v5 setTitleWeight:v23];

  objc_msgSend(v5, "setThumbnailCropCircle:", objc_msgSend(a1, "parsec_BOOLForKey:", @"thumbnail_crop_circle"));
  uint64_t v24 = objc_msgSend(a1, "sf_imageForKey:reply:", @"image_overlay", v15);
  [v5 setImageOverlay:v24];

  v25 = objc_msgSend(a1, "parsec_numberForKey:", @"rating");
  [v5 setRating:v25];

  id v26 = objc_msgSend(a1, "parsec_stringForKey:", @"rating_text");
  [v5 setRatingText:v26];

  id v27 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"action_button");
  id v28 = objc_msgSend(v27, "sf_asActionItem:", v15);
  [v5 setPlayAction:v28];

  uint64_t v29 = objc_msgSend(a1, "parsec_stringForKey:", @"action_button_align");
  objc_msgSend(v5, "setPlayActionAlign:", objc_msgSend(v29, "sf_asButtonAlignment"));

  id v30 = objc_msgSend(a1, "parsec_arrayForKey:", @"buy_button_sections");
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke_2;
  id v37 = &unk_1E59001E0;
  id v38 = v15;
  id v31 = v15;
  v32 = objc_msgSend(v30, "parsec_mapObjectsUsingBlock:", &v34);
  objc_msgSend(v5, "setOffers:", v32, v34, v35, v36, v37);

  return v5;
}

- (id)sf_asRowCardSection:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A388]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"key");
  uint64_t v7 = objc_msgSend(a1, "parsec_stringForKey:", @"value");
  id v8 = (void *)v7;
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)v7;
  }
  if (v6) {
    uint64_t v10 = (void *)v7;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v9;
  id v12 = v10;
  if (v11)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F9A378]);
    [v13 setText:v11];
    [v5 setLeadingText:v13];
    uint64_t v14 = objc_msgSend(a1, "parsec_BOOLForKey:", @"key_nowrap") ^ 1;
    [v5 leadingText];
    v16 = id v15 = v11;
    [v16 setMaxLines:v14];

    id v11 = v15;
  }
  if (v12)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F9A378]);
    [v17 setText:v12];
    [v5 setTrailingText:v17];
  }
  v18 = objc_msgSend(a1, "sf_imageForKey:reply:", @"value_image", v4);
  [v5 setImage:v18];

  v19 = objc_msgSend(a1, "parsec_stringForKey:", @"value_image_align");
  char v20 = [v19 isEqualToString:@"left"];

  if ((v20 & 1) == 0) {
    [v5 setImageIsRightAligned:1];
  }
  v21 = objc_msgSend(a1, "sf_imageForKey:reply:", @"attribution_image", v4);
  [v5 setAttributionImage:v21];

  [v5 setKey:v6];
  objc_msgSend(v5, "setKeyNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", @"key_nowrap"));
  uint64_t v22 = objc_msgSend(a1, "parsec_numberForKey:", @"key_weight");
  [v5 setKeyWeight:v22];

  objc_msgSend(v5, "setCardPaddingBottom:", objc_msgSend(a1, "parsec_BOOLForKey:", @"card_padding_bottom"));
  [v5 setValue:v8];
  objc_msgSend(v5, "setValueNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", @"value_nowrap"));
  uint64_t v23 = objc_msgSend(a1, "parsec_numberForKey:", @"value_weight");
  [v5 setValueWeight:v23];

  return v5;
}

- (void)sf_baseCardSection:()SFExtras reply:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(a1, "parsec_URLForKey:", @"url");
  id v9 = objc_msgSend(a1, "parsec_arrayForKey:", @"punchouts");
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__NSDictionary_SFExtras__sf_baseCardSection_reply___block_invoke;
  v31[3] = &unk_1E5900248;
  v31[4] = v8;
  v31[5] = a1;
  uint64_t v10 = objc_msgSend(v9, "parsec_mapObjectsUsingBlock:", v31);
  [v6 setPunchoutOptions:v10];

  id v11 = objc_msgSend(a1, "parsec_stringForKey:", @"punchout_picker_label");
  [v6 setPunchoutPickerTitle:v11];

  id v12 = objc_msgSend(a1, "parsec_stringForKey:", @"punchout_picker_dismiss_label");
  [v6 setPunchoutPickerDismissText:v12];

  id v13 = [v6 punchoutOptions];
  uint64_t v14 = [v13 count];

  if (!v14 && v8)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
    v33[0] = v8;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v15 setUrls:v16];

    objc_msgSend(a1, "parsec_stringForKey:", @"action_target_id");
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v17 length]) {
      v18 = v17;
    }
    else {
      v18 = @"open";
    }
    [v15 setActionTarget:v18];
    id v32 = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v6 setPunchoutOptions:v19];
  }
  char v20 = objc_msgSend(a1, "parsec_stringForKey:", @"card_section_id");
  [v6 setCardSectionId:v20];

  v21 = objc_msgSend(a1, "parsec_stringForKey:", @"result_id");
  [v6 setResultIdentifier:v21];

  uint64_t v22 = objc_msgSend(a1, "parsec_stringForKey:", @"type");
  [v6 setType:v22];

  uint64_t v23 = objc_msgSend(a1, "parsec_numberForKey:", @"separator_style");
  uint64_t v24 = [v23 integerValue];

  objc_msgSend(v6, "setHideDivider:", objc_msgSend(a1, "parsec_BOOLForKey:", @"hide_divider"));
  if (!v24)
  {
    if (![v6 hideDivider]) {
      goto LABEL_11;
    }
    uint64_t v24 = 1;
  }
  [v6 setSeparatorStyle:v24];
LABEL_11:
  objc_msgSend(v6, "setCanBeHidden:", objc_msgSend(a1, "parsec_BOOLForKey:", @"can_be_hidden"));
  v25 = objc_msgSend(a1, "parsec_stringForKey:", @"card_url");
  if ([v25 length])
  {
    id v26 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
    if (v26)
    {
      id v27 = objc_msgSend(a1, "parsec_stringForKey:", @"card_title");
      id v28 = objc_alloc_init(MEMORY[0x1E4F99F20]);
      [v28 setType:2];
      [v28 setSource:1];
      [v28 setTitle:v27];
      [v28 setUrlValue:v26];
      uint64_t v29 = [v7 task];
      id v30 = [v29 request];
      objc_msgSend(v28, "setQueryId:", objc_msgSend(v30, "queryId"));

      [v6 setNextCard:v28];
    }
  }
}

- (id)sf_asSuggestion:()SFExtras
{
  id v4 = a3;
  id v5 = [v4 task];
  id v6 = [v5 request];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 task];
    id v8 = [v7 request];
    id v9 = [v8 queryString];
  }
  else
  {
    id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"query");
  }

  id v10 = objc_alloc(MEMORY[0x1E4F9A3C8]);
  id v11 = objc_msgSend(a1, "parsec_stringForKey:", @"suggestion");
  id v12 = objc_msgSend(a1, "parsec_numberForKey:", @"type");
  unsigned int v13 = [v12 intValue];
  if (v13 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13;
  }
  id v15 = (void *)[v10 initWithSuggestion:v11 query:v9 score:v14 type:0.0];

  id v16 = objc_msgSend(a1, "parsec_numberForKey:", @"score");
  [v16 floatValue];
  [v15 setScore:v17];

  v18 = objc_msgSend(a1, "parsec_stringForKey:", @"utterance_text");
  [v15 setUtteranceText:v18];

  v19 = objc_msgSend(a1, "parsec_stringForKey:", @"bundle_id");
  [v15 setBundleIdentifier:v19];

  char v20 = objc_msgSend(a1, "parsec_stringForKey:", @"fbr");
  [v15 setFbr:v20];

  objc_msgSend(v15, "setPreviouslyEngaged:", objc_msgSend(a1, "parsec_BOOLForKey:", @"ice"));
  v21 = objc_msgSend(a1, "parsec_stringForKey:", @"detail_text");
  [v15 setDetailText:v21];

  uint64_t v22 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"server_features");
  uint64_t v23 = (void *)[v22 mutableCopy];
  [v15 setServerFeatures:v23];

  return v15;
}

- (id)sf_asFlight
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A0C0]);
  v3 = objc_msgSend(a1, "parsec_stringForKey:", @"id");
  [v2 setFlightID:v3];

  id v4 = objc_msgSend(a1, "parsec_stringForKey:", @"carrier_code");
  [v2 setCarrierCode:v4];

  id v5 = objc_msgSend(a1, "parsec_stringForKey:", @"carrier_name");
  [v2 setCarrierName:v5];

  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"carrier_phone_number");
  [v2 setCarrierPhoneNumber:v6];

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"flight_number");
  [v2 setFlightNumber:v7];

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"operator_carrier_code");
  [v2 setOperatorCarrierCode:v8];

  id v9 = objc_msgSend(a1, "parsec_stringForKey:", @"operator_flight_number");
  [v2 setOperatorFlightNumber:v9];

  id v10 = objc_msgSend(a1, "parsec_arrayForKey:", @"legs");
  id v11 = objc_msgSend(v10, "parsec_mapObjectsUsingBlock:", &__block_literal_global_462);

  [v2 setLegs:v11];

  return v2;
}

- (id)sf_asTopic
{
  id v2 = objc_msgSend(a1, "parsec_stringForKey:", @"query");
  v3 = objc_msgSend(a1, "parsec_numberForKey:", @"type");
  id v4 = objc_msgSend(a1, "parsec_stringForKey:", @"id");
  if ([v3 intValue] == 1)
  {
    id v5 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"Detail");
    id v6 = objc_msgSend(v5, "parsec_dictionaryForKey:", @"flight");

    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    id v8 = objc_msgSend(v6, "parsec_numberForKey:", @"timestamp");
    id v9 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v8, "intValue"));

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F9A0D8]) initWithQuery:v2 date:v9 identifier:v4];
LABEL_3:

    goto LABEL_16;
  }
  if ([v3 intValue] == 2)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F9A300]);
    uint64_t v12 = 1;
  }
  else
  {
    if ([v3 intValue] == 3)
    {
      unsigned int v13 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"Detail");
      uint64_t v14 = objc_msgSend(v13, "parsec_dictionaryForKey:", @"weather");

      id v15 = objc_alloc_init(MEMORY[0x1E4F9A188]);
      id v16 = objc_msgSend(v14, "parsec_numberForKey:", @"lat");
      [v16 doubleValue];
      objc_msgSend(v15, "setLat:");

      float v17 = objc_msgSend(v14, "parsec_numberForKey:", @"long");
      [v17 doubleValue];
      objc_msgSend(v15, "setLng:");

      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F9A578]) initWithQuery:v2 location:v15 identifier:v4];
      goto LABEL_16;
    }
    if ([v3 intValue] == 4)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F9A300]);
      uint64_t v12 = 2;
    }
    else if ([v3 intValue] == 6)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F9A300]);
      uint64_t v12 = 6;
    }
    else
    {
      if ([v3 intValue] != 7)
      {
        if ([v3 intValue] == 8)
        {
          char v20 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"Detail");
          id v6 = objc_msgSend(v20, "parsec_dictionaryForKey:", @"sports");

          id v21 = objc_alloc(MEMORY[0x1E4F9A448]);
          uint64_t v22 = objc_msgSend(v6, "parsec_stringForKey:", @"requested_entity_type");
          id v10 = (void *)[v21 initWithQuery:v2 requestedEntityType:v22 identifier:v4];

          goto LABEL_3;
        }
        uint64_t v18 = [objc_alloc(MEMORY[0x1E4F9A300]) initWithType:7 query:v2];
        goto LABEL_15;
      }
      id v11 = objc_alloc(MEMORY[0x1E4F9A300]);
      uint64_t v12 = 8;
    }
  }
  uint64_t v18 = [v11 initWithType:v12 query:v2 identifier:v4];
LABEL_15:
  id v10 = (void *)v18;
LABEL_16:

  return v10;
}

- (id)sf_asAirport
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F99E90]);
  v3 = objc_msgSend(a1, "parsec_stringForKey:", @"code");
  [v2 setCode:v3];

  id v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = objc_msgSend(a1, "parsec_stringForKey:", @"timezone");
  id v6 = [v4 timeZoneWithName:v5];
  [v2 setTimezone:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F9A188]);
  id v8 = objc_msgSend(a1, "parsec_numberForKey:", @"latitude");
  [v8 doubleValue];
  objc_msgSend(v7, "setLat:");

  id v9 = objc_msgSend(a1, "parsec_numberForKey:", @"longitude");
  [v9 doubleValue];
  objc_msgSend(v7, "setLng:");

  [v2 setLocation:v7];
  id v10 = objc_msgSend(a1, "parsec_stringForKey:", @"city");
  [v2 setCity:v10];

  id v11 = objc_msgSend(a1, "parsec_stringForKey:", @"street");
  [v2 setStreet:v11];

  uint64_t v12 = objc_msgSend(a1, "parsec_stringForKey:", @"district");
  [v2 setDistrict:v12];

  unsigned int v13 = objc_msgSend(a1, "parsec_stringForKey:", @"state");
  [v2 setState:v13];

  uint64_t v14 = objc_msgSend(a1, "parsec_stringForKey:", @"postal_code");
  [v2 setPostalCode:v14];

  id v15 = objc_msgSend(a1, "parsec_stringForKey:", @"country_code");
  [v2 setCountryCode:v15];

  id v16 = objc_msgSend(a1, "parsec_stringForKey:", @"country");
  [v2 setCountry:v16];

  return v2;
}

- (id)sf_asActionItem:()SFExtras
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F99E88];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"label");
  [v6 setLabel:v7];

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"label_itunes");
  [v6 setLabelForLocalMedia:v8];

  objc_msgSend(v6, "setIsOverlay:", objc_msgSend(a1, "parsec_BOOLForKey:", @"is_overlay"));
  id v9 = objc_msgSend(a1, "parsec_arrayForKey:", @"adam_ids");
  [v6 setStoreIdentifiers:v9];

  id v10 = objc_msgSend(a1, "parsec_stringForKey:", @"phone_number");
  [v6 setPhoneNumber:v10];

  id v11 = objc_msgSend(a1, "parsec_stringForKey:", @"email");
  [v6 setEmail:v11];

  objc_msgSend(v6, "setRequiresLocalMedia:", objc_msgSend(a1, "parsec_BOOLForKey:", @"streaming") ^ 1);
  uint64_t v12 = objc_msgSend(a1, "parsec_URLForKey:", @"url");
  unsigned int v13 = objc_msgSend(a1, "parsec_dictionaryForKey:", @"punchout");
  uint64_t v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "sf_asPunchout:", v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = objc_msgSend(a1, "parsec_stringForKey:", @"action_target_id");
    [v15 setActionTarget:v16];
  }
  else
  {
    if (!v12) {
      goto LABEL_6;
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
    float v17 = objc_msgSend(a1, "parsec_stringForKey:", @"action_target_id");
    [v15 setActionTarget:v17];

    v30[0] = v12;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v15 setUrls:v16];
  }

  [v6 setPunchout:v15];
LABEL_6:
  uint64_t v18 = objc_msgSend(a1, "parsec_stringForKey:", @"provider");
  [v6 setProvider:v18];

  v19 = objc_msgSend(a1, "parsec_stringForKey:", @"offer_type");
  [v6 setOfferType:v19];

  char v20 = objc_msgSend(a1, "parsec_stringForKey:", @"type");
  [v6 setType:v20];

  id v21 = [v6 type];
  if ([v21 isEqualToString:@"app"])
  {
    uint64_t v22 = [v6 punchout];
    uint64_t v23 = [v22 bundleIdentifier];
    [v6 setApplicationBundleIdentifier:v23];
  }
  else
  {
    [v6 setApplicationBundleIdentifier:0];
  }

  uint64_t v24 = objc_msgSend(a1, "parsec_stringForKey:", @"label_itunes");
  [v6 setLabelITunes:v24];

  objc_msgSend(v6, "setIsITunes:", objc_msgSend(a1, "parsec_BOOLForKey:", @"is_itunes"));
  v25 = objc_msgSend(a1, "sf_imageForKey:reply:", @"icon", v5);
  [v6 setIcon:v25];

  id v26 = objc_msgSend(a1, "sf_imageForKey:reply:", @"base_icon", v5);

  [v6 setBaseIcon:v26];
  id v27 = objc_msgSend(a1, "parsec_stringForKey:", @"message_identifier");
  [v6 setMessageIdentifier:v27];

  id v28 = objc_msgSend(a1, "parsec_URLForKey:", @"message_url");
  [v6 setMessageURL:v28];

  return v6;
}

- (uint64_t)sf_asPunchout
{
  return objc_msgSend(a1, "sf_asPunchout:", 0);
}

- (id)sf_asPunchout:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
  id v6 = objc_msgSend(a1, "parsec_stringForKey:", @"name");
  [v5 setName:v6];

  id v7 = objc_msgSend(a1, "parsec_stringForKey:", @"bundle_id");
  [v5 setBundleIdentifier:v7];

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"label");
  [v5 setLabel:v8];

  id v9 = objc_msgSend(a1, "parsec_URLForKey:", @"punchout_uri");
  id v10 = objc_msgSend(a1, "parsec_URLForKey:", @"install_url");
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = v11;
  if (v9) {
    [v11 addObject:v9];
  }
  if (v4) {
    [v12 addObject:v4];
  }
  if (v10) {
    [v12 addObject:v10];
  }
  [v5 setUrls:v12];

  return v5;
}

- (id)sf_asRichText:()SFExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A378]);
  id v6 = objc_msgSend(a1, "parsec_numberForKey:", @"star_rating");
  [v6 floatValue];
  [v5 setStarRating:v7];

  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"content_advisory");
  [v5 setContentAdvisory:v8];

  id v9 = objc_msgSend(a1, "parsec_arrayForKey:", @"more_glyphs");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__NSDictionary_SFExtras__sf_asRichText___block_invoke;
  v22[3] = &unk_1E59001E0;
  id v10 = v4;
  id v23 = v10;
  id v11 = objc_msgSend(v9, "parsec_mapAndFilterObjectsUsingBlock:", v22);
  [v5 setIcons:v11];

  uint64_t v12 = objc_msgSend(a1, "parsec_arrayForKey:", @"formatted_text");
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __40__NSDictionary_SFExtras__sf_asRichText___block_invoke_2;
  char v20 = &unk_1E59001E0;
  id v21 = v10;
  id v13 = v10;
  uint64_t v14 = objc_msgSend(v12, "parsec_mapAndFilterObjectsUsingBlock:", &v17);
  objc_msgSend(v5, "setFormattedTextPieces:", v14, v17, v18, v19, v20);

  id v15 = objc_msgSend(a1, "parsec_numberForKey:", @"text_maxlines");
  objc_msgSend(v5, "setMaxLines:", objc_msgSend(v15, "unsignedIntegerValue"));

  return v5;
}

- (id)sf_asFormattedText:()SFExtras
{
  id v4 = (objc_class *)MEMORY[0x1E4F9A0E0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  float v7 = objc_msgSend(a1, "parsec_stringForKey:", @"text");
  [v6 setText:v7];

  id v8 = objc_msgSend(a1, "parsec_numberForKey:", @"text_maxlines");
  id v9 = v8;
  if (v8) {
    uint64_t v10 = [v8 unsignedIntegerValue];
  }
  else {
    uint64_t v10 = 1;
  }
  [v6 setMaxLines:v10];
  id v11 = objc_msgSend(a1, "sf_imageForKey:reply:", @"glyph", v5);

  [v6 setGlyph:v11];
  objc_msgSend(v6, "setIsEmphasized:", objc_msgSend(a1, "parsec_BOOLForKey:", @"emphasized"));
  objc_msgSend(v6, "setIsBold:", objc_msgSend(a1, "parsec_BOOLForKey:", @"bold"));
  objc_msgSend(v6, "setTextColor:", objc_msgSend(a1, "sf_textColorForKey:", @"text_color"));

  return v6;
}

- (uint64_t)sf_textColorForKey:()SFExtras
{
  v1 = objc_msgSend(a1, "parsec_stringForKey:");
  if ([v1 isEqualToString:@"red"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"green"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"orange"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)sf_imageForKey:()SFExtras reply:
{
  id v6 = a4;
  float v7 = objc_msgSend(a1, "parsec_dictionaryForKey:", a3);
  id v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(v7, "sf_asImage:", v6);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)sf_asImage:()SFExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "parsec_stringForKey:", @"data");
  id v6 = objc_msgSend(v5, "parsec_base64DecodedData");

  float v7 = objc_msgSend(a1, "parsec_URLForKey:", @"url");
  id v8 = objc_msgSend(a1, "parsec_stringForKey:", @"mono");
  id v9 = v8;
  if (v6) {
    goto LABEL_2;
  }
  if (v7)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F9A510]);
    [v10 setUrlValue:v7];
  }
  else
  {
    if (![v8 length])
    {
LABEL_2:
      id v10 = objc_alloc_init(MEMORY[0x1E4F9A128]);
      goto LABEL_7;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F9A250]);
    [v10 setMonogramLetters:v9];
  }
LABEL_7:
  [v10 setSource:1];
  [v10 setImageData:v6];
  objc_msgSend(v10, "setIsTemplate:", objc_msgSend(a1, "parsec_BOOLForKey:", @"is_template"));
  id v11 = objc_msgSend(a1, "parsec_numberForKey:", @"round_corner_pt");
  [v11 floatValue];
  [v10 setCornerRadius:v12];

  objc_msgSend(v10, "setShouldCropToCircle:", objc_msgSend(a1, "parsec_BOOLForKey:", @"crop_circle"));
  [v4 scale];
  if (v13 == 0.0)
  {
    double v15 = 1.0;
  }
  else
  {
    [v4 scale];
    double v15 = v14;
  }
  [v10 setScale:v15];
  id v16 = objc_msgSend(a1, "parsec_numberForKey:", @"w");
  [v16 floatValue];
  double v18 = v17 / v15;

  v19 = objc_msgSend(a1, "parsec_numberForKey:", @"h");
  [v19 floatValue];
  double v21 = v20 / v15;

  objc_msgSend(v10, "setSize:", v18, v21);
  uint64_t v22 = objc_msgSend(a1, "parsec_stringForKey:", @"id");
  [v10 setIdentifier:v22];

  id v23 = objc_msgSend(a1, "parsec_stringForKey:", @"content_type");
  [v10 setContentType:v23];

  uint64_t v24 = objc_msgSend(a1, "parsec_stringForKey:", @"key_color");
  [v10 setKeyColor:v24];

  return v10;
}

- (id)sf_asSearchResult:()SFExtras factory:
{
  v135[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a1;
  id v8 = [a4 createResultObject];
  id v9 = objc_msgSend(v7, "parsec_stringForKey:", @"id");
  [v8 setIdentifier:v9];

  id v10 = objc_msgSend(v7, "parsec_numberForKey:", @"_type");
  [v8 setType:1];
  if (v10 && [v10 intValue]) {
    objc_msgSend(v8, "setType:", objc_msgSend(v10, "intValue"));
  }
  v129 = v10;
  id v11 = objc_msgSend(v7, "parsec_stringForKey:", @"type");
  [v8 setDomainName:v11];

  float v12 = objc_msgSend(v7, "sf_imageForKey:reply:", @"thumbnail", v6);
  [v8 setThumbnail:v12];

  uint64_t v13 = objc_msgSend(v7, "parsec_BOOLForKey:", @"thumbnail_crop_circle");
  double v14 = [v8 thumbnail];
  [v14 setShouldCropToCircle:v13];

  [v8 setPreventThumbnailImageScaling:1];
  id v15 = objc_alloc_init(MEMORY[0x1E4F9A4C0]);
  id v16 = objc_msgSend(v7, "parsec_stringForKey:", @"title");
  [v15 setText:v16];

  float v17 = objc_msgSend(v7, "parsec_numberForKey:", @"title_maxlines");
  objc_msgSend(v15, "setMaxLines:", objc_msgSend(v17, "integerValue"));

  v128 = v15;
  [v8 setTitle:v15];
  double v18 = objc_msgSend(v7, "parsec_stringForKey:", @"secondary_title");
  [v8 setSecondaryTitle:v18];

  v19 = objc_msgSend(v7, "parsec_stringForKey:", @"description");

  if (v19)
  {
    float v20 = objc_msgSend(v7, "parsec_stringForKey:", @"description");
    [v8 setSecondaryTitle:v20];

    double v21 = objc_msgSend(v7, "parsec_stringForKey:", @"description_alignment");
    objc_msgSend(v8, "setIsSecondaryTitleDetached:", objc_msgSend(v21, "isEqualToString:", @"right"));
  }
  uint64_t v22 = objc_msgSend(v7, "sf_imageForKey:reply:", @"secondary_image", v6);
  [v8 setSecondaryTitleImage:v22];

  id v23 = objc_msgSend(v7, "parsec_arrayForKey:", @"descriptions");
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __52__NSDictionary_SFExtras__sf_asSearchResult_factory___block_invoke;
  v132[3] = &unk_1E59001E0;
  id v24 = v6;
  id v133 = v24;
  v25 = objc_msgSend(v23, "parsec_mapAndFilterObjectsUsingBlock:", v132);
  [v8 setDescriptions:v25];

  id v26 = objc_msgSend(v7, "parsec_stringForKey:", @"footnote");
  [v8 setFootnote:v26];

  id v27 = objc_msgSend(v7, "parsec_stringForKey:", @"publish_date");
  [v8 setPublishDate:v27];

  id v28 = objc_msgSend(v7, "parsec_stringForKey:", @"source");
  [v8 setSourceName:v28];

  uint64_t v29 = objc_msgSend(v7, "parsec_stringForKey:", @"completion");
  [v8 setCompletion:v29];

  id v30 = objc_msgSend(v7, "sf_imageForKey:reply:", @"completion_icon", v24);
  [v8 setCompletionImage:v30];

  id v31 = objc_msgSend(v7, "parsec_dictionaryForKey:", @"auxiliary_info");
  id v32 = objc_msgSend(v31, "parsec_stringForKey:", @"top_text");
  [v8 setAuxiliaryTopText:v32];

  id v33 = objc_msgSend(v31, "parsec_stringForKey:", @"middle_text");
  [v8 setAuxiliaryMiddleText:v33];

  uint64_t v34 = objc_msgSend(v31, "parsec_stringForKey:", @"bottom_text");
  [v8 setAuxiliaryBottomText:v34];

  v127 = v31;
  objc_msgSend(v8, "setAuxiliaryBottomTextColor:", objc_msgSend(v31, "sf_textColorForKey:", @"bottom_text_color"));
  uint64_t v35 = objc_msgSend(v7, "parsec_dictionaryForKey:", @"action_button");
  v36 = objc_msgSend(v35, "sf_asActionItem:", v24);
  [v8 setAction:v36];

  id v37 = objc_msgSend(v7, "parsec_stringForKey:", @"adam_id");
  [v8 setStoreIdentifier:v37];

  id v38 = objc_msgSend(v7, "parsec_stringForKey:", @"entity_identifier");
  [v8 setEntityIdentifier:v38];

  v39 = objc_msgSend(v7, "parsec_stringForKey:", @"bundle_id");
  [v8 setResultBundleId:v39];

  id v40 = objc_msgSend(v7, "parsec_stringForKey:", @"maps_result_type");
  [v8 setMapsResultType:v40];

  v41 = objc_msgSend(v7, "parsec_stringForKey:", @"maps_data");
  if ([v41 length])
  {
    v42 = objc_msgSend(v41, "parsec_base64DecodedData");
    [v8 setMapsData:v42];
  }
  v126 = v41;
  v43 = (void *)MEMORY[0x1E4F1CB10];
  v44 = objc_msgSend(v7, "parsec_stringForKey:", @"more_url");
  v45 = [v43 URLWithString:v44];
  [v8 setMapsMoreURL:v45];

  v46 = objc_msgSend(v7, "parsec_stringForKey:", @"more");
  [v8 setMapsMoreString:v46];

  v47 = objc_msgSend(v7, "sf_imageForKey:reply:", @"more_icon", v24);
  [v8 setMapsMoreIcon:v47];

  v48 = objc_msgSend(v7, "parsec_stringForKey:", @"nearby_businesses");
  [v8 setNearbyBusinessesString:v48];

  v49 = objc_msgSend(v7, "parsec_stringForKey:", @"apple_referrer");
  [v8 setAppleReferrer:v49];

  v50 = objc_msgSend(v7, "parsec_stringForKey:", @"section_bundle_id");
  [v8 setSectionBundleIdentifier:v50];

  v51 = objc_msgSend(v7, "parsec_numberForKey:", @"tophit");
  objc_msgSend(v8, "setTopHit:", objc_msgSend(v51, "sf_asTopHit"));

  v52 = objc_msgSend(v7, "parsec_numberForKey:", @"score");
  [v52 doubleValue];
  objc_msgSend(v8, "setRankingScore:");

  uint64_t v53 = objc_msgSend(v7, "parsec_stringForKey:", @"card_title");
  v54 = objc_msgSend(v7, "parsec_stringForKey:", @"card_url");
  v55 = objc_msgSend(v7, "parsec_arrayForKey:", @"card_sections");
  v56 = objc_msgSend(v7, "parsec_arrayForKey:", @"row_sections");
  v121 = objc_msgSend(v7, "parsec_dictionaryForKey:", @"zkw_topic");
  v57 = [v121 objectForKeyedSubscript:@"topic"];
  v58 = objc_msgSend(v57, "sf_asTopic");
  [v8 setNormalizedTopic:v58];

  if ([v56 count])
  {
    id v59 = objc_alloc_init(MEMORY[0x1E4F99F20]);
    [v59 setType:1];
    [v59 setSource:1];
    [v59 setTitle:v53];
    v60 = objc_msgSend(v56, "sf_asCardSections:", v24);
    [v59 setCardSections:v60];

    [v8 setInlineCard:v59];
  }
  if ([v55 count])
  {
    id v61 = objc_alloc_init(MEMORY[0x1E4F99F20]);
    [v61 setType:1];
    [v61 setSource:1];
    [v61 setTitle:v53];
    v62 = objc_msgSend(v7, "parsec_stringForKey:", @"fbr");
    [v61 setFbr:v62];

    v63 = objc_msgSend(v55, "sf_asCardSections:", v24);
    [v61 setCardSections:v63];

    [v8 setCard:v61];
LABEL_12:

    goto LABEL_13;
  }
  if ([v54 length])
  {
    id v61 = [MEMORY[0x1E4F1CB10] URLWithString:v54];
    if (v61)
    {
      id v84 = objc_alloc_init(MEMORY[0x1E4F99F20]);
      [v84 setType:2];
      [v84 setSource:1];
      [v84 setTitle:v53];
      [v84 setUrlValue:v61];
      [v8 setCard:v84];
    }
    goto LABEL_12;
  }
LABEL_13:
  v125 = (void *)v53;
  v64 = objc_msgSend(v7, "parsec_stringForKey:", @"pb_compact_tophit");
  uint64_t v65 = objc_msgSend(v64, "parsec_base64DecodedData");

  v131 = (void *)v65;
  if (v65)
  {
    v66 = (void *)[objc_alloc(MEMORY[0x1E4F9A598]) initWithData:v65];
    if (v66)
    {
      v67 = (void *)[objc_alloc(MEMORY[0x1E4F99F20]) initWithProtobuf:v66];
      [v8 setCompactCard:v67];
    }
  }
  v68 = objc_msgSend(v7, "parsec_stringForKey:", @"pb_tophit");
  uint64_t v69 = objc_msgSend(v68, "parsec_base64DecodedData");

  v130 = (void *)v69;
  if (v69)
  {
    v70 = (void *)[objc_alloc(MEMORY[0x1E4F9A598]) initWithData:v69];
    if (v70)
    {
      v71 = (void *)[objc_alloc(MEMORY[0x1E4F99F20]) initWithProtobuf:v70];
      [v8 setTophitCard:v71];
    }
  }
  v124 = v54;
  v72 = objc_msgSend(v7, "parsec_stringForKey:", @"more_results_punchout");
  if ([v72 length])
  {
    v73 = [MEMORY[0x1E4F1CB10] URLWithString:v72];
    if (v73)
    {
      v74 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v73];
      v75 = objc_msgSend(v7, "parsec_stringForKey:", @"more_results_label");
      if ([v75 length]) {
        [v74 setLabel:v75];
      }
      [v8 setMoreResultsPunchout:v74];
    }
  }
  v122 = v56;
  v123 = v55;
  v76 = objc_msgSend(v7, "parsec_stringForKey:", @"url");
  v77 = objc_msgSend(v7, "parsec_dictionaryForKey:", @"app");
  if ([v76 length])
  {
    id v78 = v76;
    if (([v78 hasPrefix:@"ical:"] & 1) != 0
      || [v78 hasPrefix:@"calshow"])
    {
      uint64_t v134 = 0;
      v79 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"X-APPLE-UNIVERSAL-ID=([^&]*)" options:1 error:&v134];
      v80 = objc_msgSend(v79, "firstMatchInString:options:range:", v78, 0, 0, objc_msgSend(v78, "length"));
      v81 = 0;
      if ((unint64_t)[v80 numberOfRanges] >= 2)
      {
        uint64_t v82 = [v80 rangeAtIndex:1];
        v81 = objc_msgSend(v78, "substringWithRange:", v82, v83);
      }
    }
    else
    {
      v81 = 0;
    }

    [v8 setCalendarIdentifier:v81];
    v85 = [MEMORY[0x1E4F1CB10] URLWithString:v78];
    if (v85) {
      [v8 setUrl:v85];
    }
  }
  v86 = objc_msgSend(v7, "parsec_stringForKey:", @"application_bundle_id");
  [v8 setApplicationBundleIdentifier:v86];

  v87 = objc_msgSend(v7, "parsec_stringForKey:", @"placement");
  objc_msgSend(v8, "setPlacement:", objc_msgSend(v87, "sf_asResultPlacement"));

  v88 = objc_msgSend(v7, "parsec_numberForKey:", @"hide_rank");
  objc_msgSend(v8, "setMinimumRankOfTopHitToSuppressResult:", objc_msgSend(v88, "unsignedIntegerValue"));

  v89 = objc_msgSend(v7, "parsec_stringForKey:", @"section_header");
  [v8 setSectionHeader:v89];

  v90 = objc_msgSend(v7, "parsec_stringForKey:", @"section_header_more");
  [v8 setSectionHeaderMore:v90];

  v91 = objc_msgSend(v7, "parsec_URLForKey:", @"section_header_more_url");
  [v8 setSectionHeaderMoreURL:v91];

  v92 = objc_msgSend(v7, "parsec_stringForKey:", @"type");
  [v8 setResultType:v92];
  v93 = objc_msgSend(v7, "parsec_stringForKey:", @"template");
  [v8 setResultTemplate:v93];

  objc_msgSend(v8, "setIsQuickGlance:", objc_msgSend(v7, "parsec_BOOLForKey:", @"is_quick_glance"));
  objc_msgSend(v8, "setRenderHorizontallyWithOtherResultsInCategory:", objc_msgSend(v7, "parsec_BOOLForKey:", @"render_horizontally"));
  objc_msgSend(v8, "setIsStreaming:", objc_msgSend(v7, "parsec_BOOLForKey:", @"streaming"));
  v94 = objc_msgSend(v7, "parsec_numberForKey:", @"engagement_score");
  [v8 setEngagementScore:v94];

  v95 = objc_msgSend(v7, "parsec_numberForKey:", @"qi_engagement_score");
  [v8 setQueryIndependentScore:v95];

  v96 = objc_msgSend(v7, "parsec_numberForKey:", @"max_age");
  [v8 setMaxAge:v96];

  v97 = objc_msgSend(v7, "sf_imageForKey:reply:", @"icon", v24);
  [v8 setIcon:v97];

  objc_msgSend(v8, "setDoNotFold:", objc_msgSend(v7, "parsec_BOOLForKey:", @"do_not_fold"));
  v98 = objc_msgSend(v7, "parsec_numberForKey:", @"block_id");
  objc_msgSend(v8, "setBlockId:", objc_msgSend(v98, "unsignedLongLongValue"));

  v99 = [v8 url];
  v100 = v99;
  if (v77)
  {
    v101 = objc_msgSend(v77, "sf_asPunchout:", v99);
    [v8 setPunchout:v101];

    id v102 = [v8 punchout];
    v103 = [v102 bundleIdentifier];
    [v8 setApplicationBundleIdentifier:v103];
  }
  else
  {

    if (!v100) {
      goto LABEL_45;
    }
    id v102 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
    v104 = [v8 url];
    v135[0] = v104;
    v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:1];
    [v102 setUrls:v105];

    [v8 setPunchout:v102];
  }

LABEL_45:
  v106 = objc_msgSend(v7, "parsec_stringForKey:", @"title_note");
  [v8 setTitleNote:v106];

  v107 = objc_msgSend(v7, "parsec_numberForKey:", @"title_note_size");
  [v8 setTitleNoteSize:v107];

  v108 = objc_msgSend(v7, "parsec_stringForKey:", @"query");
  [v8 setCompletedQuery:v108];

  v109 = objc_msgSend(v7, "parsec_stringForKey:", @"align");
  objc_msgSend(v8, "setIsCentered:", objc_msgSend(v109, "isEqualToString:", @"center"));

  v110 = objc_msgSend(v7, "parsec_stringForKey:", @"pb");
  v111 = objc_msgSend(v110, "parsec_base64DecodedData");

  if (v111) {
    +[ProtobufHelper processProtobuf:v24 result:v8 data:v111];
  }
  v112 = objc_msgSend(v7, "parsec_arrayForKey:", @"entities");
  v113 = CoreParsec_fakeEntityData(v112);
  [v8 setEntityData:v113];

  objc_msgSend(v8, "setIsInstantAnswer:", objc_msgSend(v7, "parsec_BOOLForKey:", @"is_instant_answer"));
  objc_msgSend(v8, "setShouldAutoNavigate:", objc_msgSend(v7, "parsec_BOOLForKey:", @"auto_navigate"));
  v114 = objc_msgSend(v7, "parsec_dictionaryForKey:", @"server_features");
  [v8 setServerFeatures:v114];

  objc_msgSend(v8, "setNoGoTakeover:", objc_msgSend(v7, "parsec_BOOLForKey:", @"no_go_takeover"));
  objc_msgSend(v8, "setShouldUseCompactDisplay:", objc_msgSend(v7, "parsec_BOOLForKey:", @"should_use_compact_display"));
  objc_msgSend(v8, "setPreferTopPlatter:", objc_msgSend(v7, "parsec_BOOLForKey:", @"prefer_top_platter"));
  v115 = objc_msgSend(v7, "parsec_arrayForKey:", @"alternative_urls");
  v116 = objc_msgSend(v115, "parsec_mapObjectsUsingBlock:", &__block_literal_global_469);
  [v8 setAlternativeURLs:v116];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 processVisualCATResultSynchronously];
  }
  v117 = objc_msgSend(v7, "parsec_dictionaryForKey:", @"result_entity");
  v118 = v117;
  if (v117)
  {
    v119 = objc_msgSend(v117, "sf_asResultEntity");
    [v8 setResultEntity:v119];
  }

  return v8;
}

@end