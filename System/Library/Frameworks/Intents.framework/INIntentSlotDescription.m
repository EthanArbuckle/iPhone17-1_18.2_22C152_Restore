@interface INIntentSlotDescription
- (BOOL)isEnum;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtended;
- (BOOL)isPrivate;
- (Class)resolutionResultClass;
- (INCodableAttribute)codableAttribute;
- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 isExtended:(BOOL)a7 isPrivate:(BOOL)a8 valueType:(int64_t)a9 valueStyle:(int64_t)a10 codableAttribute:(id)a11 defaultValueSelectorStrings:(id)a12 provideOptionsSelectorStrings:(id)a13 resolutionResultClass:(Class)a14 resolveSelectors:(SEL)a15;
- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 isExtended:(BOOL)a7 isPrivate:(BOOL)a8 valueType:(int64_t)a9 valueStyle:(int64_t)a10 defaultValueSelectorStrings:(id)a11 provideOptionsSelectorStrings:(id)a12 resolutionResultClass:(Class)a13 resolveSelectors:(SEL)a14;
- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 valueType:(int64_t)a7 valueStyle:(int64_t)a8 isExtended:(BOOL)a9 isPrivate:(BOOL)a10 resolveSelectors:(SEL)a11;
- (NSArray)defaultValueSelectorStrings;
- (NSArray)provideOptionsSelectorStrings;
- (NSArray)resolveSelectorStrings;
- (NSNumber)rank;
- (NSString)dataPropertyName;
- (NSString)facadePropertyName;
- (NSString)name;
- (SEL)deprecatedResolveSelector;
- (SEL)resolveSelector;
- (id)localizeValue:(id)a3 forLanguage:(id)a4;
- (id)localizeValue:(id)a3 withLocalizer:(id)a4;
- (id)valueForSlotComposer:(id)a3;
- (int64_t)valueStyle;
- (int64_t)valueType;
- (unint64_t)hash;
- (unint64_t)tag;
- (void)setRank:(id)a3;
- (void)setValue:(id)a3 forSlotComposer:(id)a4;
@end

@implementation INIntentSlotDescription

- (NSString)name
{
  return self->_name;
}

- (void)setRank:(id)a3
{
}

- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 isExtended:(BOOL)a7 isPrivate:(BOOL)a8 valueType:(int64_t)a9 valueStyle:(int64_t)a10 codableAttribute:(id)a11 defaultValueSelectorStrings:(id)a12 provideOptionsSelectorStrings:(id)a13 resolutionResultClass:(Class)a14 resolveSelectors:(SEL)a15
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  v47.receiver = self;
  v47.super_class = (Class)INIntentSlotDescription;
  v26 = [(INIntentSlotDescription *)&v47 init];
  if (v26)
  {
    id v44 = v23;
    v27 = a15;
    uint64_t v28 = [v20 copy];
    name = v26->_name;
    v26->_name = (NSString *)v28;

    v26->_tag = a4;
    uint64_t v30 = [v21 copy];
    facadePropertyName = v26->_facadePropertyName;
    v26->_facadePropertyName = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    dataPropertyName = v26->_dataPropertyName;
    v26->_dataPropertyName = (NSString *)v32;

    v26->_valueType = a9;
    v26->_valueStyle = a10;
    v26->_isExtended = a7;
    v26->_isPrivate = a8;
    objc_storeStrong((id *)&v26->_codableAttribute, a11);
    v34 = [MEMORY[0x1E4F1CA48] array];
    v46 = (const char **)&v48;
    if (a15)
    {
      do
      {
        v35 = NSStringFromSelector(v27);
        [v34 addObject:v35];

        v36 = v46++;
        v27 = *v36;
      }
      while (*v36);
    }
    uint64_t v37 = [v34 copy];
    resolveSelectorStrings = v26->_resolveSelectorStrings;
    v26->_resolveSelectorStrings = (NSArray *)v37;

    uint64_t v39 = [v25 copy];
    provideOptionsSelectorStrings = v26->_provideOptionsSelectorStrings;
    v26->_provideOptionsSelectorStrings = (NSArray *)v39;

    uint64_t v41 = [v24 copy];
    defaultValueSelectorStrings = v26->_defaultValueSelectorStrings;
    v26->_defaultValueSelectorStrings = (NSArray *)v41;

    objc_storeStrong((id *)&v26->_resolutionResultClass, a14);
    id v23 = v44;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
  objc_storeStrong((id *)&self->_defaultValueSelectorStrings, 0);
  objc_storeStrong((id *)&self->_provideOptionsSelectorStrings, 0);
  objc_storeStrong((id *)&self->_resolveSelectorStrings, 0);
  objc_storeStrong((id *)&self->_dataPropertyName, 0);
  objc_storeStrong((id *)&self->_facadePropertyName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_resolutionResultClass, 0);
}

- (NSString)facadePropertyName
{
  return self->_facadePropertyName;
}

- (BOOL)isEnum
{
  uint64_t v3 = [(INIntentSlotDescription *)self valueType];
  char isKindOfClass = 1;
  if (v3 > 171)
  {
    if (((unint64_t)(v3 - 172) > 0x1F || ((1 << (v3 + 84)) & 0x800D1A61) == 0)
      && ((unint64_t)(v3 - 234) > 7 || ((1 << (v3 + 22)) & 0x87) == 0))
    {
LABEL_10:
      v6 = [(INIntentSlotDescription *)self codableAttribute];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    switch(v3)
    {
      case 57:
      case 58:
      case 63:
      case 64:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 84:
      case 85:
      case 88:
      case 90:
      case 91:
      case 95:
      case 96:
      case 97:
      case 98:
      case 114:
      case 115:
      case 116:
      case 118:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 136:
      case 140:
      case 141:
      case 143:
      case 149:
      case 155:
      case 156:
      case 158:
      case 161:
        return isKindOfClass & 1;
      case 59:
      case 60:
      case 61:
      case 62:
      case 65:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 86:
      case 87:
      case 89:
      case 92:
      case 93:
      case 94:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 117:
      case 119:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 137:
      case 138:
      case 139:
      case 142:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 157:
      case 159:
      case 160:
        goto LABEL_10;
      default:
        if (v3 != 1) {
          goto LABEL_10;
        }
        break;
    }
  }
  return isKindOfClass & 1;
}

- (id)localizeValue:(id)a3 withLocalizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(INIntentSlotDescription *)self valueType];
  if (v8 > 171)
  {
    switch(v8)
    {
      case 172:
        uint64_t v9 = INWellnessObjectTypeGetLocalizedName([v6 integerValue], v7);
        break;
      case 173:
      case 174:
      case 175:
      case 176:
      case 179:
      case 180:
      case 182:
      case 185:
      case 186:
      case 187:
      case 189:
LABEL_15:
        uint64_t v9 = objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v7);
        break;
      case 177:
        uint64_t v9 = INWellnessQuestionTypeGetLocalizedName([v6 integerValue], v7);
        break;
      case 178:
        uint64_t v9 = INWellnessQueryResultTypeGetLocalizedName([v6 integerValue], v7);
        break;
      case 181:
        id v22 = INAlarmRepeatScheduleOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
LABEL_62:
        id v12 = v22;
        id v23 = objc_msgSend(v22, "_intents_readableTitleWithLocalizer:", v7);
        goto LABEL_63;
      case 183:
        uint64_t v9 = INUpdateAlarmOperationGetLocalizedName([v6 integerValue], v7);
        break;
      case 184:
        uint64_t v9 = INChangeAlarmStatusOperationGetLocalizedName([v6 integerValue], v7);
        break;
      case 188:
        uint64_t v9 = INAlarmSearchTypeGetLocalizedName([v6 integerValue], v7);
        break;
      case 190:
        uint64_t v9 = INTimerStateGetLocalizedName([v6 integerValue], v7);
        break;
      case 191:
        uint64_t v9 = INTimerTypeGetLocalizedName([v6 integerValue], v7);
        break;
      default:
        switch(v8)
        {
          case 234:
            uint64_t v9 = INBinarySettingValueGetLocalizedName([v6 integerValue], v7);
            break;
          case 235:
            uint64_t v9 = INBoundedSettingValueGetLocalizedName([v6 integerValue], v7);
            break;
          case 236:
            uint64_t v9 = INSettingActionGetLocalizedName([v6 integerValue], v7);
            break;
          case 237:
          case 238:
          case 239:
          case 240:
            goto LABEL_15;
          case 241:
            uint64_t v9 = INEventAttributeGetLocalizedName([v6 integerValue], v7);
            break;
          default:
            if (v8 != 203) {
              goto LABEL_15;
            }
            uint64_t v9 = INDeviceIdiomGetLocalizedName([v6 integerValue], v7);
            break;
        }
        break;
    }
LABEL_72:
    id v23 = (void *)v9;
  }
  else
  {
    switch(v8)
    {
      case 57:
        uint64_t v9 = INBillTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 58:
        uint64_t v9 = INPaymentStatusGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 59:
      case 60:
      case 61:
      case 62:
      case 65:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 86:
      case 87:
      case 89:
      case 92:
      case 93:
      case 94:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 117:
      case 119:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 137:
      case 138:
      case 139:
      case 142:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 157:
      case 159:
      case 160:
        goto LABEL_15;
      case 63:
        uint64_t v9 = INAccountTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 64:
        uint64_t v9 = INBalanceTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 66:
        uint64_t v9 = INAudioCallTTYTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 67:
        uint64_t v9 = INCallAudioRouteGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 68:
        id v22 = INCallCapabilityOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
        goto LABEL_62;
      case 69:
        uint64_t v9 = INCallCapabilityGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 70:
        uint64_t v9 = INCallDestinationTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 71:
        uint64_t v9 = INCallRecordTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 72:
        id v22 = INCallRecordTypeOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
        goto LABEL_62;
      case 73:
        uint64_t v9 = INPreferredCallProviderGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 84:
        uint64_t v9 = INMessageAttributeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 85:
        id v22 = INMessageAttributeOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
        goto LABEL_62;
      case 88:
        uint64_t v9 = INMessageEffectTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 90:
        uint64_t v9 = INOutgoingMessageTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 91:
        uint64_t v9 = INMessageSoundTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 95:
        uint64_t v9 = INAnnouncementSoundTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 96:
        uint64_t v9 = INReadActionTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 97:
        uint64_t v9 = INUserNotificationTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 98:
        id v22 = INPhotoAttributeOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
        goto LABEL_62;
      case 114:
        uint64_t v9 = INVisualCodeTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 115:
        uint64_t v9 = INWorkoutGoalUnitTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 116:
        uint64_t v9 = INWorkoutLocationTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 118:
        uint64_t v9 = INWorkoutSequenceLabelGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 120:
        uint64_t v9 = INCarAirCirculationModeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 121:
        uint64_t v9 = INCarAudioSourceGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 122:
        uint64_t v9 = INCarDefrosterGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 123:
        uint64_t v9 = INCarSeatGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 124:
        uint64_t v9 = INRelativeReferenceGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 125:
        uint64_t v9 = INRelativeSettingGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 126:
        uint64_t v9 = INDateSearchTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 127:
        uint64_t v9 = INLocationSearchTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 128:
        uint64_t v9 = INTaskStatusGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 129:
        uint64_t v9 = INNotebookItemTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 136:
        uint64_t v9 = INTaskReferenceGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 140:
        id v22 = INTemporalEventTriggerTypeOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
        goto LABEL_62;
      case 141:
        uint64_t v9 = INTaskPriorityGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 143:
        id v22 = INCarSignalOptionsGetLocalizedNames([v6 unsignedIntegerValue], v7);
        goto LABEL_62;
      case 149:
        uint64_t v9 = INRadioTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 155:
        uint64_t v9 = INPlaybackRepeatModeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 156:
        uint64_t v9 = INPlaybackQueueLocationGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 158:
        uint64_t v9 = INMediaAffinityTypeGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      case 161:
        uint64_t v9 = INParsecCategoryGetLocalizedName([v6 integerValue], v7);
        goto LABEL_72;
      default:
        if (v8 != 3) {
          goto LABEL_15;
        }
        v10 = [(INIntentSlotDescription *)self name];
        int v11 = [v10 isEqualToString:@"duration"];

        if (!v11) {
          goto LABEL_15;
        }
        id v12 = objc_alloc_init(MEMORY[0x1E4F28C00]);
        v13 = [v7 languageCode];
        if (v13)
        {
          v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          v16 = [v14 locale];
          CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v15, (CFLocaleIdentifier)[v16 localeIdentifier]);

          v18 = CFDictionaryGetValue(ComponentsFromLocaleIdentifier, @"numbers");
          CFRelease(ComponentsFromLocaleIdentifier);
          v19 = (void *)MEMORY[0x1E4F1CA20];
          if (v18)
          {
            id v20 = [NSString stringWithFormat:@"%@@numbers=%@", v13, v18];
            id v21 = [v19 localeWithLocaleIdentifier:v20];
            [v14 setLocale:v21];
          }
          else
          {
            id v20 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
            [v14 setLocale:v20];
          }

          [v12 setCalendar:v14];
        }
        [v12 setUnitsStyle:3];
        [v12 setAllowedUnits:224];
        [v6 doubleValue];
        id v23 = objc_msgSend(v12, "stringFromTimeInterval:");

        break;
    }
LABEL_63:
  }

  return v23;
}

- (id)localizeValue:(id)a3 forLanguage:(id)a4
{
  id v6 = a3;
  id v7 = +[INStringLocalizer localizerForLanguage:a4];
  uint64_t v8 = [(INIntentSlotDescription *)self localizeValue:v6 withLocalizer:v7];

  return v8;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (NSArray)defaultValueSelectorStrings
{
  return self->_defaultValueSelectorStrings;
}

- (NSArray)provideOptionsSelectorStrings
{
  return self->_provideOptionsSelectorStrings;
}

- (NSArray)resolveSelectorStrings
{
  return self->_resolveSelectorStrings;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)isExtended
{
  return self->_isExtended;
}

- (int64_t)valueStyle
{
  return self->_valueStyle;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (NSString)dataPropertyName
{
  return self->_dataPropertyName;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NSArray **)v4;
    name = self->_name;
    BOOL v10 = 0;
    if ((name == (NSString *)v5[3] || -[NSString isEqualToString:](name, "isEqualToString:"))
      && (NSArray *)self->_tag == v5[4])
    {
      facadePropertyName = self->_facadePropertyName;
      if (facadePropertyName == (NSString *)v5[5]
        || -[NSString isEqualToString:](facadePropertyName, "isEqualToString:"))
      {
        dataPropertyName = self->_dataPropertyName;
        if ((dataPropertyName == (NSString *)v5[6] || -[NSString isEqualToString:](dataPropertyName, "isEqualToString:"))&& (NSArray *)self->_valueType == v5[7]&& (NSArray *)self->_valueStyle == v5[8]&& self->_isExtended == *((unsigned __int8 *)v5 + 8)&& self->_isPrivate == *((unsigned __int8 *)v5 + 9))
        {
          resolveSelectorStrings = self->_resolveSelectorStrings;
          if (resolveSelectorStrings == v5[9] || -[NSArray isEqualToArray:](resolveSelectorStrings, "isEqualToArray:")) {
            BOOL v10 = 1;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_tag ^ [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_facadePropertyName hash];
  NSUInteger v5 = v3 ^ v4 ^ [(NSString *)self->_dataPropertyName hash] ^ self->_valueType ^ self->_valueStyle ^ self->_isExtended ^ self->_isPrivate;
  return v5 ^ [(NSArray *)self->_resolveSelectorStrings hash];
}

- (Class)resolutionResultClass
{
  resolutionResultClass = self->_resolutionResultClass;
  if (!resolutionResultClass) {
    resolutionResultClass = objc_opt_class();
  }

  return (Class)resolutionResultClass;
}

- (SEL)deprecatedResolveSelector
{
  unint64_t v3 = [(INIntentSlotDescription *)self resolveSelectorStrings];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  NSUInteger v5 = [(INIntentSlotDescription *)self resolveSelectorStrings];
  id v6 = [(INIntentSlotDescription *)self resolveSelectorStrings];
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "count") - 1);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = NSSelectorFromString(v7);

  return v8;
}

- (SEL)resolveSelector
{
  unint64_t v3 = [(INIntentSlotDescription *)self resolveSelectorStrings];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  NSUInteger v5 = [(INIntentSlotDescription *)self resolveSelectorStrings];
  id v6 = [v5 objectAtIndex:0];
  id v7 = NSSelectorFromString(v6);

  return v7;
}

- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 isExtended:(BOOL)a7 isPrivate:(BOOL)a8 valueType:(int64_t)a9 valueStyle:(int64_t)a10 defaultValueSelectorStrings:(id)a11 provideOptionsSelectorStrings:(id)a12 resolutionResultClass:(Class)a13 resolveSelectors:(SEL)a14
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a11;
  id v24 = a12;
  v45.receiver = self;
  v45.super_class = (Class)INIntentSlotDescription;
  id v25 = [(INIntentSlotDescription *)&v45 init];
  if (v25)
  {
    v26 = a14;
    id v43 = v20;
    uint64_t v27 = [v20 copy];
    name = v25->_name;
    v25->_name = (NSString *)v27;

    v25->_tag = a4;
    uint64_t v29 = [v21 copy];
    facadePropertyName = v25->_facadePropertyName;
    v25->_facadePropertyName = (NSString *)v29;

    uint64_t v31 = [v22 copy];
    dataPropertyName = v25->_dataPropertyName;
    v25->_dataPropertyName = (NSString *)v31;

    v25->_valueType = a9;
    v25->_valueStyle = a10;
    v25->_isExtended = a7;
    v25->_isPrivate = a8;
    v33 = [MEMORY[0x1E4F1CA48] array];
    id v44 = (const char **)&v46;
    if (a14)
    {
      do
      {
        v34 = NSStringFromSelector(v26);
        [(NSArray *)v33 addObject:v34];

        v35 = v44++;
        v26 = *v35;
      }
      while (*v35);
    }
    resolveSelectorStrings = v25->_resolveSelectorStrings;
    v25->_resolveSelectorStrings = v33;
    uint64_t v37 = v33;

    objc_storeStrong((id *)&v25->_resolutionResultClass, a13);
    uint64_t v38 = [v24 copy];
    provideOptionsSelectorStrings = v25->_provideOptionsSelectorStrings;
    v25->_provideOptionsSelectorStrings = (NSArray *)v38;

    uint64_t v40 = [v23 copy];
    defaultValueSelectorStrings = v25->_defaultValueSelectorStrings;
    v25->_defaultValueSelectorStrings = (NSArray *)v40;

    id v20 = v43;
  }

  return v25;
}

- (INIntentSlotDescription)initWithName:(id)a3 tag:(unint64_t)a4 facadePropertyName:(id)a5 dataPropertyName:(id)a6 valueType:(int64_t)a7 valueStyle:(int64_t)a8 isExtended:(BOOL)a9 isPrivate:(BOOL)a10 resolveSelectors:(SEL)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  v34.receiver = self;
  v34.super_class = (Class)INIntentSlotDescription;
  id v20 = [(INIntentSlotDescription *)&v34 init];
  if (v20)
  {
    id v21 = a11;
    uint64_t v22 = [v17 copy];
    name = v20->_name;
    v20->_name = (NSString *)v22;

    v20->_tag = a4;
    uint64_t v24 = [v18 copy];
    facadePropertyName = v20->_facadePropertyName;
    v20->_facadePropertyName = (NSString *)v24;

    uint64_t v26 = [v19 copy];
    dataPropertyName = v20->_dataPropertyName;
    v20->_dataPropertyName = (NSString *)v26;

    v20->_valueType = a7;
    v20->_valueStyle = a8;
    v20->_isExtended = a9;
    v20->_isPrivate = a10;
    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    v33 = (const char **)&v35;
    if (a11)
    {
      do
      {
        uint64_t v29 = NSStringFromSelector(v21);
        [(NSArray *)v28 addObject:v29];

        uint64_t v30 = v33++;
        id v21 = *v30;
      }
      while (*v30);
    }
    resolveSelectorStrings = v20->_resolveSelectorStrings;
    v20->_resolveSelectorStrings = v28;
  }
  return v20;
}

- (void)setValue:(id)a3 forSlotComposer:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 intentSlotDescriptions];
  int v8 = [v7 containsObject:self];

  if (v8)
  {
    uint64_t v9 = [(INIntentSlotDescription *)self facadePropertyName];
    [v6 setValue:v10 forKey:v9];
  }
}

- (id)valueForSlotComposer:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 intentSlotDescriptions];
  int v6 = [v5 containsObject:self];

  if (v6)
  {
    id v7 = [(INIntentSlotDescription *)self facadePropertyName];
    int v8 = [v4 valueForKey:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

@end