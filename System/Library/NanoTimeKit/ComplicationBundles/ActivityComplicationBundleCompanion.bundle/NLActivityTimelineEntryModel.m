@interface NLActivityTimelineEntryModel
+ (id)_LocalizedStringWithActiveEnergy:(id)a3;
- (NLActivityTimelineEntryModel)initWithDataModel:(id)a3;
- (id)_activityTemplateWithFamily:(int64_t)a3;
- (id)_largeModularTemplate;
- (id)_largeUtilityTemplate;
- (id)_newLargeModularTemplateWithRow1Col2TextProvider:(id)a3 row2Col2TextProvider:(id)a4 row3Col2TextProvider:(id)a5;
- (id)_signatureBezelTemplate;
- (id)_signatureCircularTemplate;
- (id)_signatureCornerTemplate;
- (id)_signatureExtraLargeTemplate;
- (id)_signatureRectangleTemplate;
- (id)templateForComplicationFamily:(int64_t)a3;
- (int64_t)availabilityState;
@end

@implementation NLActivityTimelineEntryModel

- (NLActivityTimelineEntryModel)initWithDataModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLActivityTimelineEntryModel;
  v6 = [(NLActivityTimelineEntryModel *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataModel, a3);
    v8 = [v5 date];
    [(NLActivityTimelineEntryModel *)v7 setEntryDate:v8];
  }
  return v7;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  id v5 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
    case 7:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _activityTemplateWithFamily:a3];
      goto LABEL_10;
    case 1:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _largeModularTemplate];
      goto LABEL_10;
    case 3:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _largeUtilityTemplate];
      goto LABEL_10;
    case 8:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _signatureCornerTemplate];
      goto LABEL_10;
    case 9:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _signatureBezelTemplate];
      goto LABEL_10;
    case 10:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _signatureCircularTemplate];
      goto LABEL_10;
    case 11:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _signatureRectangleTemplate];
      goto LABEL_10;
    case 12:
      uint64_t v6 = [(NLActivityTimelineEntryModel *)self _signatureExtraLargeTemplate];
LABEL_10:
      id v5 = (void *)v6;
      break;
    default:
      break;
  }
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    uint64_t v7 = [(NLActivityTimelineEntryModel *)self _activityTemplateWithFamily:a3];

    id v5 = (void *)v7;
  }

  return v5;
}

- (id)_activityTemplateWithFamily:(int64_t)a3
{
  v4 = +[CLKComplicationTemplateActivity activityTemplateWithFamily:a3];
  if ([(NLActivityTimelineEntryModel *)self availabilityState])
  {
    [v4 setHideDots:1];
  }
  else
  {
    id v5 = (char *)[(FIUIActivityDataModel *)self->_dataModel activityMoveMode];
    dataModel = self->_dataModel;
    if (v5 == (unsigned char *)&dword_0 + 2) {
      [(FIUIActivityDataModel *)dataModel appleMoveTimeCompletionPercentage];
    }
    else {
      [(FIUIActivityDataModel *)dataModel activeEnergyCompletionPercentage];
    }
    objc_msgSend(v4, "setMovePercentComplete:");
    [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeCompletionPercentage];
    objc_msgSend(v4, "setExercisePercentComplete:");
    [(FIUIActivityDataModel *)self->_dataModel appleStandHourCompletionPercentage];
    objc_msgSend(v4, "setStandPercentComplete:");
  }
  [v4 finalize];

  return v4;
}

- (id)_largeModularTemplate
{
  switch([(NLActivityTimelineEntryModel *)self availabilityState])
  {
    case 0:
      if ([(FIUIActivityDataModel *)self->_dataModel activityMoveMode] == (char *)&dword_0 + 2)
      {
        [(FIUIActivityDataModel *)self->_dataModel appleMoveTimeTotal];
        LODWORD(v4) = llround(v3);
        id v5 = +[NSString localizedStringWithFormat:@"%d", v4];
        [(FIUIActivityDataModel *)self->_dataModel appleMoveTimeGoal];
        LODWORD(v7) = llround(v6);
        v8 = +[NSString localizedStringWithFormat:@"%d", v7];
      }
      else
      {
        v17 = objc_opt_class();
        v18 = [(FIUIActivityDataModel *)self->_dataModel activeEnergyTotal];
        id v5 = [v17 _LocalizedStringWithActiveEnergy:v18];

        v19 = objc_opt_class();
        v20 = [(FIUIActivityDataModel *)self->_dataModel activeEnergyGoal];
        v8 = [v19 _LocalizedStringWithActiveEnergy:v20];
      }
      objc_super v10 = NTKFractionStringBasedOnCurrentLocaleNumberSystem();

      v33 = +[CLKSimpleTextProvider textProviderWithText:v10];
      [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeTotal];
      LODWORD(v22) = llround(v21);
      v35 = +[NSString localizedStringWithFormat:@"%d", v22];
      [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeGoal];
      LODWORD(v24) = llround(v23);
      v34 = +[NSString localizedStringWithFormat:@"%d", v24];
      v25 = NTKFractionStringBasedOnCurrentLocaleNumberSystem();
      v26 = +[CLKSimpleTextProvider textProviderWithText:v25];
      v27 = +[NSString localizedStringWithFormat:@"%d", [(FIUIActivityDataModel *)self->_dataModel appleStandHoursTotal]];
      v28 = +[NSString localizedStringWithFormat:@"%d", [(FIUIActivityDataModel *)self->_dataModel appleStandHoursGoal]];
      v29 = NTKFractionStringBasedOnCurrentLocaleNumberSystem();
      v30 = +[CLKSimpleTextProvider textProviderWithText:v29];
      id v11 = [(NLActivityTimelineEntryModel *)self _newLargeModularTemplateWithRow1Col2TextProvider:v33 row2Col2TextProvider:v26 row3Col2TextProvider:v30];
      v31 = +[UIColor clearColor];
      [v11 setTintColor:v31];

      goto LABEL_11;
    case 1:
      v14 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_LARGE_MODULAR");
      objc_super v10 = +[CLKSimpleTextProvider textProviderWithText:v14];

      v13 = @"ACTIVITY_LOADING_LARGE_MODULAR";
      goto LABEL_8;
    case 2:
      v9 = NLActivityComplicationLocalizedString(@"ACTIVITY_LARGE_INVALID_DATA");
      objc_super v10 = +[NTKOverrideTextProvider textProviderWithText:v9 overrideBlock:&stru_10690];

      id v11 = [(NLActivityTimelineEntryModel *)self _newLargeModularTemplateWithRow1Col2TextProvider:v10 row2Col2TextProvider:v10 row3Col2TextProvider:v10];
      goto LABEL_11;
    case 3:
      v12 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_LARGE_MODULAR");
      objc_super v10 = +[CLKSimpleTextProvider textProviderWithText:v12];

      v13 = @"ACTIVITY_PROMPT_SETUP_BODY_LARGE_MODULAR";
LABEL_8:
      v15 = NLActivityComplicationLocalizedString(v13);
      v16 = +[CLKSimpleTextProvider textProviderWithText:v15];

      id v11 = +[CLKComplicationTemplateModularLargeStandardBody templateWithHeaderTextProvider:v10 body1TextProvider:v16];

LABEL_11:
      break;
    default:
      id v11 = 0;
      break;
  }
  [v11 finalize];

  return v11;
}

- (id)_newLargeModularTemplateWithRow1Col2TextProvider:(id)a3 row2Col2TextProvider:(id)a4 row3Col2TextProvider:(id)a5
{
  dataModel = self->_dataModel;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([(FIUIActivityDataModel *)dataModel activityMoveMode] == (char *)&dword_0 + 2)
  {
    id v11 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_MIN");
    v12 = +[CLKSimpleTextProvider textProviderWithText:v11];
  }
  else
  {
    v13 = +[FIUIActivityDataModel formattingManager];
    id v11 = [v13 localizationKeyForEnergyBaseKey:@"ACTIVITY_TITLE_ENERGY"];

    v14 = NLActivityComplicationLocalizedString(v11);
    v12 = +[CLKSimpleTextProvider textProviderWithText:v14];
  }
  v15 = NTKMoveNonGradientTextColor();
  [v12 setTintColor:v15];

  v16 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_MIN");
  v17 = +[CLKSimpleTextProvider textProviderWithText:v16];

  v18 = NTKExerciseNonGradientTextColor();
  [v17 setTintColor:v18];

  v19 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_HOUR");
  v20 = +[CLKSimpleTextProvider textProviderWithText:v19];

  double v21 = NTKStandNonGradientTextColor();
  [v20 setTintColor:v21];

  uint64_t v22 = +[CLKComplicationTemplateModularLargeColumns templateWithRow1Column1TextProvider:v12 row1Column2TextProvider:v10 row2Column1TextProvider:v17 row2Column2TextProvider:v9 row3Column1TextProvider:v20 row3Column2TextProvider:v8];

  return v22;
}

- (id)_largeUtilityTemplate
{
  switch([(NLActivityTimelineEntryModel *)self availabilityState])
  {
    case 0:
      double v3 = (char *)[(FIUIActivityDataModel *)self->_dataModel activityMoveMode];
      dataModel = self->_dataModel;
      if (v3 == (unsigned char *)&dword_0 + 2)
      {
        [(FIUIActivityDataModel *)dataModel appleMoveTimeTotal];
        if (v5 >= 0.0) {
          +[NSString localizedStringWithFormat:@"%ld", llround(v5)];
        }
        else {
        id v10 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
        }
        id v9 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_MIN");
        id v11 = [v10 stringByAppendingString:v9];
      }
      else
      {
        id v9 = [(FIUIActivityDataModel *)dataModel activeEnergyTotal];
        if (v9) {
          [(id)objc_opt_class() _LocalizedStringWithActiveEnergy:v9];
        }
        else {
        v12 = NLActivityComplicationLocalizedString(@"ACTIVITY_ENERGY_INVALID_DATA");
        }
        id v10 = +[FIUIActivityDataModel formattingManager];
        v13 = [v10 localizationKeyForEnergyBaseKey:@"ACTIVITY_TITLE_ENERGY"];
        v14 = NLActivityComplicationLocalizedString(v13);
        id v11 = [v12 stringByAppendingString:v14];
      }
      [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeTotal];
      if (v15 >= 0.0) {
        +[NSString localizedStringWithFormat:@"%ld", llround(v15)];
      }
      else {
      v16 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
      }
      v17 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_MIN");
      v18 = [v16 stringByAppendingString:v17];

      unint64_t v19 = (unint64_t)[(FIUIActivityDataModel *)self->_dataModel appleStandHoursTotal];
      v20 = +[NSString localizedStringWithFormat:@"%d", [(FIUIActivityDataModel *)self->_dataModel appleStandHoursGoal]];
      if ((v19 & 0x8000000000000000) != 0) {
        NLActivityComplicationLocalizedString(@"ACTIVITY_HOUR_INVALID_DATA");
      }
      else {
      double v21 = +[NSString localizedStringWithFormat:@"%d", v19];
      }
      uint64_t v22 = NTKFractionStringBasedOnCurrentLocaleNumberSystem();

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_7CAC;
      v28[3] = &unk_10650;
      id v29 = v11;
      id v30 = v18;
      id v31 = v22;
      id v23 = v22;
      id v24 = v18;
      id v25 = v11;
      double v6 = +[NTKOverrideTextProvider textProviderWithText:@"PLACEHOLDER" overrideBlock:v28];

      break;
    case 1:
      uint64_t v7 = @"ACTIVITY_LOADING_LONG_UTILITY";
      goto LABEL_9;
    case 2:
      uint64_t v7 = @"ACTIVITY_LOCKED_LONG_UTILITY";
      goto LABEL_9;
    case 3:
      uint64_t v7 = @"ACTIVITY_PROMPT_SETUP_LONG_UTILITY";
LABEL_9:
      id v8 = NLActivityComplicationLocalizedString(v7);
      double v6 = +[CLKSimpleTextProvider textProviderWithText:v8];

      break;
    default:
      double v6 = 0;
      break;
  }
  v26 = +[CLKComplicationTemplateUtilitarianLargeFlat templateWithTextProvider:v6];
  [v26 finalize];

  return v26;
}

- (id)_signatureCircularTemplate
{
  double v3 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v8 = @"NLActivityRichComplicationActivityTemplateKey";
  uint64_t v4 = [(NLActivityTimelineEntryModel *)self _activityTemplateWithFamily:10];
  id v9 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v3 setMetadata:v5];

  double v6 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v3];

  return v6;
}

- (id)_signatureExtraLargeTemplate
{
  double v3 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v8 = @"NLActivityRichComplicationActivityTemplateKey";
  uint64_t v4 = [(NLActivityTimelineEntryModel *)self _activityTemplateWithFamily:12];
  id v9 = v4;
  double v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v3 setMetadata:v5];

  double v6 = +[CLKComplicationTemplateGraphicExtraLargeCircularImage templateWithImageProvider:v3];

  return v6;
}

- (id)_signatureCornerTemplate
{
  switch([(NLActivityTimelineEntryModel *)self availabilityState])
  {
    case 0:
      double v3 = (char *)[(FIUIActivityDataModel *)self->_dataModel activityMoveMode];
      dataModel = self->_dataModel;
      if (v3 == (unsigned char *)&dword_0 + 2) {
        [(FIUIActivityDataModel *)dataModel appleMoveTimeCompletionPercentage];
      }
      else {
        [(FIUIActivityDataModel *)dataModel activeEnergyCompletionPercentage];
      }
      double v10 = v5;
      double v11 = ARUIRingPercentageValueNoRing;
      [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeCompletionPercentage];
      double v13 = v12;
      double v14 = ARUIRingPercentageValueNoRing;
      [(FIUIActivityDataModel *)self->_dataModel appleStandHourCompletionPercentage];
      double v16 = v15;
      float v17 = ARUIRingPercentageValueNoRing;
      v18 = sub_86D8();
      unint64_t v19 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
      v20 = v19;
      if (v10 == v11)
      {
        id v21 = v19;
      }
      else
      {
        if (v3 == (unsigned char *)&dword_0 + 2)
        {
          [(FIUIActivityDataModel *)self->_dataModel appleMoveTimeTotal];
          double v23 = v22;
        }
        else
        {
          id v24 = +[FIUIActivityDataModel formattingManager];
          id v25 = [v24 unitManager];
          v26 = [v25 userActiveEnergyBurnedUnit];

          v27 = [(FIUIActivityDataModel *)self->_dataModel activeEnergyTotal];
          [v27 doubleValueForUnit:v26];
          double v23 = floor(v28);
        }
        id v29 = +[NSNumber numberWithDouble:v23];
        id v21 = [v18 stringFromNumber:v29];
      }
      if (v13 == v14)
      {
        id v30 = v20;
      }
      else
      {
        [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeTotal];
        id v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v30 = [v18 stringFromNumber:v31];
      }
      v50 = v18;
      v51 = v20;
      if (v16 == v17)
      {
        id v32 = v20;
      }
      else
      {
        v33 = +[NSNumber numberWithDouble:(double)(uint64_t)[(FIUIActivityDataModel *)self->_dataModel appleStandHoursTotal]];
        id v32 = [v18 stringFromNumber:v33];
      }
      v34 = +[CLKSimpleTextProvider textProviderWithText:v21];
      v35 = NTKMoveNonGradientTextColor();
      [v34 setTintColor:v35];

      v36 = +[CLKSimpleTextProvider textProviderWithText:v30];
      v37 = NTKExerciseNonGradientTextColor();
      [v36 setTintColor:v37];

      v38 = +[CLKSimpleTextProvider textProviderWithText:v32];
      v39 = NTKStandNonGradientTextColor();
      [v38 setTintColor:v39];

      v40 = NLActivityComplicationLocalizedString(@"ACTIVITY_SIGNATURE_CORNER_SEPARATOR");
      NLActivityComplicationLocalizedString(@"ACTIVITY_SIGNATURE_CORNER_FORMAT_%@_%@_%@_%@_%@");
      v41 = v49 = v21;
      double v6 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v41, v34, v40, v36, v40, v38);
      +[UIColor systemGrayColor];
      v43 = v42 = v30;
      [v6 setTintColor:v43];

      CFStringRef v8 = v50;
      goto LABEL_23;
    case 1:
      uint64_t v7 = @"ACTIVITY_SIGNATURE_CORNER_LOADING";
      goto LABEL_7;
    case 2:
      uint64_t v7 = @"ACTIVITY_SIGNATURE_CORNER_LOCKED";
LABEL_7:
      CFStringRef v8 = NLActivityComplicationLocalizedString(v7);
      double v6 = +[CLKSimpleTextProvider textProviderWithText:v8];
      goto LABEL_23;
    case 3:
      CFStringRef v8 = NLActivityComplicationLocalizedString(@"ACTIVITY_SIGNATURE_CORNER_PROMPT_SETUP");
      id v9 = NLActivityComplicationLocalizedString(@"ACTIVITY_SIGNATURE_CORNER_PROMPT_SETUP_SHORT");
      double v6 = +[CLKSimpleTextProvider textProviderWithText:v8 shortText:v9];

LABEL_23:
      break;
    default:
      double v6 = 0;
      break;
  }
  v44 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v52 = @"NLActivityRichComplicationActivityTemplateKey";
  v45 = [(NLActivityTimelineEntryModel *)self _activityTemplateWithFamily:8];
  v53 = v45;
  v46 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  [v44 setMetadata:v46];

  v47 = +[CLKComplicationTemplateGraphicCornerTextImage templateWithTextProvider:v6 imageProvider:v44];

  return v47;
}

- (id)_signatureBezelTemplate
{
  switch([(NLActivityTimelineEntryModel *)self availabilityState])
  {
    case 0:
      double v3 = (char *)[(FIUIActivityDataModel *)self->_dataModel activityMoveMode];
      dataModel = self->_dataModel;
      if (v3 == (unsigned char *)&dword_0 + 2)
      {
        [(FIUIActivityDataModel *)dataModel appleMoveTimeTotal];
        if (v5 >= 0.0) {
          +[NSString localizedStringWithFormat:@"%ld", llround(v5)];
        }
        else {
        id v9 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
        }
        CFStringRef v8 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_MIN");
        double v10 = [v9 stringByAppendingString:v8];
      }
      else
      {
        CFStringRef v8 = [(FIUIActivityDataModel *)dataModel activeEnergyTotal];
        if (v8) {
          [(id)objc_opt_class() _LocalizedStringWithActiveEnergy:v8];
        }
        else {
        double v11 = NLActivityComplicationLocalizedString(@"ACTIVITY_ENERGY_INVALID_DATA");
        }
        id v9 = +[FIUIActivityDataModel formattingManager];
        double v12 = [v9 localizationKeyForEnergyBaseKey:@"ACTIVITY_TITLE_ENERGY"];
        double v13 = NLActivityComplicationLocalizedString(v12);
        double v10 = [v11 stringByAppendingString:v13];
      }
      [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeTotal];
      if (v14 >= 0.0) {
        +[NSString localizedStringWithFormat:@"%ld", llround(v14)];
      }
      else {
      double v15 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
      }
      double v16 = NLActivityComplicationLocalizedString(@"ACTIVITY_TITLE_MIN");
      float v17 = [v15 stringByAppendingString:v16];

      unint64_t v18 = (unint64_t)[(FIUIActivityDataModel *)self->_dataModel appleStandHoursTotal];
      unint64_t v19 = +[NSString localizedStringWithFormat:@"%d", [(FIUIActivityDataModel *)self->_dataModel appleStandHoursGoal]];
      if ((v18 & 0x8000000000000000) != 0) {
        NLActivityComplicationLocalizedString(@"ACTIVITY_HOUR_INVALID_DATA");
      }
      else {
      v20 = +[NSString localizedStringWithFormat:@"%d", v18];
      }
      id v21 = NTKFractionStringBasedOnCurrentLocaleNumberSystem();

      v34[0] = v10;
      v34[1] = v17;
      v34[2] = v21;
      double v22 = +[NSArray arrayWithObjects:v34 count:3];
      double v23 = NLActivityComplicationLocalizedString(@"ACTIVITY_LONG_ANALOG_SEPARATOR");
      id v24 = [v22 componentsJoinedByString:v23];
      double v6 = [v24 lowercaseString];

      break;
    case 1:
      uint64_t v7 = @"ACTIVITY_LOADING_LONG_UTILITY";
      goto LABEL_9;
    case 2:
      uint64_t v7 = @"ACTIVITY_LOCKED_LONG_UTILITY";
      goto LABEL_9;
    case 3:
      uint64_t v7 = @"ACTIVITY_PROMPT_SETUP_LONG_UTILITY";
LABEL_9:
      double v6 = NLActivityComplicationLocalizedString(v7);
      break;
    default:
      double v6 = 0;
      break;
  }
  id v25 = +[CLKSimpleTextProvider textProviderWithText:v6];
  v26 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  CFStringRef v32 = @"NLActivityRichComplicationActivityTemplateKey";
  v27 = [(NLActivityTimelineEntryModel *)self _activityTemplateWithFamily:9];
  v33 = v27;
  double v28 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v26 setMetadata:v28];

  id v29 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v26];
  id v30 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v29 textProvider:v25];

  return v30;
}

- (id)_signatureRectangleTemplate
{
  double v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&__NSArray0__struct forKeyedSubscript:@"NLActivityRichComplicationRectangularViewMoveChartData"];
  [v3 setObject:&__NSArray0__struct forKeyedSubscript:@"NLActivityRichComplicationRectangularViewExerciseChartData"];
  [v3 setObject:&__NSArray0__struct forKeyedSubscript:@"NLActivityRichComplicationRectangularViewStandChartData"];
  uint64_t v4 = +[UIColor colorWithRed:0.501960784 green:0.501960784 blue:0.501960784 alpha:1.0];
  switch([(NLActivityTimelineEntryModel *)self availabilityState])
  {
    case 0:
      v58 = v4;
      double v5 = NLActivityComplicationLocalizedString(@"ACTIVITY_SIGNATURE_RECTANGLE_ACTIVITY");
      uint64_t v6 = [v5 stringByAppendingString:@" "];

      uint64_t v7 = +[CLKSimpleTextProvider textProviderWithText:v6];
      CFStringRef v8 = +[UIColor whiteColor];
      [v7 setTintColor:v8];

      [v3 setObject:v7 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewActivityText"];
      v59 = sub_86D8();
      id v9 = (char *)[(FIUIActivityDataModel *)self->_dataModel activityMoveMode];
      double v10 = +[NSNumber numberWithInteger:v9];
      [v3 setObject:v10 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewActivityMoveMode"];

      dataModel = self->_dataModel;
      if (v9 == (unsigned char *)&dword_0 + 2)
      {
        [(FIUIActivityDataModel *)dataModel appleMoveTimeTotal];
        if (v12 < 0.0)
        {
          double v13 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
          uint64_t v14 = [v13 stringByAppendingString:@" "];
LABEL_16:

          v57 = (void *)v14;
          v27 = +[CLKSimpleTextProvider textProviderWithText:v14];
          double v28 = NTKMoveNonGradientTextColor();
          [v27 setTintColor:v28];

          v56 = v27;
          [v3 setObject:v27 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewMoveText"];
          [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeTotal];
          if (v29 >= 0.0)
          {
            id v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            CFStringRef v32 = [v59 stringFromNumber:v30];
            uint64_t v31 = [v32 stringByAppendingString:@" "];
          }
          else
          {
            id v30 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
            uint64_t v31 = [v30 stringByAppendingString:@" "];
          }

          v55 = (void *)v31;
          v33 = +[CLKSimpleTextProvider textProviderWithText:v31];
          v34 = NTKExerciseNonGradientTextColor();
          [v33 setTintColor:v34];

          [v3 setObject:v33 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewExerciseText"];
          uint64_t v35 = (uint64_t)[(FIUIActivityDataModel *)self->_dataModel appleStandHoursTotal];
          v54 = v33;
          if (v35 < 0)
          {
            v36 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
            v38 = [v36 stringByAppendingString:@" "];
          }
          else
          {
            v36 = +[NSNumber numberWithDouble:(double)v35];
            v37 = [v59 stringFromNumber:v36];
            v38 = [v37 stringByAppendingString:@" "];
          }
          v39 = +[CLKSimpleTextProvider textProviderWithText:v38];
          v40 = NTKStandNonGradientTextColor();
          [v39 setTintColor:v40];

          [v3 setObject:v39 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewSleepText"];
          v41 = +[NSNumber numberWithBool:[(FIUIActivityDataModel *)self->_dataModel wheelchairUser]];
          [v3 setObject:v41 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewWheelchairUseKey"];

          v42 = [(FIUIActivityDataModel *)self->_dataModel activeEnergyChartData];

          if (v42)
          {
            v43 = (char *)[(FIUIActivityDataModel *)self->_dataModel activityMoveMode];
            v44 = self->_dataModel;
            if (v43 == (unsigned char *)&dword_0 + 2) {
              [(FIUIActivityDataModel *)v44 appleMoveTimeChartData];
            }
            else {
            v45 = [(FIUIActivityDataModel *)v44 activeEnergyChartData];
            }
            [v3 setObject:v45 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewMoveChartData"];
          }
          v46 = [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeChartData];

          if (v46)
          {
            v47 = [(FIUIActivityDataModel *)self->_dataModel appleExerciseTimeChartData];
            [v3 setObject:v47 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewExerciseChartData"];
          }
          v48 = [(FIUIActivityDataModel *)self->_dataModel appleStandHourChartData];

          if (v48)
          {
            v49 = [(FIUIActivityDataModel *)self->_dataModel appleStandHourChartData];
            [v3 setObject:v49 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewStandChartData"];
          }
          uint64_t v15 = 0;
          unint64_t v18 = (void *)v6;
          uint64_t v4 = v58;
          goto LABEL_32;
        }
        double v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v26 = [v59 stringFromNumber:v13];
      }
      else
      {
        double v13 = [(FIUIActivityDataModel *)dataModel activeEnergyTotal];
        if (v13)
        {
          unint64_t v19 = +[FIUIActivityDataModel formattingManager];
          v20 = [v19 unitManager];
          id v21 = [v20 userActiveEnergyBurnedUnit];
          [v13 doubleValueForUnit:v21];
          double v23 = floor(v22);

          id v24 = +[NSNumber numberWithDouble:v23];
          id v25 = [v59 stringFromNumber:v24];
          uint64_t v14 = [v25 stringByAppendingString:@" "];

LABEL_15:
          goto LABEL_16;
        }
        v26 = NLActivityComplicationLocalizedString(@"ACTIVITY_MIN_INVALID_DATA");
      }
      id v24 = v26;
      uint64_t v14 = [v26 stringByAppendingString:@" "];
      goto LABEL_15;
    case 1:
      double v16 = @"ACTIVITY_SIGNATURE_RECTANGLE_ACTIVITY";
      goto LABEL_9;
    case 2:
      double v16 = @"ACTIVITY_SIGNATURE_RECTANGLE_LOCKED";
      goto LABEL_9;
    case 3:
      double v16 = @"ACTIVITY_SIGNATURE_RECTANGLE_SETUP";
LABEL_9:
      float v17 = NLActivityComplicationLocalizedString(v16);
      unint64_t v18 = [v17 stringByAppendingString:@" "];

      uint64_t v7 = +[CLKSimpleTextProvider textProviderWithText:v18];
      [v7 setTintColor:v4];
      [v3 setObject:v7 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewActivityText"];
      uint64_t v15 = 1;
LABEL_32:

      goto LABEL_33;
    default:
      uint64_t v15 = 1;
LABEL_33:
      v50 = +[NSNumber numberWithBool:v15];
      [v3 setObject:v50 forKeyedSubscript:@"NLActivityRichComplicationRectangularViewHideAccentViews"];

      v51 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
      [v51 setMetadata:v3];
      CFStringRef v52 = +[CLKComplicationTemplateGraphicRectangularFullImage templateWithImageProvider:v51];

      return v52;
  }
}

- (int64_t)availabilityState
{
  if ([(FIUIActivityDataModel *)self->_dataModel deviceLocked])
  {
    _HKInitializeLogging();
    double v3 = (void *)HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      double v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      int v21 = 138412290;
      double v22 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ device is locked", (uint8_t *)&v21, 0xCu);
    }
    return 2;
  }
  else if ([(FIUIActivityDataModel *)self->_dataModel databaseLoading])
  {
    _HKInitializeLogging();
    CFStringRef v8 = (void *)HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      int v21 = 138412290;
      double v22 = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ databse is loading", (uint8_t *)&v21, 0xCu);
    }
    return 1;
  }
  else
  {
    unsigned __int8 v12 = [(FIUIActivityDataModel *)self->_dataModel userHasDoneActivitySetup];
    _HKInitializeLogging();
    double v13 = (void *)HKLogActivity;
    BOOL v14 = os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        uint64_t v15 = v13;
        double v16 = (objc_class *)objc_opt_class();
        float v17 = NSStringFromClass(v16);
        int v21 = 138412290;
        double v22 = v17;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%@ Activity state is available", (uint8_t *)&v21, 0xCu);
      }
      return 0;
    }
    else
    {
      if (v14)
      {
        unint64_t v18 = v13;
        unint64_t v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        int v21 = 138412290;
        double v22 = v20;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%@ Activity is not setup yet", (uint8_t *)&v21, 0xCu);
      }
      return 3;
    }
  }
}

+ (id)_LocalizedStringWithActiveEnergy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[FIUIActivityDataModel formattingManager];
  double v5 = [v4 localizedStringWithActiveEnergy:v3];

  return v5;
}

- (void).cxx_destruct
{
}

@end