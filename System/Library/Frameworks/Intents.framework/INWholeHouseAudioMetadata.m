@interface INWholeHouseAudioMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INWholeHouseAudioMetadata)initWithCoder:(id)a3;
- (INWholeHouseAudioMetadata)initWithSpeakerNames:(id)a3 speakerRooms:(id)a4 permanentNames:(id)a5 intentSpeakerNames:(id)a6 intentSpeakerRooms:(id)a7 intentDestinationSpeakers:(id)a8 intentPermanentNames:(id)a9 spokenEntityTypes:(id)a10 spokenEntityNames:(id)a11 numberOfHomeAutomationWords:(id)a12 isAllSpeakers:(id)a13 isPauseOrStop:(id)a14 isWholeHouseAudioCommand:(id)a15 isInHere:(id)a16 hasExcept:(id)a17 isParticipatingSpeaker:(id)a18;
- (NSArray)intentDestinationSpeakers;
- (NSArray)intentPermanentNames;
- (NSArray)intentSpeakerNames;
- (NSArray)intentSpeakerRooms;
- (NSArray)permanentNames;
- (NSArray)speakerNames;
- (NSArray)speakerRooms;
- (NSArray)spokenEntityNames;
- (NSArray)spokenEntityTypes;
- (NSNumber)hasExcept;
- (NSNumber)isAllSpeakers;
- (NSNumber)isInHere;
- (NSNumber)isParticipatingSpeaker;
- (NSNumber)isPauseOrStop;
- (NSNumber)isWholeHouseAudioCommand;
- (NSNumber)numberOfHomeAutomationWords;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INWholeHouseAudioMetadata

- (BOOL)isEqual:(id)a3
{
  v4 = (INWholeHouseAudioMetadata *)a3;
  if (v4 == self)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      speakerNames = self->_speakerNames;
      if (speakerNames != v5->_speakerNames && !-[NSArray isEqual:](speakerNames, "isEqual:")) {
        goto LABEL_38;
      }
      speakerRooms = self->_speakerRooms;
      if (speakerRooms != v5->_speakerRooms && !-[NSArray isEqual:](speakerRooms, "isEqual:")) {
        goto LABEL_38;
      }
      permanentNames = self->_permanentNames;
      if (permanentNames != v5->_permanentNames && !-[NSArray isEqual:](permanentNames, "isEqual:")) {
        goto LABEL_38;
      }
      intentSpeakerNames = self->_intentSpeakerNames;
      if (intentSpeakerNames != v5->_intentSpeakerNames
        && !-[NSArray isEqual:](intentSpeakerNames, "isEqual:"))
      {
        goto LABEL_38;
      }
      intentSpeakerRooms = self->_intentSpeakerRooms;
      if (intentSpeakerRooms != v5->_intentSpeakerRooms
        && !-[NSArray isEqual:](intentSpeakerRooms, "isEqual:"))
      {
        goto LABEL_38;
      }
      intentDestinationSpeakers = self->_intentDestinationSpeakers;
      if (intentDestinationSpeakers != v5->_intentDestinationSpeakers
        && !-[NSArray isEqual:](intentDestinationSpeakers, "isEqual:"))
      {
        goto LABEL_38;
      }
      intentPermanentNames = self->_intentPermanentNames;
      if (intentPermanentNames != v5->_intentPermanentNames
        && !-[NSArray isEqual:](intentPermanentNames, "isEqual:"))
      {
        goto LABEL_38;
      }
      spokenEntityTypes = self->_spokenEntityTypes;
      if (spokenEntityTypes != v5->_spokenEntityTypes
        && !-[NSArray isEqual:](spokenEntityTypes, "isEqual:"))
      {
        goto LABEL_38;
      }
      spokenEntityNames = self->_spokenEntityNames;
      if (spokenEntityNames != v5->_spokenEntityNames
        && !-[NSArray isEqual:](spokenEntityNames, "isEqual:"))
      {
        goto LABEL_38;
      }
      if (((numberOfHomeAutomationWords = self->_numberOfHomeAutomationWords,
             numberOfHomeAutomationWords == v5->_numberOfHomeAutomationWords)
         || -[NSNumber isEqual:](numberOfHomeAutomationWords, "isEqual:"))
        && ((isAllSpeakers = self->_isAllSpeakers, isAllSpeakers == v5->_isAllSpeakers)
         || -[NSNumber isEqual:](isAllSpeakers, "isEqual:"))
        && ((isPauseOrStop = self->_isPauseOrStop, isPauseOrStop == v5->_isPauseOrStop)
         || -[NSNumber isEqual:](isPauseOrStop, "isEqual:"))
        && ((isWholeHouseAudioCommand = self->_isWholeHouseAudioCommand,
             isWholeHouseAudioCommand == v5->_isWholeHouseAudioCommand)
         || -[NSNumber isEqual:](isWholeHouseAudioCommand, "isEqual:"))
        && ((isInHere = self->_isInHere, isInHere == v5->_isInHere)
         || -[NSNumber isEqual:](isInHere, "isEqual:"))
        && ((hasExcept = self->_hasExcept, hasExcept == v5->_hasExcept)
         || -[NSNumber isEqual:](hasExcept, "isEqual:"))
        && ((isParticipatingSpeaker = self->_isParticipatingSpeaker,
             isParticipatingSpeaker == v5->_isParticipatingSpeaker)
         || -[NSNumber isEqual:](isParticipatingSpeaker, "isEqual:")))
      {
        BOOL v22 = 1;
      }
      else
      {
LABEL_38:
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_speakerNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"speakerNames");

  v9 = [v6 encodeObject:self->_speakerRooms];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"speakerRooms");

  v10 = [v6 encodeObject:self->_permanentNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"permanentNames");

  v11 = [v6 encodeObject:self->_intentSpeakerNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"intentSpeakerNames");

  v12 = [v6 encodeObject:self->_intentSpeakerRooms];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"intentSpeakerRooms");

  v13 = [v6 encodeObject:self->_intentDestinationSpeakers];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"intentDestinationSpeakers");

  v14 = [v6 encodeObject:self->_intentPermanentNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"intentPermanentNames");

  v15 = [v6 encodeObject:self->_spokenEntityTypes];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"spokenEntityTypes");

  v16 = [v6 encodeObject:self->_spokenEntityNames];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"spokenEntityNames");

  v17 = [v6 encodeObject:self->_numberOfHomeAutomationWords];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"numberOfHomeAutomationWords");

  v18 = [v6 encodeObject:self->_isAllSpeakers];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"isAllSpeakers");

  v19 = [v6 encodeObject:self->_isPauseOrStop];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"isPauseOrStop");

  v20 = [v6 encodeObject:self->_isWholeHouseAudioCommand];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, @"isWholeHouseAudioCommand");

  v21 = [v6 encodeObject:self->_isInHere];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, @"isInHere");

  BOOL v22 = [v6 encodeObject:self->_hasExcept];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, @"hasExcept");

  v23 = [v6 encodeObject:self->_isParticipatingSpeaker];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"isParticipatingSpeaker");

  return v7;
}

- (INWholeHouseAudioMetadata)initWithSpeakerNames:(id)a3 speakerRooms:(id)a4 permanentNames:(id)a5 intentSpeakerNames:(id)a6 intentSpeakerRooms:(id)a7 intentDestinationSpeakers:(id)a8 intentPermanentNames:(id)a9 spokenEntityTypes:(id)a10 spokenEntityNames:(id)a11 numberOfHomeAutomationWords:(id)a12 isAllSpeakers:(id)a13 isPauseOrStop:(id)a14 isWholeHouseAudioCommand:(id)a15 isInHere:(id)a16 hasExcept:(id)a17 isParticipatingSpeaker:(id)a18
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v75 = a6;
  id v74 = a7;
  id v73 = a8;
  id v72 = a9;
  v26 = v25;
  id v71 = a10;
  v27 = v24;
  id v70 = a11;
  id v69 = a12;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  id v32 = a17;
  id v33 = a18;
  v76.receiver = self;
  v76.super_class = (Class)INWholeHouseAudioMetadata;
  v34 = [(INWholeHouseAudioMetadata *)&v76 init];
  if (v34)
  {
    uint64_t v35 = [v23 copy];
    speakerNames = v34->_speakerNames;
    v34->_speakerNames = (NSArray *)v35;

    uint64_t v37 = [v27 copy];
    speakerRooms = v34->_speakerRooms;
    v34->_speakerRooms = (NSArray *)v37;

    uint64_t v39 = [v26 copy];
    permanentNames = v34->_permanentNames;
    v34->_permanentNames = (NSArray *)v39;

    uint64_t v41 = [v75 copy];
    intentSpeakerNames = v34->_intentSpeakerNames;
    v34->_intentSpeakerNames = (NSArray *)v41;

    uint64_t v43 = [v74 copy];
    intentSpeakerRooms = v34->_intentSpeakerRooms;
    v34->_intentSpeakerRooms = (NSArray *)v43;

    uint64_t v45 = [v73 copy];
    intentDestinationSpeakers = v34->_intentDestinationSpeakers;
    v34->_intentDestinationSpeakers = (NSArray *)v45;

    uint64_t v47 = [v72 copy];
    intentPermanentNames = v34->_intentPermanentNames;
    v34->_intentPermanentNames = (NSArray *)v47;

    uint64_t v49 = [v71 copy];
    spokenEntityTypes = v34->_spokenEntityTypes;
    v34->_spokenEntityTypes = (NSArray *)v49;

    uint64_t v51 = [v70 copy];
    spokenEntityNames = v34->_spokenEntityNames;
    v34->_spokenEntityNames = (NSArray *)v51;

    uint64_t v53 = [v69 copy];
    numberOfHomeAutomationWords = v34->_numberOfHomeAutomationWords;
    v34->_numberOfHomeAutomationWords = (NSNumber *)v53;

    uint64_t v55 = [v28 copy];
    isAllSpeakers = v34->_isAllSpeakers;
    v34->_isAllSpeakers = (NSNumber *)v55;

    uint64_t v57 = [v29 copy];
    isPauseOrStop = v34->_isPauseOrStop;
    v34->_isPauseOrStop = (NSNumber *)v57;

    uint64_t v59 = [v30 copy];
    isWholeHouseAudioCommand = v34->_isWholeHouseAudioCommand;
    v34->_isWholeHouseAudioCommand = (NSNumber *)v59;

    uint64_t v61 = [v31 copy];
    isInHere = v34->_isInHere;
    v34->_isInHere = (NSNumber *)v61;

    uint64_t v63 = [v32 copy];
    hasExcept = v34->_hasExcept;
    v34->_hasExcept = (NSNumber *)v63;

    uint64_t v65 = [v33 copy];
    isParticipatingSpeaker = v34->_isParticipatingSpeaker;
    v34->_isParticipatingSpeaker = (NSNumber *)v65;
  }
  return v34;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v41 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"speakerNames"];
    v44 = [v7 decodeObjectsOfClass:v9 from:v10];

    uint64_t v11 = objc_opt_class();
    v12 = [v8 objectForKeyedSubscript:@"speakerRooms"];
    uint64_t v45 = [v7 decodeObjectsOfClass:v11 from:v12];

    uint64_t v13 = objc_opt_class();
    v14 = [v8 objectForKeyedSubscript:@"permanentNames"];
    v40 = [v7 decodeObjectsOfClass:v13 from:v14];

    uint64_t v15 = objc_opt_class();
    v16 = [v8 objectForKeyedSubscript:@"intentSpeakerNames"];
    uint64_t v39 = [v7 decodeObjectsOfClass:v15 from:v16];

    uint64_t v17 = objc_opt_class();
    v18 = [v8 objectForKeyedSubscript:@"intentSpeakerRooms"];
    v38 = [v7 decodeObjectsOfClass:v17 from:v18];

    uint64_t v19 = objc_opt_class();
    v20 = [v8 objectForKeyedSubscript:@"intentDestinationSpeakers"];
    uint64_t v37 = [v7 decodeObjectsOfClass:v19 from:v20];

    uint64_t v21 = objc_opt_class();
    BOOL v22 = [v8 objectForKeyedSubscript:@"intentPermanentNames"];
    uint64_t v43 = [v7 decodeObjectsOfClass:v21 from:v22];

    uint64_t v23 = objc_opt_class();
    id v24 = [v8 objectForKeyedSubscript:@"spokenEntityTypes"];
    v42 = [v7 decodeObjectsOfClass:v23 from:v24];

    uint64_t v25 = objc_opt_class();
    v26 = [v8 objectForKeyedSubscript:@"spokenEntityNames"];
    v36 = [v7 decodeObjectsOfClass:v25 from:v26];

    uint64_t v35 = [v8 objectForKeyedSubscript:@"numberOfHomeAutomationWords"];
    v34 = [v8 objectForKeyedSubscript:@"isAllSpeakers"];
    id v33 = [v8 objectForKeyedSubscript:@"isPauseOrStop"];
    v27 = [v8 objectForKeyedSubscript:@"isWholeHouseAudioCommand"];
    id v28 = [v8 objectForKeyedSubscript:@"isInHere"];
    id v29 = [v8 objectForKeyedSubscript:@"hasExcept"];
    id v30 = [v8 objectForKeyedSubscript:@"isParticipatingSpeaker"];
    id v31 = objc_msgSend([v41 alloc], "initWithSpeakerNames:speakerRooms:permanentNames:intentSpeakerNames:intentSpeakerRooms:intentDestinationSpeakers:intentPermanentNames:spokenEntityTypes:spokenEntityNames:numberOfHomeAutomationWords:isAllSpeakers:isPauseOrStop:isWholeHouseAudioCommand:isInHere:hasExcept:isParticipatingSpeaker:", v44, v45, v40, v39, v38, v37, v43, v42, v36, v35, v34, v33, v27, v28, v29,
                    v30);
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isParticipatingSpeaker, 0);
  objc_storeStrong((id *)&self->_hasExcept, 0);
  objc_storeStrong((id *)&self->_isInHere, 0);
  objc_storeStrong((id *)&self->_isWholeHouseAudioCommand, 0);
  objc_storeStrong((id *)&self->_isPauseOrStop, 0);
  objc_storeStrong((id *)&self->_isAllSpeakers, 0);
  objc_storeStrong((id *)&self->_numberOfHomeAutomationWords, 0);
  objc_storeStrong((id *)&self->_spokenEntityNames, 0);
  objc_storeStrong((id *)&self->_spokenEntityTypes, 0);
  objc_storeStrong((id *)&self->_intentPermanentNames, 0);
  objc_storeStrong((id *)&self->_intentDestinationSpeakers, 0);
  objc_storeStrong((id *)&self->_intentSpeakerRooms, 0);
  objc_storeStrong((id *)&self->_intentSpeakerNames, 0);
  objc_storeStrong((id *)&self->_permanentNames, 0);
  objc_storeStrong((id *)&self->_speakerRooms, 0);

  objc_storeStrong((id *)&self->_speakerNames, 0);
}

- (NSNumber)isParticipatingSpeaker
{
  return self->_isParticipatingSpeaker;
}

- (NSNumber)hasExcept
{
  return self->_hasExcept;
}

- (NSNumber)isInHere
{
  return self->_isInHere;
}

- (NSNumber)isWholeHouseAudioCommand
{
  return self->_isWholeHouseAudioCommand;
}

- (NSNumber)isPauseOrStop
{
  return self->_isPauseOrStop;
}

- (NSNumber)isAllSpeakers
{
  return self->_isAllSpeakers;
}

- (NSNumber)numberOfHomeAutomationWords
{
  return self->_numberOfHomeAutomationWords;
}

- (NSArray)spokenEntityNames
{
  return self->_spokenEntityNames;
}

- (NSArray)spokenEntityTypes
{
  return self->_spokenEntityTypes;
}

- (NSArray)intentPermanentNames
{
  return self->_intentPermanentNames;
}

- (NSArray)intentDestinationSpeakers
{
  return self->_intentDestinationSpeakers;
}

- (NSArray)intentSpeakerRooms
{
  return self->_intentSpeakerRooms;
}

- (NSArray)intentSpeakerNames
{
  return self->_intentSpeakerNames;
}

- (NSArray)permanentNames
{
  return self->_permanentNames;
}

- (NSArray)speakerRooms
{
  return self->_speakerRooms;
}

- (NSArray)speakerNames
{
  return self->_speakerNames;
}

- (id)_dictionaryRepresentation
{
  v51[16] = *MEMORY[0x1E4F143B8];
  speakerNames = self->_speakerNames;
  uint64_t v3 = (uint64_t)speakerNames;
  v50[0] = @"speakerNames";
  if (!speakerNames)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[0] = v3;
  v50[1] = @"speakerRooms";
  uint64_t speakerRooms = (uint64_t)self->_speakerRooms;
  uint64_t v47 = speakerRooms;
  if (!speakerRooms)
  {
    uint64_t speakerRooms = [MEMORY[0x1E4F1CA98] null];
  }
  v51[1] = speakerRooms;
  v50[2] = @"permanentNames";
  uint64_t permanentNames = (uint64_t)self->_permanentNames;
  uint64_t v45 = permanentNames;
  if (!permanentNames)
  {
    uint64_t permanentNames = [MEMORY[0x1E4F1CA98] null];
  }
  v51[2] = permanentNames;
  v50[3] = @"intentSpeakerNames";
  uint64_t intentSpeakerNames = (uint64_t)self->_intentSpeakerNames;
  uint64_t v43 = intentSpeakerNames;
  if (!intentSpeakerNames)
  {
    uint64_t intentSpeakerNames = [MEMORY[0x1E4F1CA98] null];
  }
  v51[3] = intentSpeakerNames;
  v50[4] = @"intentSpeakerRooms";
  uint64_t intentSpeakerRooms = (uint64_t)self->_intentSpeakerRooms;
  uint64_t v41 = intentSpeakerRooms;
  if (!intentSpeakerRooms)
  {
    uint64_t intentSpeakerRooms = [MEMORY[0x1E4F1CA98] null];
  }
  v51[4] = intentSpeakerRooms;
  v50[5] = @"intentDestinationSpeakers";
  uint64_t intentDestinationSpeakers = (uint64_t)self->_intentDestinationSpeakers;
  uint64_t v39 = intentDestinationSpeakers;
  if (!intentDestinationSpeakers)
  {
    uint64_t intentDestinationSpeakers = [MEMORY[0x1E4F1CA98] null];
  }
  v51[5] = intentDestinationSpeakers;
  v50[6] = @"intentPermanentNames";
  uint64_t intentPermanentNames = (uint64_t)self->_intentPermanentNames;
  uint64_t v37 = intentPermanentNames;
  if (!intentPermanentNames)
  {
    uint64_t intentPermanentNames = [MEMORY[0x1E4F1CA98] null];
  }
  v51[6] = intentPermanentNames;
  v50[7] = @"spokenEntityTypes";
  uint64_t spokenEntityTypes = (uint64_t)self->_spokenEntityTypes;
  uint64_t v36 = spokenEntityTypes;
  if (!spokenEntityTypes)
  {
    uint64_t spokenEntityTypes = [MEMORY[0x1E4F1CA98] null];
  }
  v51[7] = spokenEntityTypes;
  v50[8] = @"spokenEntityNames";
  uint64_t spokenEntityNames = (uint64_t)self->_spokenEntityNames;
  uint64_t v34 = spokenEntityNames;
  if (!spokenEntityNames)
  {
    uint64_t spokenEntityNames = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)speakerRooms;
  v51[8] = spokenEntityNames;
  v50[9] = @"numberOfHomeAutomationWords";
  uint64_t numberOfHomeAutomationWords = (uint64_t)self->_numberOfHomeAutomationWords;
  uint64_t v32 = numberOfHomeAutomationWords;
  if (!numberOfHomeAutomationWords)
  {
    uint64_t numberOfHomeAutomationWords = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)permanentNames;
  id v30 = (void *)numberOfHomeAutomationWords;
  v51[9] = numberOfHomeAutomationWords;
  v50[10] = @"isAllSpeakers";
  isAllSpeakers = self->_isAllSpeakers;
  uint64_t v14 = (uint64_t)isAllSpeakers;
  if (!isAllSpeakers)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)intentSpeakerNames;
  v48 = (void *)v3;
  id v29 = (void *)v14;
  v51[10] = v14;
  v50[11] = @"isPauseOrStop";
  isPauseOrStop = self->_isPauseOrStop;
  uint64_t v16 = (uint64_t)isPauseOrStop;
  if (!isPauseOrStop)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v35 = (void *)spokenEntityTypes;
  v40 = (void *)intentSpeakerRooms;
  id v28 = (void *)v16;
  v51[11] = v16;
  v50[12] = @"isWholeHouseAudioCommand";
  isWholeHouseAudioCommand = self->_isWholeHouseAudioCommand;
  uint64_t v18 = (uint64_t)isWholeHouseAudioCommand;
  if (!isWholeHouseAudioCommand)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  id v33 = (void *)spokenEntityNames;
  v38 = (void *)intentDestinationSpeakers;
  v27 = (void *)v18;
  v51[12] = v18;
  v50[13] = @"isInHere";
  isInHere = self->_isInHere;
  v20 = isInHere;
  if (!isInHere)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = (void *)intentPermanentNames;
  v51[13] = v20;
  v50[14] = @"hasExcept";
  hasExcept = self->_hasExcept;
  uint64_t v23 = hasExcept;
  if (!hasExcept)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[14] = v23;
  v50[15] = @"isParticipatingSpeaker";
  isParticipatingSpeaker = self->_isParticipatingSpeaker;
  uint64_t v25 = isParticipatingSpeaker;
  if (!isParticipatingSpeaker)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v51[15] = v25;
  id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:16];
  if (isParticipatingSpeaker)
  {
    if (hasExcept) {
      goto LABEL_35;
    }
  }
  else
  {

    if (hasExcept) {
      goto LABEL_35;
    }
  }

LABEL_35:
  if (!isInHere) {

  }
  if (!isWholeHouseAudioCommand) {
  if (!isPauseOrStop)
  }

  if (!isAllSpeakers) {
  if (!v32)
  }

  if (!v34) {
  if (!v36)
  }

  if (!v37) {
  if (!v39)
  }

  if (!v41) {
  if (!v43)
  }

  if (!v45) {
  if (!v47)
  }

  if (!speakerNames) {

  }
  return v31;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INWholeHouseAudioMetadata;
  id v6 = [(INWholeHouseAudioMetadata *)&v11 description];
  id v7 = [(INWholeHouseAudioMetadata *)self _dictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INWholeHouseAudioMetadata *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  speakerNames = self->_speakerNames;
  id v5 = a3;
  [v5 encodeObject:speakerNames forKey:@"speakerNames"];
  [v5 encodeObject:self->_speakerRooms forKey:@"speakerRooms"];
  [v5 encodeObject:self->_permanentNames forKey:@"permanentNames"];
  [v5 encodeObject:self->_intentSpeakerNames forKey:@"intentSpeakerNames"];
  [v5 encodeObject:self->_intentSpeakerRooms forKey:@"intentSpeakerRooms"];
  [v5 encodeObject:self->_intentDestinationSpeakers forKey:@"intentDestinationSpeakers"];
  [v5 encodeObject:self->_intentPermanentNames forKey:@"intentPermanentNames"];
  [v5 encodeObject:self->_spokenEntityTypes forKey:@"spokenEntityTypes"];
  [v5 encodeObject:self->_spokenEntityNames forKey:@"spokenEntityNames"];
  [v5 encodeObject:self->_numberOfHomeAutomationWords forKey:@"numberOfHomeAutomationWords"];
  [v5 encodeObject:self->_isAllSpeakers forKey:@"isAllSpeakers"];
  [v5 encodeObject:self->_isPauseOrStop forKey:@"isPauseOrStop"];
  [v5 encodeObject:self->_isWholeHouseAudioCommand forKey:@"isWholeHouseAudioCommand"];
  [v5 encodeObject:self->_isInHere forKey:@"isInHere"];
  [v5 encodeObject:self->_hasExcept forKey:@"hasExcept"];
  [v5 encodeObject:self->_isParticipatingSpeaker forKey:@"isParticipatingSpeaker"];
}

- (INWholeHouseAudioMetadata)initWithCoder:(id)a3
{
  v58[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  id v6 = [v3 setWithArray:v5];
  uint64_t v49 = [v4 decodeObjectOfClasses:v6 forKey:@"speakerNames"];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  v48 = [v4 decodeObjectOfClasses:v9 forKey:@"speakerRooms"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v12 = [v10 setWithArray:v11];
  uint64_t v47 = [v4 decodeObjectOfClasses:v12 forKey:@"permanentNames"];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  uint64_t v15 = [v13 setWithArray:v14];
  v46 = [v4 decodeObjectOfClasses:v15 forKey:@"intentSpeakerNames"];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  uint64_t v18 = [v16 setWithArray:v17];
  uint64_t v45 = [v4 decodeObjectOfClasses:v18 forKey:@"intentSpeakerRooms"];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  uint64_t v21 = [v19 setWithArray:v20];
  v44 = [v4 decodeObjectOfClasses:v21 forKey:@"intentDestinationSpeakers"];

  BOOL v22 = (void *)MEMORY[0x1E4F1CAD0];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  id v24 = [v22 setWithArray:v23];
  uint64_t v41 = [v4 decodeObjectOfClasses:v24 forKey:@"intentPermanentNames"];

  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  v27 = [v25 setWithArray:v26];
  id v28 = [v4 decodeObjectOfClasses:v27 forKey:@"spokenEntityTypes"];

  id v29 = (void *)MEMORY[0x1E4F1CAD0];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  id v31 = [v29 setWithArray:v30];
  v40 = [v4 decodeObjectOfClasses:v31 forKey:@"spokenEntityNames"];

  uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfHomeAutomationWords"];
  v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAllSpeakers"];
  uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isPauseOrStop"];
  uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isWholeHouseAudioCommand"];
  id v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInHere"];
  uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasExcept"];
  uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isParticipatingSpeaker"];

  uint64_t v43 = -[INWholeHouseAudioMetadata initWithSpeakerNames:speakerRooms:permanentNames:intentSpeakerNames:intentSpeakerRooms:intentDestinationSpeakers:intentPermanentNames:spokenEntityTypes:spokenEntityNames:numberOfHomeAutomationWords:isAllSpeakers:isPauseOrStop:isWholeHouseAudioCommand:isInHere:hasExcept:isParticipatingSpeaker:](self, "initWithSpeakerNames:speakerRooms:permanentNames:intentSpeakerNames:intentSpeakerRooms:intentDestinationSpeakers:intentPermanentNames:spokenEntityTypes:spokenEntityNames:numberOfHomeAutomationWords:isAllSpeakers:isPauseOrStop:isWholeHouseAudioCommand:isInHere:hasExcept:isParticipatingSpeaker:", v49, v48, v47, v46, v45, v44, v41, v28, v40, v39, v38, v37, v32, v33, v34,
          v35);

  return v43;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_speakerNames hash];
  uint64_t v4 = [(NSArray *)self->_speakerRooms hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_permanentNames hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_intentSpeakerNames hash];
  uint64_t v7 = [(NSArray *)self->_intentSpeakerRooms hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_intentDestinationSpeakers hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_intentPermanentNames hash];
  uint64_t v10 = [(NSArray *)self->_spokenEntityTypes hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_spokenEntityNames hash];
  uint64_t v12 = v11 ^ [(NSNumber *)self->_numberOfHomeAutomationWords hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSNumber *)self->_isAllSpeakers hash];
  uint64_t v14 = [(NSNumber *)self->_isPauseOrStop hash];
  uint64_t v15 = v14 ^ [(NSNumber *)self->_isWholeHouseAudioCommand hash];
  uint64_t v16 = v15 ^ [(NSNumber *)self->_isInHere hash];
  uint64_t v17 = v16 ^ [(NSNumber *)self->_hasExcept hash];
  return v13 ^ v17 ^ [(NSNumber *)self->_isParticipatingSpeaker hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end