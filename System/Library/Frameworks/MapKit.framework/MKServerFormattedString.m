@interface MKServerFormattedString
+ (BOOL)supportsSecureCoding;
+ (id)attributesForServerFormatStyle:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServerFormattedString:(id)a3;
- (GEOComposedString)composedString;
- (GEOServerFormattedString)geoServerString;
- (MKServerFormattedString)initWithCoder:(id)a3;
- (MKServerFormattedString)initWithComposedString:(id)a3;
- (MKServerFormattedString)initWithGeoServerString:(id)a3 parameters:(id)a4;
- (MKServerFormattedStringParameters)parameters;
- (id)_attachmentTextForSFSymbol:(id)a3 attributes:(id)a4;
- (id)_attributesByTokenForFormatStyles:(id)a3;
- (id)_multiPartAttributedStringForComposedStringWithAttributes:(id)a3;
- (id)_parametersByScrubbingUnusedOverrideVariablesFromParameters:(id)a3 geoServerString:(id)a4;
- (id)_textAttachmentForGeoArtwork:(id)a3 attributes:(id)a4 accessibilityText:(id)a5;
- (id)_textAttachmentForManeuver:(int)a3 junctionInfo:(id)a4 defaultAttributes:(id)a5;
- (id)debugDescription;
- (id)multiPartAttributedStringWithAttributes:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKServerFormattedString

- (MKServerFormattedString)initWithGeoServerString:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKServerFormattedString;
  v9 = [(MKServerFormattedString *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_geoServerString, a3);
    uint64_t v11 = [(MKServerFormattedString *)v10 _parametersByScrubbingUnusedOverrideVariablesFromParameters:v8 geoServerString:v10->_geoServerString];
    parameters = v10->_parameters;
    v10->_parameters = (MKServerFormattedStringParameters *)v11;
  }
  return v10;
}

- (MKServerFormattedString)initWithComposedString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKServerFormattedString;
  v6 = [(MKServerFormattedString *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_composedString, a3);
  }

  return v7;
}

- (MKServerFormattedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKServerFormattedString;
  id v5 = [(MKServerFormattedString *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoServerString"];
    geoServerString = v5->_geoServerString;
    v5->_geoServerString = (GEOServerFormattedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (MKServerFormattedStringParameters *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"composedString"];
    composedString = v5->_composedString;
    v5->_composedString = (GEOComposedString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  geoServerString = self->_geoServerString;
  id v5 = a3;
  [v5 encodeObject:geoServerString forKey:@"geoServerString"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
  [v5 encodeObject:self->_composedString forKey:@"composedString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_parametersByScrubbingUnusedOverrideVariablesFromParameters:(id)a3 geoServerString:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v21 = v6;
  uint64_t v8 = [v6 formatTokens];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_super v14 = [v5 variableOverrides];
        v15 = [v13 token];
        v16 = [v14 objectForKeyedSubscript:v15];

        if (v16)
        {
          v17 = [v13 token];
          [v7 setObject:v16 forKeyedSubscript:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  v18 = [MKServerFormattedStringParameters alloc];
  if (v5) {
    [v5 options];
  }
  else {
    memset(v22, 0, sizeof(v22));
  }
  v19 = [(MKServerFormattedStringParameters *)v18 initWithOptions:v22 variableOverrides:v7];

  return v19;
}

- (id)_attachmentTextForSFSymbol:(id)a3 attributes:(id)a4
{
  id v5 = a4;
  id v6 = [a3 sfSymbol];
  id v7 = [v6 symbolName];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
    uint64_t v9 = [v5 objectForKey:@"MKServerFormattedStringArtworkSFSymbolScaleAttributeKey"];
    uint64_t v10 = v9;
    if (v9) {
      uint64_t v11 = [v9 integerValue];
    }
    else {
      uint64_t v11 = 1;
    }
    objc_super v13 = [v5 objectForKey:@"MKServerFormattedStringArtworkSFSymbolStyleAttributeKey"];
    objc_super v14 = v13;
    if (v13)
    {
      [v13 floatValue];
      double v16 = v15;
    }
    else
    {
      double v16 = *MEMORY[0x1E4F43918];
    }
    v17 = (void *)MEMORY[0x1E4F42A98];
    [v8 pointSize];
    v18 = objc_msgSend(v17, "configurationWithPointSize:weight:scale:", (uint64_t)v16, v11);
    v19 = [MEMORY[0x1E4F42A80] systemImageNamed:v7 withConfiguration:v18];
    v20 = [v19 imageWithRenderingMode:2];

    id v21 = objc_alloc_init(MEMORY[0x1E4F42698]);
    [v21 setImage:v20];
    v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v21];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v22];
    objc_msgSend(v12, "addAttributes:range:", v5, 0, objc_msgSend(v12, "length"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_textAttachmentForGeoArtwork:(id)a3 attributes:(id)a4 accessibilityText:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"MKServerFormattedStringArtworkSizeAttribute"];
  uint64_t v11 = v10;
  if (v10) {
    uint64_t v12 = [v10 unsignedIntegerValue];
  }
  else {
    uint64_t v12 = 4;
  }
  objc_super v13 = [v8 objectForKeyedSubscript:@"MKServerFormattedStringArtworkFeatureTypeAttributeKey"];
  objc_super v14 = v13;
  if (v13) {
    uint64_t v15 = [v13 unsignedIntegerValue];
  }
  else {
    uint64_t v15 = 2;
  }
  double v16 = [MEMORY[0x1E4F42D90] mainScreen];
  [v16 scale];
  double v18 = v17;

  v19 = +[MKTransitArtworkManager sharedInstance];
  v20 = [v19 transitArtworkImageWithDataSource:v7 size:v12 featureType:v15 scale:0 nightMode:v18];

  id v21 = [v8 objectForKeyedSubscript:@"MKServerFormattedStringArtworkAlphaAttribute"];
  [v21 doubleValue];
  double v23 = v22;

  if (v23 > 0.0 && v23 < 1.0)
  {
    uint64_t v24 = [v20 _mapkit_imageWithAlpha:v23];

    v20 = v24;
  }
  if (v20)
  {
    id v49 = v7;
    if (MKTransitArtworkDataSourceAllowMasking(v7))
    {
      uint64_t v25 = [v20 imageWithRenderingMode:2];

      v20 = v25;
    }
    id v26 = objc_alloc_init(MEMORY[0x1E4F42698]);
    [v26 setImage:v20];
    id v27 = v9;
    [v26 setAccessibilityLabel:v9];
    uint64_t v28 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
    [v20 size];
    double v30 = v29;
    double v32 = v31;
    [v28 ascender];
    double v34 = v33;
    v35 = [v8 objectForKeyedSubscript:@"MKServerFormattedStringArtworkMatchLineHeightAttributeKey"];
    int v36 = [v35 BOOLValue];

    v37 = [v8 objectForKeyedSubscript:@"MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey"];
    unsigned __int8 v38 = [v37 BOOLValue];

    if (v28)
    {
      double v39 = v30 / v32;
      if (v36)
      {
        objc_msgSend(v28, "_mapkit_lineHeight");
        double v32 = v40;
        double v30 = v39 * v40;
      }
      else if ((v38 & (v32 > v34)) != 0)
      {
        double v32 = v34;
        double v30 = v34 * v39;
      }
    }
    id v9 = v27;
    v41 = [v8 objectForKey:@"MKServerFormattedStringArtworkScaleAttributeKey"];
    v42 = v41;
    id v7 = v49;
    if (v41)
    {
      [v41 cgFloatValue];
      double v30 = v30 * v43;
      [v42 cgFloatValue];
      double v32 = v32 * v44;
    }
    [v28 capHeight];
    double v46 = (v45 - v32) * 0.5;
    double v47 = 0.0;
    if (v28) {
      double v47 = v46;
    }
    objc_msgSend(v26, "setBounds:", 0.0, v47, v30, v32);
  }
  else
  {
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v7;
      _os_log_impl(&dword_18BAEC000, v20, OS_LOG_TYPE_ERROR, "Could not find requested shield: %@", buf, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

- (id)_textAttachmentForManeuver:(int)a3 junctionInfo:(id)a4 defaultAttributes:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v6 <= 0x27 && ((1 << v6) & 0x8600050000) != 0)
  {
    uint64_t v10 = [v8 objectForKey:@"MKServerFormattedStringArtworkArrivalIconImageKey"];
    if (v10) {
      goto LABEL_221;
    }
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = v6 - 16;
      if (v6 - 16) < 0x18 && ((0x8E7FF7u >> v12))
      {
        objc_super v13 = off_1E54BA5B0[v12];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        objc_super v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v67 = v13;
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "No arrival icon image for maneuver token: %@", buf, 0xCu);
    }
  }
  objc_super v14 = [v9 objectForKey:@"MKServerFormattedStringArtworkArrowFillColorAttributeKey"];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v61 = v16;

  double v17 = [v9 objectForKey:@"MKServerFormattedStringArtworkJunctionFillColorAttributeKey"];
  double v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  v62 = v19;

  v20 = [v9 objectForKey:@"MKServerFormattedStringArtworkSideLengthAttributeKey"];
  if (!v20)
  {
    GEOFindOrCreateLog();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      double v22 = @"NO_TURN";
      switch((int)v6)
      {
        case 0:
          break;
        case 1:
          double v22 = @"LEFT_TURN";
          break;
        case 2:
          double v22 = @"RIGHT_TURN";
          break;
        case 3:
          double v22 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          double v22 = @"U_TURN";
          break;
        case 5:
          double v22 = @"FOLLOW_ROAD";
          break;
        case 6:
          double v22 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          double v22 = @"EXIT_ROUNDABOUT";
          break;
        case 11:
          double v22 = @"OFF_RAMP";
          break;
        case 12:
          double v22 = @"ON_RAMP";
          break;
        case 16:
          double v22 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 17:
          double v22 = @"START_ROUTE";
          break;
        case 18:
          double v22 = @"ARRIVE_AT_DESTINATION";
          break;
        case 20:
          double v22 = @"KEEP_LEFT";
          break;
        case 21:
          double v22 = @"KEEP_RIGHT";
          break;
        case 22:
          double v22 = @"ENTER_FERRY";
          break;
        case 23:
          double v22 = @"EXIT_FERRY";
          break;
        case 24:
          double v22 = @"CHANGE_FERRY";
          break;
        case 25:
          double v22 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 26:
          double v22 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 27:
          double v22 = @"LEFT_TURN_AT_END";
          break;
        case 28:
          double v22 = @"RIGHT_TURN_AT_END";
          break;
        case 29:
          double v22 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 30:
          double v22 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 33:
          double v22 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 34:
          double v22 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 35:
          double v22 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 39:
          double v22 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 41:
          double v22 = @"ROUNDABOUT_EXIT_1";
          break;
        case 42:
          double v22 = @"ROUNDABOUT_EXIT_2";
          break;
        case 43:
          double v22 = @"ROUNDABOUT_EXIT_3";
          break;
        case 44:
          double v22 = @"ROUNDABOUT_EXIT_4";
          break;
        case 45:
          double v22 = @"ROUNDABOUT_EXIT_5";
          break;
        case 46:
          double v22 = @"ROUNDABOUT_EXIT_6";
          break;
        case 47:
          double v22 = @"ROUNDABOUT_EXIT_7";
          break;
        case 48:
          double v22 = @"ROUNDABOUT_EXIT_8";
          break;
        case 49:
          double v22 = @"ROUNDABOUT_EXIT_9";
          break;
        case 50:
          double v22 = @"ROUNDABOUT_EXIT_10";
          break;
        case 51:
          double v22 = @"ROUNDABOUT_EXIT_11";
          break;
        case 52:
          double v22 = @"ROUNDABOUT_EXIT_12";
          break;
        case 53:
          double v22 = @"ROUNDABOUT_EXIT_13";
          break;
        case 54:
          double v22 = @"ROUNDABOUT_EXIT_14";
          break;
        case 55:
          double v22 = @"ROUNDABOUT_EXIT_15";
          break;
        case 56:
          double v22 = @"ROUNDABOUT_EXIT_16";
          break;
        case 57:
          double v22 = @"ROUNDABOUT_EXIT_17";
          break;
        case 58:
          double v22 = @"ROUNDABOUT_EXIT_18";
          break;
        case 59:
          double v22 = @"ROUNDABOUT_EXIT_19";
          break;
        case 60:
          double v22 = @"SHARP_LEFT_TURN";
          break;
        case 61:
          double v22 = @"SHARP_RIGHT_TURN";
          break;
        case 62:
          double v22 = @"SLIGHT_LEFT_TURN";
          break;
        case 63:
          double v22 = @"SLIGHT_RIGHT_TURN";
          break;
        case 64:
          double v22 = @"CHANGE_HIGHWAY";
          break;
        case 65:
          double v22 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 66:
          double v22 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 80:
          double v22 = @"TOLL_STATION";
          break;
        case 81:
          double v22 = @"ENTER_TUNNEL";
          break;
        case 82:
          double v22 = @"WAYPOINT_STOP";
          break;
        case 83:
          double v22 = @"WAYPOINT_STOP_LEFT";
          break;
        case 84:
          double v22 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 85:
          double v22 = @"RESUME_ROUTE";
          break;
        case 86:
          double v22 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 87:
          double v22 = @"CUSTOM";
          break;
        case 88:
          double v22 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
          double v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      *(_DWORD *)buf = 138412290;
      v67 = v22;
      _os_log_impl(&dword_18BAEC000, v21, OS_LOG_TYPE_ERROR, "No side length attribute for maneuver token: %@", buf, 0xCu);
    }
  }
  v60 = v20;
  [v20 cgFloatValue];
  CGFloat v24 = v23;
  uint64_t v25 = [v7 junctionType];
  uint64_t v26 = [v7 drivingSide];
  uint64_t v27 = [v7 junctionElements];
  uint64_t v28 = [v7 junctionElementsCount];
  double v29 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", MKDefaultJunctionManeuverMetrics((uint64_t)v65));
  [v29 scale];
  CGFloat v31 = v30;

  uint64_t v32 = v27;
  uint64_t v33 = v28;
  v35 = v61;
  double v34 = v62;
  uint64_t v10 = MKJunctionArrowImage(v25, v6, v26, v32, v33, v65, v61, v62, v24, v24, v31, 0);
  if (!v10)
  {
    GEOFindOrCreateLog();
    int v36 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = @"NO_TURN";
      switch((int)v6)
      {
        case 0:
          break;
        case 1:
          v37 = @"LEFT_TURN";
          break;
        case 2:
          v37 = @"RIGHT_TURN";
          break;
        case 3:
          v37 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          v37 = @"U_TURN";
          break;
        case 5:
          v37 = @"FOLLOW_ROAD";
          break;
        case 6:
          v37 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          v37 = @"EXIT_ROUNDABOUT";
          break;
        case 11:
          v37 = @"OFF_RAMP";
          break;
        case 12:
          v37 = @"ON_RAMP";
          break;
        case 16:
          v37 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 17:
          v37 = @"START_ROUTE";
          break;
        case 18:
          v37 = @"ARRIVE_AT_DESTINATION";
          break;
        case 20:
          v37 = @"KEEP_LEFT";
          break;
        case 21:
          v37 = @"KEEP_RIGHT";
          break;
        case 22:
          v37 = @"ENTER_FERRY";
          break;
        case 23:
          v37 = @"EXIT_FERRY";
          break;
        case 24:
          v37 = @"CHANGE_FERRY";
          break;
        case 25:
          v37 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 26:
          v37 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 27:
          v37 = @"LEFT_TURN_AT_END";
          break;
        case 28:
          v37 = @"RIGHT_TURN_AT_END";
          break;
        case 29:
          v37 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 30:
          v37 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 33:
          v37 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 34:
          v37 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 35:
          v37 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 39:
          v37 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 41:
          v37 = @"ROUNDABOUT_EXIT_1";
          break;
        case 42:
          v37 = @"ROUNDABOUT_EXIT_2";
          break;
        case 43:
          v37 = @"ROUNDABOUT_EXIT_3";
          break;
        case 44:
          v37 = @"ROUNDABOUT_EXIT_4";
          break;
        case 45:
          v37 = @"ROUNDABOUT_EXIT_5";
          break;
        case 46:
          v37 = @"ROUNDABOUT_EXIT_6";
          break;
        case 47:
          v37 = @"ROUNDABOUT_EXIT_7";
          break;
        case 48:
          v37 = @"ROUNDABOUT_EXIT_8";
          break;
        case 49:
          v37 = @"ROUNDABOUT_EXIT_9";
          break;
        case 50:
          v37 = @"ROUNDABOUT_EXIT_10";
          break;
        case 51:
          v37 = @"ROUNDABOUT_EXIT_11";
          break;
        case 52:
          v37 = @"ROUNDABOUT_EXIT_12";
          break;
        case 53:
          v37 = @"ROUNDABOUT_EXIT_13";
          break;
        case 54:
          v37 = @"ROUNDABOUT_EXIT_14";
          break;
        case 55:
          v37 = @"ROUNDABOUT_EXIT_15";
          break;
        case 56:
          v37 = @"ROUNDABOUT_EXIT_16";
          break;
        case 57:
          v37 = @"ROUNDABOUT_EXIT_17";
          break;
        case 58:
          v37 = @"ROUNDABOUT_EXIT_18";
          break;
        case 59:
          v37 = @"ROUNDABOUT_EXIT_19";
          break;
        case 60:
          v37 = @"SHARP_LEFT_TURN";
          break;
        case 61:
          v37 = @"SHARP_RIGHT_TURN";
          break;
        case 62:
          v37 = @"SLIGHT_LEFT_TURN";
          break;
        case 63:
          v37 = @"SLIGHT_RIGHT_TURN";
          break;
        case 64:
          v37 = @"CHANGE_HIGHWAY";
          break;
        case 65:
          v37 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 66:
          v37 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 80:
          v37 = @"TOLL_STATION";
          break;
        case 81:
          v37 = @"ENTER_TUNNEL";
          break;
        case 82:
          v37 = @"WAYPOINT_STOP";
          break;
        case 83:
          v37 = @"WAYPOINT_STOP_LEFT";
          break;
        case 84:
          v37 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 85:
          v37 = @"RESUME_ROUTE";
          break;
        case 86:
          v37 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 87:
          v37 = @"CUSTOM";
          break;
        case 88:
          v37 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      *(_DWORD *)buf = 138412290;
      v67 = v37;
      _os_log_impl(&dword_18BAEC000, v36, OS_LOG_TYPE_INFO, "Junction for maneuver type %@ could not be drawn; trying regular maneuver arrow",
        buf,
        0xCu);

      v35 = v61;
    }

    int v38 = [v7 drivingSide];
    double v39 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v64));
    [v39 scale];
    CGFloat v41 = v40;

    int v42 = v38;
    double v34 = v62;
    uint64_t v10 = MKManeuverArrowImage(v6, v42, v64, v35, v62, 0, v24, v24, v41);
    if (!v10)
    {
      GEOFindOrCreateLog();
      double v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        double v44 = @"NO_TURN";
        switch((int)v6)
        {
          case 0:
            break;
          case 1:
            double v44 = @"LEFT_TURN";
            break;
          case 2:
            double v44 = @"RIGHT_TURN";
            break;
          case 3:
            double v44 = @"STRAIGHT_AHEAD";
            break;
          case 4:
            double v44 = @"U_TURN";
            break;
          case 5:
            double v44 = @"FOLLOW_ROAD";
            break;
          case 6:
            double v44 = @"ENTER_ROUNDABOUT";
            break;
          case 7:
            double v44 = @"EXIT_ROUNDABOUT";
            break;
          case 11:
            double v44 = @"OFF_RAMP";
            break;
          case 12:
            double v44 = @"ON_RAMP";
            break;
          case 16:
            double v44 = @"ARRIVE_END_OF_NAVIGATION";
            break;
          case 17:
            double v44 = @"START_ROUTE";
            break;
          case 18:
            double v44 = @"ARRIVE_AT_DESTINATION";
            break;
          case 20:
            double v44 = @"KEEP_LEFT";
            break;
          case 21:
            double v44 = @"KEEP_RIGHT";
            break;
          case 22:
            double v44 = @"ENTER_FERRY";
            break;
          case 23:
            double v44 = @"EXIT_FERRY";
            break;
          case 24:
            double v44 = @"CHANGE_FERRY";
            break;
          case 25:
            double v44 = @"START_ROUTE_WITH_U_TURN";
            break;
          case 26:
            double v44 = @"U_TURN_AT_ROUNDABOUT";
            break;
          case 27:
            double v44 = @"LEFT_TURN_AT_END";
            break;
          case 28:
            double v44 = @"RIGHT_TURN_AT_END";
            break;
          case 29:
            double v44 = @"HIGHWAY_OFF_RAMP_LEFT";
            break;
          case 30:
            double v44 = @"HIGHWAY_OFF_RAMP_RIGHT";
            break;
          case 33:
            double v44 = @"ARRIVE_AT_DESTINATION_LEFT";
            break;
          case 34:
            double v44 = @"ARRIVE_AT_DESTINATION_RIGHT";
            break;
          case 35:
            double v44 = @"U_TURN_WHEN_POSSIBLE";
            break;
          case 39:
            double v44 = @"ARRIVE_END_OF_DIRECTIONS";
            break;
          case 41:
            double v44 = @"ROUNDABOUT_EXIT_1";
            break;
          case 42:
            double v44 = @"ROUNDABOUT_EXIT_2";
            break;
          case 43:
            double v44 = @"ROUNDABOUT_EXIT_3";
            break;
          case 44:
            double v44 = @"ROUNDABOUT_EXIT_4";
            break;
          case 45:
            double v44 = @"ROUNDABOUT_EXIT_5";
            break;
          case 46:
            double v44 = @"ROUNDABOUT_EXIT_6";
            break;
          case 47:
            double v44 = @"ROUNDABOUT_EXIT_7";
            break;
          case 48:
            double v44 = @"ROUNDABOUT_EXIT_8";
            break;
          case 49:
            double v44 = @"ROUNDABOUT_EXIT_9";
            break;
          case 50:
            double v44 = @"ROUNDABOUT_EXIT_10";
            break;
          case 51:
            double v44 = @"ROUNDABOUT_EXIT_11";
            break;
          case 52:
            double v44 = @"ROUNDABOUT_EXIT_12";
            break;
          case 53:
            double v44 = @"ROUNDABOUT_EXIT_13";
            break;
          case 54:
            double v44 = @"ROUNDABOUT_EXIT_14";
            break;
          case 55:
            double v44 = @"ROUNDABOUT_EXIT_15";
            break;
          case 56:
            double v44 = @"ROUNDABOUT_EXIT_16";
            break;
          case 57:
            double v44 = @"ROUNDABOUT_EXIT_17";
            break;
          case 58:
            double v44 = @"ROUNDABOUT_EXIT_18";
            break;
          case 59:
            double v44 = @"ROUNDABOUT_EXIT_19";
            break;
          case 60:
            double v44 = @"SHARP_LEFT_TURN";
            break;
          case 61:
            double v44 = @"SHARP_RIGHT_TURN";
            break;
          case 62:
            double v44 = @"SLIGHT_LEFT_TURN";
            break;
          case 63:
            double v44 = @"SLIGHT_RIGHT_TURN";
            break;
          case 64:
            double v44 = @"CHANGE_HIGHWAY";
            break;
          case 65:
            double v44 = @"CHANGE_HIGHWAY_LEFT";
            break;
          case 66:
            double v44 = @"CHANGE_HIGHWAY_RIGHT";
            break;
          case 80:
            double v44 = @"TOLL_STATION";
            break;
          case 81:
            double v44 = @"ENTER_TUNNEL";
            break;
          case 82:
            double v44 = @"WAYPOINT_STOP";
            break;
          case 83:
            double v44 = @"WAYPOINT_STOP_LEFT";
            break;
          case 84:
            double v44 = @"WAYPOINT_STOP_RIGHT";
            break;
          case 85:
            double v44 = @"RESUME_ROUTE";
            break;
          case 86:
            double v44 = @"RESUME_ROUTE_WITH_U_TURN";
            break;
          case 87:
            double v44 = @"CUSTOM";
            break;
          case 88:
            double v44 = @"TURN_AROUND";
            break;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
            double v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        *(_DWORD *)buf = 138412290;
        v67 = v44;
        _os_log_impl(&dword_18BAEC000, v43, OS_LOG_TYPE_INFO, "Maneuver type %@ could not be drawn; defaulting to .STRAIGHT_AHEAD",
          buf,
          0xCu);
      }
      int v45 = [v7 drivingSide];
      double v46 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v63));
      [v46 scale];
      CGFloat v48 = v47;

      int v49 = v45;
      double v34 = v62;
      uint64_t v10 = MKManeuverArrowImage(3, v49, v63, v35, v62, 0, v24, v24, v48);
    }
  }

LABEL_221:
  id v50 = objc_alloc_init(MEMORY[0x1E4F42698]);
  [v50 setImage:v10];
  id v51 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  [v51 capHeight];
  double v53 = v52;
  [v10 size];
  double v55 = round(v53 - v54) * 0.5;
  [v10 size];
  double v57 = v56;
  [v10 size];
  objc_msgSend(v50, "setBounds:", 0.0, v55, v57, v58);

  return v50;
}

- (id)_multiPartAttributedStringForComposedStringWithAttributes:(id)a3
{
  id v4 = a3;
  composedString = self->_composedString;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  double v18 = __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke;
  id v19 = &unk_1E54BA548;
  v20 = self;
  id v6 = v4;
  id v21 = v6;
  id v7 = [(GEOComposedString *)composedString optionsWithArgumentHandler:&v16];
  objc_msgSend(v7, "setCreateAttributedString:", 1, v16, v17, v18, v19, v20);
  [v7 setStringAttributes:v6];
  [v7 setPreserveIndividualComponents:1];
  [v7 setFormatStyleHandler:&__block_literal_global_34];
  id v8 = [(GEOComposedString *)self->_composedString stringResultWithOptions:v7];
  id v9 = [v8 attributedComponentStrings];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [MKMultiPartAttributedString alloc];
    int v12 = [v8 attributedComponentStrings];
    objc_super v13 = [v8 attributedSeparatorStrings];
    objc_super v14 = [(MKMultiPartAttributedString *)v11 initWithComponents:v12 separators:v13];
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

void __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  switch([v3 type])
  {
    case 2u:
    case 9u:
      uint64_t v4 = *MEMORY[0x1E4F42508];
      id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
      id v6 = v5;
      if (v5)
      {
        id v7 = objc_msgSend(v5, "_mapkit_fontByAddingFeaturesForTimeDisplay");
        uint64_t v20 = v4;
        v21[0] = v7;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        [v3 setStringAttributes:v8];
      }
      goto LABEL_5;
    case 0xBu:
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_2;
      v19[3] = &unk_1E54BA4F8;
      v19[4] = *(void *)(a1 + 32);
      id v6 = [v3 artworkFormat];
      [v6 setAttributedStringHandler:v19];
LABEL_5:

      break;
    case 0xCu:
      id v9 = +[MKTransitItemReferenceDateUpdater referenceDate];
      uint64_t v10 = [v3 countdownFormat];
      [v10 setOverrideReferenceDate:v9];

      uint64_t IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
      int v12 = [v3 countdownFormat];
      [v12 setRightToLeft:IsRightToLeft];
      goto LABEL_8;
    case 0xEu:
      uint64_t v13 = *MEMORY[0x1E4F42530];
      int v12 = [v3 urlFormat];
      [v12 setLinkAttributeName:v13];
LABEL_8:

      break;
    case 0xFu:
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_3;
      v16[3] = &unk_1E54BA520;
      objc_super v14 = *(void **)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = v14;
      uint64_t v15 = objc_msgSend(v3, "maneuverFormat", v16[0], 3221225472, __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_3, &unk_1E54BA520, v17);
      [v15 setAttributedStringHandler:v16];

      break;
    default:
      break;
  }
}

id __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  int v10 = [v9 artworkType];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v10 == 3)
  {
    int v12 = [v11 _attachmentTextForSFSymbol:v9 attributes:v8];
  }
  else
  {
    uint64_t v13 = [v11 _textAttachmentForGeoArtwork:v9 attributes:v8 accessibilityText:v7];

    if (v13)
    {
      int v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v13];
    }
    else
    {
      int v12 = 0;
    }
    id v9 = (id)v13;
  }

  return v12;
}

id __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [*(id *)(a1 + 32) _textAttachmentForManeuver:a2 junctionInfo:a3 defaultAttributes:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __85__MKServerFormattedString__multiPartAttributedStringForComposedStringWithAttributes___block_invoke_4(uint64_t a1, int a2)
{
  return +[MKServerFormattedString attributesForServerFormatStyle:a2];
}

- (id)multiPartAttributedStringWithAttributes:(id)a3
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v151 = v4;
  if (self->_composedString)
  {
    id v5 = [(MKServerFormattedString *)self _multiPartAttributedStringForComposedStringWithAttributes:v4];
    goto LABEL_3;
  }
  id v7 = (void *)MEMORY[0x1E4F64A00];
  v173 = self;
  id v8 = [(MKServerFormattedString *)self geoServerString];
  v149 = [v7 serverFormattedStringByEvaluatingConditionsInString:v8];

  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x3032000000;
  v201 = __Block_byref_object_copy__12;
  v202 = __Block_byref_object_dispose__12;
  id v203 = [v149 formatStrings];
  v144 = [v149 formatStyles];
  uint64_t v192 = 0;
  v193 = &v192;
  uint64_t v194 = 0x3032000000;
  v195 = __Block_byref_object_copy__12;
  v196 = __Block_byref_object_dispose__12;
  id v197 = [v149 separators];
  if (GEOConfigGetBOOL())
  {
    v191[0] = MEMORY[0x1E4F143A8];
    v191[1] = 3221225472;
    v191[2] = __67__MKServerFormattedString_multiPartAttributedStringWithAttributes___block_invoke;
    v191[3] = &unk_1E54BA590;
    v191[4] = &v198;
    v191[5] = &v192;
    id v9 = (void (**)(void, void))MEMORY[0x18C139AE0](v191);
    if (![(id)v193[5] count] && objc_msgSend((id)v199[5], "count") == 1) {
      ((void (**)(void, __CFString *))v9)[2](v9, @" · ");
    }
    if (![(id)v193[5] count] && objc_msgSend((id)v199[5], "count") == 1) {
      ((void (**)(void, __CFString *))v9)[2](v9, @" · ");
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v153 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend((id)v199[5], "count"));
  v150 = [(MKServerFormattedString *)v173 _attributesByTokenForFormatStyles:v144];
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  obunint64_t j = (id)v199[5];
  uint64_t v146 = [obj countByEnumeratingWithState:&v187 objects:v206 count:16];
  if (v146)
  {
    uint64_t v147 = *(void *)v188;
    uint64_t v174 = *MEMORY[0x1E4F42508];
    uint64_t v167 = *MEMORY[0x1E4F42530];
    uint64_t v154 = *MEMORY[0x1E4F42510];
    do
    {
      for (uint64_t i = 0; i != v146; ++i)
      {
        if (*(void *)v188 != v147) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v187 + 1) + 8 * i);
        if ([v11 length])
        {
          v148 = (void *)[objc_alloc(MEMORY[0x1E4F64A08]) initWithString:v11];
          int v12 = [v148 attributedStringWithStyleAttributes:v150 defaultAttributes:v151];
          v179 = (void *)[v12 mutableCopy];

          v178 = [v179 mutableString];
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          id v155 = [v149 formatTokens];
          uint64_t v159 = [v155 countByEnumeratingWithState:&v183 objects:v205 count:16];
          if (v159)
          {
            uint64_t v158 = *(void *)v184;
            do
            {
              uint64_t v169 = 0;
              do
              {
                if (*(void *)v184 != v158) {
                  objc_enumerationMutation(v155);
                }
                v175 = *(void **)(*((void *)&v183 + 1) + 8 * v169);
                context = (void *)MEMORY[0x18C139870]();
                v177 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                v172 = [v175 token];
                uint64_t v14 = objc_msgSend(v178, "rangeOfString:");
                uint64_t v182 = v13;
                if (v14 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0)
                {
                  while (1)
                  {
                    uint64_t v16 = [v179 attributesAtIndex:v14 effectiveRange:0];
                    id v17 = [v177 objectForKey:v16];
                    if (!v17) {
                      break;
                    }
LABEL_101:
                    if ([v17 length]) {
                      objc_msgSend(v179, "replaceCharactersInRange:withAttributedString:", v14, v182, v17);
                    }
                    else {
                      objc_msgSend(v179, "deleteCharactersInRange:", v14, v182);
                    }
                    unint64_t v89 = [v17 length] + v14;
                    if ([v178 length] <= v89 || (uint64_t v90 = objc_msgSend(v178, "length"), v90 == v89))
                    {
                      uint64_t v182 = 0;
                      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else
                    {
                      uint64_t v91 = objc_msgSend(v178, "rangeOfString:options:range:", v172, 0, v89, v90 - v89);
                      uint64_t v182 = v92;
                      uint64_t v14 = v91;
                    }

                    if (v14 == 0x7FFFFFFFFFFFFFFFLL || !v182) {
                      goto LABEL_30;
                    }
                  }
                  id v18 = [(MKServerFormattedString *)v173 parameters];
                  id v19 = v175;
                  id v176 = v18;
                  v180 = v19;
                  id v181 = v16;
                  if ([v19 type] == 11)
                  {
                    uint64_t v20 = [v181 objectForKeyedSubscript:@"MKServerFormattedStringArtworkSizeAttribute"];
                    id v21 = v20;
                    if (v20) {
                      uint64_t v22 = [v20 unsignedIntegerValue];
                    }
                    else {
                      uint64_t v22 = 4;
                    }
                    uint64_t v33 = [v181 objectForKeyedSubscript:@"MKServerFormattedStringArtworkFeatureTypeAttributeKey"];
                    id v25 = v33;
                    if (v33) {
                      uint64_t v34 = [v33 unsignedIntegerValue];
                    }
                    else {
                      uint64_t v34 = 2;
                    }
                    v35 = [v180 artworkValue];
                    int v36 = [MEMORY[0x1E4F42D90] mainScreen];
                    [v36 scale];
                    double v38 = v37;

                    double v39 = [v181 objectForKeyedSubscript:@"MKServerFormattedStringArtworkDebugDescriptionOnlyAttributeKey"];
                    int v40 = [v39 BOOLValue];

                    if (v40)
                    {
                      CGFloat v41 = [v35 shieldDataSource];
                      unsigned int ShouldBeFlipped = ImageForShieldDataSourceTypeShouldBeFlipped([v41 shieldType]);

                      BOOL v43 = MKTransitArtworkDataSourceAllowMasking(v35);
                      double v44 = MKKeyForTransitArtwork(v35, v22, v34, ShouldBeFlipped, 0, 1.0, v38);
                      int v45 = NSString;
                      double v46 = [v180 token];
                      uint64_t v47 = [v180 stringValue];
                      CGFloat v48 = (void *)v47;
                      int v49 = &stru_1ED919588;
                      if (v47) {
                        id v50 = (__CFString *)v47;
                      }
                      else {
                        id v50 = &stru_1ED919588;
                      }
                      if (v43) {
                        int v49 = @"can mask";
                      }
                      id v51 = [v45 stringWithFormat:@"{Artwork %@ '%@' %@ (%@)}", v46, v50, v44, v49];

                      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v51 attributes:v181];
                    }
                    else
                    {
                      double v52 = +[MKTransitArtworkManager sharedInstance];
                      double v53 = [v52 transitArtworkImageWithDataSource:v35 size:v22 featureType:v34 scale:0 nightMode:v38];

                      double v54 = [v181 objectForKeyedSubscript:@"MKServerFormattedStringArtworkAlphaAttribute"];
                      [v54 doubleValue];
                      double v56 = v55;

                      if (v56 > 0.0 && v56 < 1.0)
                      {
                        uint64_t v57 = [v53 _mapkit_imageWithAlpha:v56];

                        double v53 = v57;
                      }
                      if (v53)
                      {
                        if (MKTransitArtworkDataSourceAllowMasking(v35))
                        {
                          double v58 = [v181 objectForKeyedSubscript:v154];
                          if (v58) {
                            [v53 imageWithTintColor:v58 renderingMode:2];
                          }
                          else {
                          id v51 = [v53 imageWithRenderingMode:2];
                          }
                        }
                        else
                        {
                          id v51 = v53;
                        }
                        id v171 = objc_alloc_init(MEMORY[0x1E4F42698]);
                        [v171 setImage:v51];
                        v59 = [v180 accessibilityLabel];
                        [v171 setAccessibilityLabel:v59];

                        v60 = [v181 objectForKeyedSubscript:v174];
                        [v51 size];
                        double v62 = v61;
                        double v64 = v63;
                        [v60 ascender];
                        double v66 = v65;
                        v67 = [v181 objectForKeyedSubscript:@"MKServerFormattedStringArtworkMatchLineHeightAttributeKey"];
                        int v68 = [v67 BOOLValue];

                        v69 = [v181 objectForKeyedSubscript:@"MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey"];
                        unsigned __int8 v70 = [v69 BOOLValue];

                        if (v60)
                        {
                          double v71 = v62 / v64;
                          if (v68)
                          {
                            objc_msgSend(v60, "_mapkit_lineHeight");
                            double v64 = v72;
                            double v62 = v71 * v72;
                          }
                          else if ((v70 & (v64 > v66)) != 0)
                          {
                            double v64 = v66;
                            double v62 = v71 * v66;
                          }
                        }
                        v73 = [v181 objectForKey:@"MKServerFormattedStringArtworkScaleAttributeKey"];
                        v74 = v73;
                        if (v73)
                        {
                          [v73 cgFloatValue];
                          double v76 = v75;
                          [v74 cgFloatValue];
                          double v62 = v62 * v76;
                          double v64 = v64 * v77;
                        }
                        [v60 capHeight];
                        double v79 = (v78 - v64) * 0.5;
                        if (v60) {
                          double v80 = v79;
                        }
                        else {
                          double v80 = 0.0;
                        }
                        objc_msgSend(v171, "setBounds:", 0.0, v80, v62, v64);
                        uint64_t v27 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v171];
                      }
                      else
                      {
                        id v51 = GEOFindOrCreateLog();
                        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v212 = v175;
                          _os_log_impl(&dword_18BAEC000, v51, OS_LOG_TYPE_ERROR, "Could not find requested shield: %@", buf, 0xCu);
                        }
                        uint64_t v27 = 0;
                      }
                    }

LABEL_83:
LABEL_84:

                    if (!v27) {
                      goto LABEL_85;
                    }
LABEL_92:
                    uint64_t v84 = [v180 type];
                    if (v84 == 9 || v84 == 3)
                    {
                      v85 = [v181 objectForKeyedSubscript:v174];
                      if (v85)
                      {
                        v86 = (void *)[v27 mutableCopy];
                        v87 = objc_msgSend(v85, "_mapkit_fontByAddingFeaturesForTimeDisplay");
                        objc_msgSend(v86, "addAttribute:value:range:", v174, v87, 0, objc_msgSend(v86, "length"));

                        uint64_t v88 = [v86 copy];
                        uint64_t v27 = (void *)v88;
                      }
                    }
                    if (v27)
                    {
                      id v17 = v27;
                    }
                    else
                    {
                      id v17 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED919588];
                    }
                    [v177 setObject:v17 forKey:v181];
                    goto LABEL_101;
                  }
                  if ([v19 type] == 14)
                  {
                    id v21 = [v19 urlValue];
                    id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
                    CGFloat v24 = [v21 displayTitle];
                    id v25 = (id)[v23 initWithString:v24];

                    uint64_t v26 = [v21 url];
                    objc_msgSend(v25, "addAttribute:value:range:", v167, v26, 0, objc_msgSend(v25, "length"));

                    uint64_t v27 = (void *)[v25 copy];
                    goto LABEL_84;
                  }
                  if ([v19 type] != 15)
                  {
LABEL_85:
                    v81 = NSString;
                    if (v176) {
                      [v176 options];
                    }
                    else {
                      memset(v204, 0, sizeof(v204));
                    }
                    v82 = [v176 variableOverrides];
                    v83 = objc_msgSend(v81, "_navigation_replacementForFormatToken:options:overrideVariables:", v180, v204, v82);

                    if (v83) {
                      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v83 attributes:v181];
                    }
                    else {
                      uint64_t v27 = 0;
                    }

                    goto LABEL_92;
                  }
                  uint64_t v28 = [v19 maneuverValue];
                  unsigned int v29 = [v28 maneuverType];

                  if (v29 <= 0x27 && ((1 << v29) & 0x8600050000) != 0)
                  {
                    id v21 = [v181 objectForKey:@"MKServerFormattedStringArtworkArrivalIconImageKey"];
                    if (!v21)
                    {
                      double v30 = GEOFindOrCreateLog();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v212 = v175;
                        _os_log_impl(&dword_18BAEC000, v30, OS_LOG_TYPE_ERROR, "No arrival icon image for token: %@", buf, 0xCu);
                      }

                      goto LABEL_45;
                    }
                  }
                  else
                  {
LABEL_45:
                    CGFloat v31 = [v181 objectForKey:@"MKServerFormattedStringArtworkArrowFillColorAttributeKey"];
                    uint64_t v32 = v31;
                    if (v31)
                    {
                      id v170 = v31;
                    }
                    else
                    {
                      id v170 = [MEMORY[0x1E4F428B8] labelColor];
                    }

                    v93 = [v181 objectForKey:@"MKServerFormattedStringArtworkJunctionFillColorAttributeKey"];
                    v94 = v93;
                    if (v93)
                    {
                      id v166 = v93;
                    }
                    else
                    {
                      id v166 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
                    }

                    v95 = [v181 objectForKey:@"MKServerFormattedStringArtworkSideLengthAttributeKey"];
                    v165 = v95;
                    if (!v95)
                    {
                      v96 = GEOFindOrCreateLog();
                      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v212 = v175;
                        _os_log_impl(&dword_18BAEC000, v96, OS_LOG_TYPE_ERROR, "No side length attribute for token: %@", buf, 0xCu);
                      }

                      v95 = 0;
                    }
                    [v95 cgFloatValue];
                    CGFloat v98 = v97;
                    v164 = [v180 maneuverValue];
                    v163 = [v164 junctionInfo];
                    unsigned int v157 = [v163 junctionType];
                    v162 = [v180 maneuverValue];
                    unsigned int v156 = [v162 maneuverType];
                    v161 = [v180 maneuverValue];
                    v160 = [v161 junctionInfo];
                    uint64_t v99 = [v160 drivingSide];
                    v100 = [v180 maneuverValue];
                    v101 = [v100 junctionInfo];
                    uint64_t v102 = [v101 junctionElements];
                    v103 = [v180 maneuverValue];
                    v104 = [v103 junctionInfo];
                    uint64_t v105 = [v104 junctionElementsCount];
                    v106 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", MKDefaultJunctionManeuverMetrics((uint64_t)buf));
                    [v106 scale];
                    CGFloat v108 = v107;

                    id v21 = MKJunctionArrowImage(v157, v156, v99, v102, v105, (double *)buf, v170, v166, v98, v98, v108, 0);

                    if (!v21)
                    {
                      v109 = GEOFindOrCreateLog();
                      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                      {
                        v110 = [v180 maneuverValue];
                        uint64_t v111 = [v110 maneuverType];
                        v112 = @"NO_TURN";
                        switch((int)v111)
                        {
                          case 0:
                            break;
                          case 1:
                            v112 = @"LEFT_TURN";
                            break;
                          case 2:
                            v112 = @"RIGHT_TURN";
                            break;
                          case 3:
                            v112 = @"STRAIGHT_AHEAD";
                            break;
                          case 4:
                            v112 = @"U_TURN";
                            break;
                          case 5:
                            v112 = @"FOLLOW_ROAD";
                            break;
                          case 6:
                            v112 = @"ENTER_ROUNDABOUT";
                            break;
                          case 7:
                            v112 = @"EXIT_ROUNDABOUT";
                            break;
                          case 11:
                            v112 = @"OFF_RAMP";
                            break;
                          case 12:
                            v112 = @"ON_RAMP";
                            break;
                          case 16:
                            v112 = @"ARRIVE_END_OF_NAVIGATION";
                            break;
                          case 17:
                            v112 = @"START_ROUTE";
                            break;
                          case 18:
                            v112 = @"ARRIVE_AT_DESTINATION";
                            break;
                          case 20:
                            v112 = @"KEEP_LEFT";
                            break;
                          case 21:
                            v112 = @"KEEP_RIGHT";
                            break;
                          case 22:
                            v112 = @"ENTER_FERRY";
                            break;
                          case 23:
                            v112 = @"EXIT_FERRY";
                            break;
                          case 24:
                            v112 = @"CHANGE_FERRY";
                            break;
                          case 25:
                            v112 = @"START_ROUTE_WITH_U_TURN";
                            break;
                          case 26:
                            v112 = @"U_TURN_AT_ROUNDABOUT";
                            break;
                          case 27:
                            v112 = @"LEFT_TURN_AT_END";
                            break;
                          case 28:
                            v112 = @"RIGHT_TURN_AT_END";
                            break;
                          case 29:
                            v112 = @"HIGHWAY_OFF_RAMP_LEFT";
                            break;
                          case 30:
                            v112 = @"HIGHWAY_OFF_RAMP_RIGHT";
                            break;
                          case 33:
                            v112 = @"ARRIVE_AT_DESTINATION_LEFT";
                            break;
                          case 34:
                            v112 = @"ARRIVE_AT_DESTINATION_RIGHT";
                            break;
                          case 35:
                            v112 = @"U_TURN_WHEN_POSSIBLE";
                            break;
                          case 39:
                            v112 = @"ARRIVE_END_OF_DIRECTIONS";
                            break;
                          case 41:
                            v112 = @"ROUNDABOUT_EXIT_1";
                            break;
                          case 42:
                            v112 = @"ROUNDABOUT_EXIT_2";
                            break;
                          case 43:
                            v112 = @"ROUNDABOUT_EXIT_3";
                            break;
                          case 44:
                            v112 = @"ROUNDABOUT_EXIT_4";
                            break;
                          case 45:
                            v112 = @"ROUNDABOUT_EXIT_5";
                            break;
                          case 46:
                            v112 = @"ROUNDABOUT_EXIT_6";
                            break;
                          case 47:
                            v112 = @"ROUNDABOUT_EXIT_7";
                            break;
                          case 48:
                            v112 = @"ROUNDABOUT_EXIT_8";
                            break;
                          case 49:
                            v112 = @"ROUNDABOUT_EXIT_9";
                            break;
                          case 50:
                            v112 = @"ROUNDABOUT_EXIT_10";
                            break;
                          case 51:
                            v112 = @"ROUNDABOUT_EXIT_11";
                            break;
                          case 52:
                            v112 = @"ROUNDABOUT_EXIT_12";
                            break;
                          case 53:
                            v112 = @"ROUNDABOUT_EXIT_13";
                            break;
                          case 54:
                            v112 = @"ROUNDABOUT_EXIT_14";
                            break;
                          case 55:
                            v112 = @"ROUNDABOUT_EXIT_15";
                            break;
                          case 56:
                            v112 = @"ROUNDABOUT_EXIT_16";
                            break;
                          case 57:
                            v112 = @"ROUNDABOUT_EXIT_17";
                            break;
                          case 58:
                            v112 = @"ROUNDABOUT_EXIT_18";
                            break;
                          case 59:
                            v112 = @"ROUNDABOUT_EXIT_19";
                            break;
                          case 60:
                            v112 = @"SHARP_LEFT_TURN";
                            break;
                          case 61:
                            v112 = @"SHARP_RIGHT_TURN";
                            break;
                          case 62:
                            v112 = @"SLIGHT_LEFT_TURN";
                            break;
                          case 63:
                            v112 = @"SLIGHT_RIGHT_TURN";
                            break;
                          case 64:
                            v112 = @"CHANGE_HIGHWAY";
                            break;
                          case 65:
                            v112 = @"CHANGE_HIGHWAY_LEFT";
                            break;
                          case 66:
                            v112 = @"CHANGE_HIGHWAY_RIGHT";
                            break;
                          case 80:
                            v112 = @"TOLL_STATION";
                            break;
                          case 81:
                            v112 = @"ENTER_TUNNEL";
                            break;
                          case 82:
                            v112 = @"WAYPOINT_STOP";
                            break;
                          case 83:
                            v112 = @"WAYPOINT_STOP_LEFT";
                            break;
                          case 84:
                            v112 = @"WAYPOINT_STOP_RIGHT";
                            break;
                          case 85:
                            v112 = @"RESUME_ROUTE";
                            break;
                          case 86:
                            v112 = @"RESUME_ROUTE_WITH_U_TURN";
                            break;
                          case 87:
                            v112 = @"CUSTOM";
                            break;
                          case 88:
                            v112 = @"TURN_AROUND";
                            break;
                          default:
                            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v111);
                            v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            break;
                        }
                        *(_DWORD *)v209 = 138412290;
                        v210 = v112;
                        _os_log_impl(&dword_18BAEC000, v109, OS_LOG_TYPE_INFO, "Junction for maneuver type %@ could not be drawn; trying regular maneuver arrow",
                          v209,
                          0xCu);
                      }
                      v113 = [v180 maneuverValue];
                      int v114 = [v113 maneuverType];
                      v115 = [v180 maneuverValue];
                      v116 = [v115 junctionInfo];
                      int v117 = [v116 drivingSide];
                      v118 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v209));
                      [v118 scale];
                      CGFloat v120 = v119;

                      id v21 = MKManeuverArrowImage(v114, v117, (double *)v209, v170, v166, 0, v98, v98, v120);

                      if (!v21)
                      {
                        v121 = GEOFindOrCreateLog();
                        if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
                        {
                          v122 = [v180 maneuverValue];
                          uint64_t v123 = [v122 maneuverType];
                          v124 = @"NO_TURN";
                          switch((int)v123)
                          {
                            case 0:
                              break;
                            case 1:
                              v124 = @"LEFT_TURN";
                              break;
                            case 2:
                              v124 = @"RIGHT_TURN";
                              break;
                            case 3:
                              v124 = @"STRAIGHT_AHEAD";
                              break;
                            case 4:
                              v124 = @"U_TURN";
                              break;
                            case 5:
                              v124 = @"FOLLOW_ROAD";
                              break;
                            case 6:
                              v124 = @"ENTER_ROUNDABOUT";
                              break;
                            case 7:
                              v124 = @"EXIT_ROUNDABOUT";
                              break;
                            case 11:
                              v124 = @"OFF_RAMP";
                              break;
                            case 12:
                              v124 = @"ON_RAMP";
                              break;
                            case 16:
                              v124 = @"ARRIVE_END_OF_NAVIGATION";
                              break;
                            case 17:
                              v124 = @"START_ROUTE";
                              break;
                            case 18:
                              v124 = @"ARRIVE_AT_DESTINATION";
                              break;
                            case 20:
                              v124 = @"KEEP_LEFT";
                              break;
                            case 21:
                              v124 = @"KEEP_RIGHT";
                              break;
                            case 22:
                              v124 = @"ENTER_FERRY";
                              break;
                            case 23:
                              v124 = @"EXIT_FERRY";
                              break;
                            case 24:
                              v124 = @"CHANGE_FERRY";
                              break;
                            case 25:
                              v124 = @"START_ROUTE_WITH_U_TURN";
                              break;
                            case 26:
                              v124 = @"U_TURN_AT_ROUNDABOUT";
                              break;
                            case 27:
                              v124 = @"LEFT_TURN_AT_END";
                              break;
                            case 28:
                              v124 = @"RIGHT_TURN_AT_END";
                              break;
                            case 29:
                              v124 = @"HIGHWAY_OFF_RAMP_LEFT";
                              break;
                            case 30:
                              v124 = @"HIGHWAY_OFF_RAMP_RIGHT";
                              break;
                            case 33:
                              v124 = @"ARRIVE_AT_DESTINATION_LEFT";
                              break;
                            case 34:
                              v124 = @"ARRIVE_AT_DESTINATION_RIGHT";
                              break;
                            case 35:
                              v124 = @"U_TURN_WHEN_POSSIBLE";
                              break;
                            case 39:
                              v124 = @"ARRIVE_END_OF_DIRECTIONS";
                              break;
                            case 41:
                              v124 = @"ROUNDABOUT_EXIT_1";
                              break;
                            case 42:
                              v124 = @"ROUNDABOUT_EXIT_2";
                              break;
                            case 43:
                              v124 = @"ROUNDABOUT_EXIT_3";
                              break;
                            case 44:
                              v124 = @"ROUNDABOUT_EXIT_4";
                              break;
                            case 45:
                              v124 = @"ROUNDABOUT_EXIT_5";
                              break;
                            case 46:
                              v124 = @"ROUNDABOUT_EXIT_6";
                              break;
                            case 47:
                              v124 = @"ROUNDABOUT_EXIT_7";
                              break;
                            case 48:
                              v124 = @"ROUNDABOUT_EXIT_8";
                              break;
                            case 49:
                              v124 = @"ROUNDABOUT_EXIT_9";
                              break;
                            case 50:
                              v124 = @"ROUNDABOUT_EXIT_10";
                              break;
                            case 51:
                              v124 = @"ROUNDABOUT_EXIT_11";
                              break;
                            case 52:
                              v124 = @"ROUNDABOUT_EXIT_12";
                              break;
                            case 53:
                              v124 = @"ROUNDABOUT_EXIT_13";
                              break;
                            case 54:
                              v124 = @"ROUNDABOUT_EXIT_14";
                              break;
                            case 55:
                              v124 = @"ROUNDABOUT_EXIT_15";
                              break;
                            case 56:
                              v124 = @"ROUNDABOUT_EXIT_16";
                              break;
                            case 57:
                              v124 = @"ROUNDABOUT_EXIT_17";
                              break;
                            case 58:
                              v124 = @"ROUNDABOUT_EXIT_18";
                              break;
                            case 59:
                              v124 = @"ROUNDABOUT_EXIT_19";
                              break;
                            case 60:
                              v124 = @"SHARP_LEFT_TURN";
                              break;
                            case 61:
                              v124 = @"SHARP_RIGHT_TURN";
                              break;
                            case 62:
                              v124 = @"SLIGHT_LEFT_TURN";
                              break;
                            case 63:
                              v124 = @"SLIGHT_RIGHT_TURN";
                              break;
                            case 64:
                              v124 = @"CHANGE_HIGHWAY";
                              break;
                            case 65:
                              v124 = @"CHANGE_HIGHWAY_LEFT";
                              break;
                            case 66:
                              v124 = @"CHANGE_HIGHWAY_RIGHT";
                              break;
                            case 80:
                              v124 = @"TOLL_STATION";
                              break;
                            case 81:
                              v124 = @"ENTER_TUNNEL";
                              break;
                            case 82:
                              v124 = @"WAYPOINT_STOP";
                              break;
                            case 83:
                              v124 = @"WAYPOINT_STOP_LEFT";
                              break;
                            case 84:
                              v124 = @"WAYPOINT_STOP_RIGHT";
                              break;
                            case 85:
                              v124 = @"RESUME_ROUTE";
                              break;
                            case 86:
                              v124 = @"RESUME_ROUTE_WITH_U_TURN";
                              break;
                            case 87:
                              v124 = @"CUSTOM";
                              break;
                            case 88:
                              v124 = @"TURN_AROUND";
                              break;
                            default:
                              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v123);
                              v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
                              break;
                          }
                          *(_DWORD *)v207 = 138412290;
                          v208 = v124;
                          _os_log_impl(&dword_18BAEC000, v121, OS_LOG_TYPE_INFO, "Maneuver type %@ could not be drawn; defaulting to .STRAIGHT_AHEAD",
                            v207,
                            0xCu);
                        }
                        v125 = [v180 maneuverValue];
                        v126 = [v125 junctionInfo];
                        int v127 = [v126 drivingSide];
                        v128 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", MKDefaultGuidanceManeuverMetrics((uint64_t)v207));
                        [v128 scale];
                        CGFloat v130 = v129;

                        id v21 = MKManeuverArrowImage(3, v127, (double *)v207, v170, v166, 0, v98, v98, v130);
                      }
                    }
                  }
                  id v25 = objc_alloc_init(MEMORY[0x1E4F42698]);
                  [v25 setImage:v21];
                  v35 = [v181 objectForKeyedSubscript:v174];
                  [v35 capHeight];
                  double v132 = v131;
                  [v21 size];
                  double v134 = v133;
                  [v21 size];
                  double v136 = v135;
                  [v21 size];
                  objc_msgSend(v25, "setBounds:", 0.0, round(v132 - v134) * 0.5, v136, v137);
                  uint64_t v27 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v25];
                  goto LABEL_83;
                }
LABEL_30:

                ++v169;
              }
              while (v169 != v159);
              uint64_t v138 = [v155 countByEnumeratingWithState:&v183 objects:v205 count:16];
              uint64_t v159 = v138;
            }
            while (v138);
          }

          if ([v179 length]) {
            [v153 addObject:v179];
          }
        }
      }
      uint64_t v146 = [obj countByEnumeratingWithState:&v187 objects:v206 count:16];
    }
    while (v146);
  }

  v139 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v193[5], "count"));
  for (unint64_t j = 0; j < [v153 count]; ++j)
  {
    if (j < [v153 count] - 1)
    {
      v141 = &stru_1ED919588;
      if (j < [(id)v193[5] count])
      {
        v141 = [(id)v193[5] objectAtIndexedSubscript:j];
      }
      v142 = (void *)[objc_alloc(MEMORY[0x1E4F64A08]) initWithString:v141];
      v143 = [v142 attributedStringWithStyleAttributes:v150 defaultAttributes:v151];
      [v139 addObject:v143];
    }
  }
  id v5 = [[MKMultiPartAttributedString alloc] initWithComponents:v153 separators:v139];

  _Block_object_dispose(&v192, 8);
  _Block_object_dispose(&v198, 8);

LABEL_3:

  return v5;
}

void __67__MKServerFormattedString_multiPartAttributedStringWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) firstObject];
  uint64_t v4 = [v3 componentsSeparatedByString:v12];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "count") - 1);
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] != 1)
  {
    unint64_t v8 = 0;
    do
    {
      [v7 addObject:v12];
      ++v8;
    }
    while (v8 < [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] - 1);
  }
  uint64_t v9 = [v7 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)_attributesByTokenForFormatStyles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_opt_class(), "attributesForServerFormatStyle:", objc_msgSend(v10, "styleType", (void)v14));
        id v12 = [v10 token];
        [v4 setObject:v11 forKey:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MKServerFormattedString *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MKServerFormattedString *)self isEqualToServerFormattedString:v5];

  return v6;
}

- (BOOL)isEqualToServerFormattedString:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = [(MKServerFormattedString *)self geoServerString];
  BOOL v6 = [v4 geoServerString];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  uint64_t v9 = (void *)v8;
  if (!(v7 | v8)) {
    goto LABEL_2;
  }
  if (v8) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v7 != 0;
  }
  if (v8) {
    BOOL v18 = v7 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18 || v17) {
    goto LABEL_93;
  }
  uint64_t v19 = [(id)v7 formatStrings];
  uint64_t v20 = [v9 formatStrings];
  unint64_t v21 = v19;
  unint64_t v22 = v20;
  id v23 = (void *)v22;
  if (v21 | v22)
  {
    if (v22) {
      BOOL v36 = 0;
    }
    else {
      BOOL v36 = v21 != 0;
    }
    if (v22) {
      BOOL v37 = v21 == 0;
    }
    else {
      BOOL v37 = 0;
    }
    if (v37 || v36 || (uint64_t v38 = [(id)v21 count], v38 != objc_msgSend(v23, "count")))
    {

LABEL_92:
LABEL_93:

      goto LABEL_94;
    }
    double v79 = self;
    v82 = v9;
    double v39 = v23;
    uint64_t v84 = v4;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    unint64_t v90 = v21;
    id v40 = (id)v21;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v92 objects:v96 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v93;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v93 != v44) {
            objc_enumerationMutation(v40);
          }
          unint64_t v46 = *(void *)(*((void *)&v92 + 1) + 8 * i);
          uint64_t v47 = [v39 objectAtIndexedSubscript:v43 + i];
          if (v46 | v47)
          {
            CGFloat v48 = (void *)v47;
            int v49 = [(id)v46 isEqual:v47];

            if (!v49)
            {

              id v23 = v39;
              uint64_t v9 = v82;
              uint64_t v4 = v84;
              unint64_t v21 = v90;
              goto LABEL_92;
            }
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v92 objects:v96 count:16];
        v43 += i;
        if (v42) {
          continue;
        }
        break;
      }
    }

    id v23 = v39;
    uint64_t v9 = v82;
    uint64_t v4 = v84;
    self = v79;
    unint64_t v21 = v90;
  }
  CGFloat v24 = [(id)v7 separators];
  id v25 = [v9 separators];
  unint64_t v26 = v24;
  unint64_t v27 = v25;
  uint64_t v28 = (void *)v27;
  if (v26 | v27)
  {
    if (v27) {
      BOOL v50 = 0;
    }
    else {
      BOOL v50 = v26 != 0;
    }
    if (v27) {
      BOOL v51 = v26 == 0;
    }
    else {
      BOOL v51 = 0;
    }
    if (v51 || v50 || (uint64_t v52 = [(id)v26 count], v52 != objc_msgSend(v28, "count")))
    {

LABEL_91:
      goto LABEL_92;
    }
    double v80 = self;
    v83 = v9;
    double v53 = v23;
    uint64_t v88 = (void *)v26;
    unint64_t v91 = v21;
    v85 = v4;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v54 = (id)v26;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v92 objects:v96 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = 0;
      uint64_t v58 = *(void *)v93;
      while (2)
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v93 != v58) {
            objc_enumerationMutation(v54);
          }
          unint64_t v60 = *(void *)(*((void *)&v92 + 1) + 8 * j);
          uint64_t v61 = [v28 objectAtIndexedSubscript:v57 + j];
          if (v60 | v61)
          {
            double v62 = (void *)v61;
            int v63 = [(id)v60 isEqual:v61];

            if (!v63)
            {

              uint64_t v4 = v85;
              unint64_t v21 = v91;
              id v23 = v53;
LABEL_89:
              uint64_t v9 = v83;
              goto LABEL_90;
            }
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v92 objects:v96 count:16];
        v57 += j;
        if (v56) {
          continue;
        }
        break;
      }
    }

    self = v80;
    unint64_t v21 = v91;
    id v23 = v53;
    uint64_t v9 = v83;
    uint64_t v4 = v85;
  }
  else
  {
    uint64_t v88 = (void *)v26;
  }
  unsigned int v29 = [(id)v7 formatTokens];
  double v30 = [v9 formatTokens];
  unint64_t v31 = v29;
  unint64_t v32 = v30;
  uint64_t v33 = (void *)v32;
  if (!(v31 | v32))
  {
    unint64_t v89 = (void *)v21;
    goto LABEL_19;
  }
  if (v32) {
    BOOL v64 = 0;
  }
  else {
    BOOL v64 = v31 != 0;
  }
  if (v32) {
    BOOL v65 = v31 == 0;
  }
  else {
    BOOL v65 = 0;
  }
  if (v65
    || v64
    || (double v78 = (void *)v31,
        uint64_t v66 = [(id)v31 count],
        BOOL v18 = v66 == [v33 count],
        unint64_t v31 = (unint64_t)v78,
        !v18))
  {

LABEL_90:
    unint64_t v26 = (unint64_t)v88;
    goto LABEL_91;
  }
  v81 = self;
  v83 = v9;
  double v77 = v23;
  unint64_t v89 = (void *)v21;
  v86 = v4;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v67 = v78;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v92 objects:v96 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = 0;
    uint64_t v71 = *(void *)v93;
    while (2)
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v93 != v71) {
          objc_enumerationMutation(v67);
        }
        v73 = [v33 objectAtIndexedSubscript:v70 + k];
        int v74 = GEOServerFormatTokenEqual();

        if (!v74)
        {

          uint64_t v4 = v86;
          unint64_t v21 = (unint64_t)v89;
          id v23 = v77;
          goto LABEL_89;
        }
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v92 objects:v96 count:16];
      v70 += k;
      if (v69) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = v83;
  uint64_t v4 = v86;
  unint64_t v31 = (unint64_t)v78;
  self = v81;
  id v23 = v77;
LABEL_19:
  uint64_t v34 = [(id)v7 alternativeString];
  uint64_t v35 = [v9 alternativeString];
  if (!(v34 | v35))
  {

    goto LABEL_2;
  }
  double v75 = (void *)v35;
  char v87 = [(id)v34 isEqual:v35];

  if ((v87 & 1) == 0)
  {
LABEL_94:
    char v16 = 0;
    goto LABEL_95;
  }
LABEL_2:
  uint64_t v10 = [(MKServerFormattedString *)self parameters];
  uint64_t v11 = [v4 parameters];
  unint64_t v12 = v10;
  unint64_t v13 = v11;
  if (v12 | v13 && (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
  {
    char v16 = 0;
  }
  else
  {
    composedString = self->_composedString;
    if ((unint64_t)composedString | v4[3]) {
      char v16 = -[GEOComposedString isEqual:](composedString, "isEqual:");
    }
    else {
      char v16 = 1;
    }
  }

LABEL_95:
  return v16;
}

- (unint64_t)hash
{
  id v3 = [(MKServerFormattedString *)self geoServerString];
  uint64_t v4 = [v3 hash];
  id v5 = [(MKServerFormattedString *)self parameters];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)debugDescription
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F42508];
  v11[0] = @"MKServerFormattedStringArtworkDebugDescriptionOnlyAttributeKey";
  v11[1] = v3;
  v12[0] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = (void *)MEMORY[0x1E4F42A30];
  [MEMORY[0x1E4F42A30] systemFontSize];
  id v5 = objc_msgSend(v4, "systemFontOfSize:");
  v12[1] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  unint64_t v7 = [(MKServerFormattedString *)self multiPartAttributedStringWithAttributes:v6];
  unint64_t v8 = [v7 attributedString];
  uint64_t v9 = [v8 string];

  return v9;
}

- (GEOServerFormattedString)geoServerString
{
  return self->_geoServerString;
}

- (MKServerFormattedStringParameters)parameters
{
  return self->_parameters;
}

- (GEOComposedString)composedString
{
  return self->_composedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_geoServerString, 0);
}

+ (id)attributesForServerFormatStyle:(int64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    unint64_t v8 = +[MKInfoCardThemeManager currentTheme];
    uint64_t v4 = [v8 transitDelayedTextColor];

    if (v4)
    {
      uint64_t v11 = *MEMORY[0x1E4F42510];
      unint64_t v12 = v4;
      id v5 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v6 = &v12;
      unint64_t v7 = &v11;
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_10;
  }
  if (a3 != 1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_11;
  }
  uint64_t v3 = +[MKInfoCardThemeManager currentTheme];
  uint64_t v4 = [v3 transitOntimeTextColor];

  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v13 = *MEMORY[0x1E4F42510];
  v14[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  unint64_t v6 = (void **)v14;
  unint64_t v7 = &v13;
LABEL_7:
  uint64_t v9 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
LABEL_10:

LABEL_11:

  return v9;
}

@end