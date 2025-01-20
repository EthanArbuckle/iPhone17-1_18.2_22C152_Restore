@interface _INPBWholeHouseAudioMetadata
+ (BOOL)supportsSecureCoding;
+ (Class)intentDestinationSpeakersType;
+ (Class)intentPermanentNamesType;
+ (Class)intentSpeakerNamesType;
+ (Class)intentSpeakerRoomsType;
+ (Class)permanentNamesType;
+ (Class)speakerNamesType;
+ (Class)speakerRoomsType;
+ (Class)spokenEntityNameType;
+ (Class)spokenEntityTypeType;
- (BOOL)hasExcept;
- (BOOL)hasHasExcept;
- (BOOL)hasIsAllSpeakers;
- (BOOL)hasIsInHere;
- (BOOL)hasIsParticipatingSpeaker;
- (BOOL)hasIsPauseOrStop;
- (BOOL)hasIsWholeHouseAudioCommand;
- (BOOL)hasNumberOfHomeAutomationWords;
- (BOOL)isAllSpeakers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInHere;
- (BOOL)isParticipatingSpeaker;
- (BOOL)isPauseOrStop;
- (BOOL)isWholeHouseAudioCommand;
- (BOOL)readFrom:(id)a3;
- (NSArray)intentDestinationSpeakers;
- (NSArray)intentPermanentNames;
- (NSArray)intentSpeakerNames;
- (NSArray)intentSpeakerRooms;
- (NSArray)permanentNames;
- (NSArray)speakerNames;
- (NSArray)speakerRooms;
- (NSArray)spokenEntityNames;
- (NSArray)spokenEntityTypes;
- (_INPBWholeHouseAudioMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentDestinationSpeakersAtIndex:(unint64_t)a3;
- (id)intentPermanentNamesAtIndex:(unint64_t)a3;
- (id)intentSpeakerNamesAtIndex:(unint64_t)a3;
- (id)intentSpeakerRoomsAtIndex:(unint64_t)a3;
- (id)permanentNamesAtIndex:(unint64_t)a3;
- (id)speakerNamesAtIndex:(unint64_t)a3;
- (id)speakerRoomsAtIndex:(unint64_t)a3;
- (id)spokenEntityNameAtIndex:(unint64_t)a3;
- (id)spokenEntityTypeAtIndex:(unint64_t)a3;
- (int)numberOfHomeAutomationWords;
- (unint64_t)hash;
- (unint64_t)intentDestinationSpeakersCount;
- (unint64_t)intentPermanentNamesCount;
- (unint64_t)intentSpeakerNamesCount;
- (unint64_t)intentSpeakerRoomsCount;
- (unint64_t)permanentNamesCount;
- (unint64_t)speakerNamesCount;
- (unint64_t)speakerRoomsCount;
- (unint64_t)spokenEntityNamesCount;
- (unint64_t)spokenEntityTypesCount;
- (void)addIntentDestinationSpeakers:(id)a3;
- (void)addIntentPermanentNames:(id)a3;
- (void)addIntentSpeakerNames:(id)a3;
- (void)addIntentSpeakerRooms:(id)a3;
- (void)addPermanentNames:(id)a3;
- (void)addSpeakerNames:(id)a3;
- (void)addSpeakerRooms:(id)a3;
- (void)addSpokenEntityName:(id)a3;
- (void)addSpokenEntityType:(id)a3;
- (void)clearIntentDestinationSpeakers;
- (void)clearIntentPermanentNames;
- (void)clearIntentSpeakerNames;
- (void)clearIntentSpeakerRooms;
- (void)clearPermanentNames;
- (void)clearSpeakerNames;
- (void)clearSpeakerRooms;
- (void)clearSpokenEntityNames;
- (void)clearSpokenEntityTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setHasExcept:(BOOL)a3;
- (void)setHasHasExcept:(BOOL)a3;
- (void)setHasIsAllSpeakers:(BOOL)a3;
- (void)setHasIsInHere:(BOOL)a3;
- (void)setHasIsParticipatingSpeaker:(BOOL)a3;
- (void)setHasIsPauseOrStop:(BOOL)a3;
- (void)setHasIsWholeHouseAudioCommand:(BOOL)a3;
- (void)setHasNumberOfHomeAutomationWords:(BOOL)a3;
- (void)setIntentDestinationSpeakers:(id)a3;
- (void)setIntentPermanentNames:(id)a3;
- (void)setIntentSpeakerNames:(id)a3;
- (void)setIntentSpeakerRooms:(id)a3;
- (void)setIsAllSpeakers:(BOOL)a3;
- (void)setIsInHere:(BOOL)a3;
- (void)setIsParticipatingSpeaker:(BOOL)a3;
- (void)setIsPauseOrStop:(BOOL)a3;
- (void)setIsWholeHouseAudioCommand:(BOOL)a3;
- (void)setNumberOfHomeAutomationWords:(int)a3;
- (void)setPermanentNames:(id)a3;
- (void)setSpeakerNames:(id)a3;
- (void)setSpeakerRooms:(id)a3;
- (void)setSpokenEntityNames:(id)a3;
- (void)setSpokenEntityTypes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWholeHouseAudioMetadata

- (void)addSpokenEntityName:(id)a3
{
  id v4 = a3;
  spokenEntityNames = self->_spokenEntityNames;
  id v8 = v4;
  if (!spokenEntityNames)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_spokenEntityNames;
    self->_spokenEntityNames = v6;

    id v4 = v8;
    spokenEntityNames = self->_spokenEntityNames;
  }
  [(NSArray *)spokenEntityNames addObject:v4];
}

- (id)dictionaryRepresentation
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBWholeHouseAudioMetadata *)self hasHasExcept])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBWholeHouseAudioMetadata hasExcept](self, "hasExcept"));
    [v3 setObject:v4 forKeyedSubscript:@"hasExcept"];
  }
  if ([(NSArray *)self->_intentDestinationSpeakers count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v6 = self->_intentDestinationSpeakers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v108 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v107 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v107 objects:v119 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"intentDestinationSpeakers"];
  }
  if ([(NSArray *)self->_intentPermanentNames count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v13 = self->_intentPermanentNames;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v103 objects:v118 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v104 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v103 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v103 objects:v118 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"intentPermanentNames"];
  }
  if ([(NSArray *)self->_intentSpeakerNames count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v20 = self->_intentSpeakerNames;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v99 objects:v117 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v100;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v100 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v99 + 1) + 8 * k) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v99 objects:v117 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"intentSpeakerNames"];
  }
  if ([(NSArray *)self->_intentSpeakerRooms count])
  {
    v26 = [MEMORY[0x1E4F1CA48] array];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v27 = self->_intentSpeakerRooms;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v95 objects:v116 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v96;
      do
      {
        for (uint64_t m = 0; m != v29; ++m)
        {
          if (*(void *)v96 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [*(id *)(*((void *)&v95 + 1) + 8 * m) dictionaryRepresentation];
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v95 objects:v116 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKeyedSubscript:@"intentSpeakerRooms"];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsAllSpeakers])
  {
    v33 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBWholeHouseAudioMetadata isAllSpeakers](self, "isAllSpeakers"));
    [v3 setObject:v33 forKeyedSubscript:@"isAllSpeakers"];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsInHere])
  {
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBWholeHouseAudioMetadata isInHere](self, "isInHere"));
    [v3 setObject:v34 forKeyedSubscript:@"isInHere"];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsParticipatingSpeaker])
  {
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBWholeHouseAudioMetadata isParticipatingSpeaker](self, "isParticipatingSpeaker"));
    [v3 setObject:v35 forKeyedSubscript:@"isParticipatingSpeaker"];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsPauseOrStop])
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBWholeHouseAudioMetadata isPauseOrStop](self, "isPauseOrStop"));
    [v3 setObject:v36 forKeyedSubscript:@"isPauseOrStop"];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsWholeHouseAudioCommand])
  {
    v37 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBWholeHouseAudioMetadata isWholeHouseAudioCommand](self, "isWholeHouseAudioCommand"));
    [v3 setObject:v37 forKeyedSubscript:@"isWholeHouseAudioCommand"];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasNumberOfHomeAutomationWords])
  {
    v38 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBWholeHouseAudioMetadata numberOfHomeAutomationWords](self, "numberOfHomeAutomationWords"));
    [v3 setObject:v38 forKeyedSubscript:@"numberOfHomeAutomationWords"];
  }
  if ([(NSArray *)self->_permanentNames count])
  {
    v39 = [MEMORY[0x1E4F1CA48] array];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v40 = self->_permanentNames;
    uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v91 objects:v115 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v92;
      do
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          if (*(void *)v92 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v91 + 1) + 8 * n) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v91 objects:v115 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKeyedSubscript:@"permanentNames"];
  }
  if ([(NSArray *)self->_speakerNames count])
  {
    v46 = [MEMORY[0x1E4F1CA48] array];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v47 = self->_speakerNames;
    uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v87 objects:v114 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v88;
      do
      {
        for (iuint64_t i = 0; ii != v49; ++ii)
        {
          if (*(void *)v88 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v87 + 1) + 8 * ii) dictionaryRepresentation];
          [v46 addObject:v52];
        }
        uint64_t v49 = [(NSArray *)v47 countByEnumeratingWithState:&v87 objects:v114 count:16];
      }
      while (v49);
    }

    [v3 setObject:v46 forKeyedSubscript:@"speakerNames"];
  }
  if ([(NSArray *)self->_speakerRooms count])
  {
    v53 = [MEMORY[0x1E4F1CA48] array];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v54 = self->_speakerRooms;
    uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v83 objects:v113 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v84;
      do
      {
        for (juint64_t j = 0; jj != v56; ++jj)
        {
          if (*(void *)v84 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = [*(id *)(*((void *)&v83 + 1) + 8 * jj) dictionaryRepresentation];
          [v53 addObject:v59];
        }
        uint64_t v56 = [(NSArray *)v54 countByEnumeratingWithState:&v83 objects:v113 count:16];
      }
      while (v56);
    }

    [v3 setObject:v53 forKeyedSubscript:@"speakerRooms"];
  }
  if ([(NSArray *)self->_spokenEntityNames count])
  {
    v60 = [MEMORY[0x1E4F1CA48] array];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v61 = self->_spokenEntityNames;
    uint64_t v62 = [(NSArray *)v61 countByEnumeratingWithState:&v79 objects:v112 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v80;
      do
      {
        for (kuint64_t k = 0; kk != v63; ++kk)
        {
          if (*(void *)v80 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v79 + 1) + 8 * kk) dictionaryRepresentation];
          [v60 addObject:v66];
        }
        uint64_t v63 = [(NSArray *)v61 countByEnumeratingWithState:&v79 objects:v112 count:16];
      }
      while (v63);
    }

    [v3 setObject:v60 forKeyedSubscript:@"spokenEntityName"];
  }
  if ([(NSArray *)self->_spokenEntityTypes count])
  {
    v67 = [MEMORY[0x1E4F1CA48] array];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v68 = self->_spokenEntityTypes;
    uint64_t v69 = [(NSArray *)v68 countByEnumeratingWithState:&v75 objects:v111 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v76;
      do
      {
        for (muint64_t m = 0; mm != v70; ++mm)
        {
          if (*(void *)v76 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * mm), "dictionaryRepresentation", (void)v75);
          [v67 addObject:v73];
        }
        uint64_t v70 = [(NSArray *)v68 countByEnumeratingWithState:&v75 objects:v111 count:16];
      }
      while (v70);
    }

    [v3 setObject:v67 forKeyedSubscript:@"spokenEntityType"];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBWholeHouseAudioMetadata allocWithZone:](_INPBWholeHouseAudioMetadata, "allocWithZone:") init];
  if ([(_INPBWholeHouseAudioMetadata *)self hasHasExcept]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setHasExcept:[(_INPBWholeHouseAudioMetadata *)self hasExcept]];
  }
  v6 = (void *)[(NSArray *)self->_intentDestinationSpeakers copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setIntentDestinationSpeakers:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_intentPermanentNames copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setIntentPermanentNames:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_intentSpeakerNames copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setIntentSpeakerNames:v8];

  uint64_t v9 = (void *)[(NSArray *)self->_intentSpeakerRooms copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setIntentSpeakerRooms:v9];

  if ([(_INPBWholeHouseAudioMetadata *)self hasIsAllSpeakers]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setIsAllSpeakers:[(_INPBWholeHouseAudioMetadata *)self isAllSpeakers]];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsInHere]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setIsInHere:[(_INPBWholeHouseAudioMetadata *)self isInHere]];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsParticipatingSpeaker]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setIsParticipatingSpeaker:[(_INPBWholeHouseAudioMetadata *)self isParticipatingSpeaker]];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsPauseOrStop]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setIsPauseOrStop:[(_INPBWholeHouseAudioMetadata *)self isPauseOrStop]];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsWholeHouseAudioCommand]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setIsWholeHouseAudioCommand:[(_INPBWholeHouseAudioMetadata *)self isWholeHouseAudioCommand]];
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasNumberOfHomeAutomationWords]) {
    [(_INPBWholeHouseAudioMetadata *)v5 setNumberOfHomeAutomationWords:[(_INPBWholeHouseAudioMetadata *)self numberOfHomeAutomationWords]];
  }
  v10 = (void *)[(NSArray *)self->_permanentNames copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setPermanentNames:v10];

  v11 = (void *)[(NSArray *)self->_speakerNames copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setSpeakerNames:v11];

  v12 = (void *)[(NSArray *)self->_speakerRooms copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setSpeakerRooms:v12];

  v13 = (void *)[(NSArray *)self->_spokenEntityNames copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setSpokenEntityNames:v13];

  uint64_t v14 = (void *)[(NSArray *)self->_spokenEntityTypes copyWithZone:a3];
  [(_INPBWholeHouseAudioMetadata *)v5 setSpokenEntityTypes:v14];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_75;
  }
  int v5 = [(_INPBWholeHouseAudioMetadata *)self hasHasExcept];
  if (v5 != [v4 hasHasExcept]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasHasExcept])
  {
    if ([v4 hasHasExcept])
    {
      int hasExcept = self->_hasExcept;
      if (hasExcept != [v4 hasExcept]) {
        goto LABEL_75;
      }
    }
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self intentDestinationSpeakers];
  uint64_t v8 = [v4 intentDestinationSpeakers];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v9 = [(_INPBWholeHouseAudioMetadata *)self intentDestinationSpeakers];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBWholeHouseAudioMetadata *)self intentDestinationSpeakers];
    v12 = [v4 intentDestinationSpeakers];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self intentPermanentNames];
  uint64_t v8 = [v4 intentPermanentNames];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v14 = [(_INPBWholeHouseAudioMetadata *)self intentPermanentNames];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [(_INPBWholeHouseAudioMetadata *)self intentPermanentNames];
    v17 = [v4 intentPermanentNames];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self intentSpeakerNames];
  uint64_t v8 = [v4 intentSpeakerNames];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v19 = [(_INPBWholeHouseAudioMetadata *)self intentSpeakerNames];
  if (v19)
  {
    v20 = (void *)v19;
    uint64_t v21 = [(_INPBWholeHouseAudioMetadata *)self intentSpeakerNames];
    uint64_t v22 = [v4 intentSpeakerNames];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self intentSpeakerRooms];
  uint64_t v8 = [v4 intentSpeakerRooms];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v24 = [(_INPBWholeHouseAudioMetadata *)self intentSpeakerRooms];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBWholeHouseAudioMetadata *)self intentSpeakerRooms];
    v27 = [v4 intentSpeakerRooms];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  int v29 = [(_INPBWholeHouseAudioMetadata *)self hasIsAllSpeakers];
  if (v29 != [v4 hasIsAllSpeakers]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsAllSpeakers])
  {
    if ([v4 hasIsAllSpeakers])
    {
      int isAllSpeakers = self->_isAllSpeakers;
      if (isAllSpeakers != [v4 isAllSpeakers]) {
        goto LABEL_75;
      }
    }
  }
  int v31 = [(_INPBWholeHouseAudioMetadata *)self hasIsInHere];
  if (v31 != [v4 hasIsInHere]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsInHere])
  {
    if ([v4 hasIsInHere])
    {
      int isInHere = self->_isInHere;
      if (isInHere != [v4 isInHere]) {
        goto LABEL_75;
      }
    }
  }
  int v33 = [(_INPBWholeHouseAudioMetadata *)self hasIsParticipatingSpeaker];
  if (v33 != [v4 hasIsParticipatingSpeaker]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsParticipatingSpeaker])
  {
    if ([v4 hasIsParticipatingSpeaker])
    {
      int isParticipatingSpeaker = self->_isParticipatingSpeaker;
      if (isParticipatingSpeaker != [v4 isParticipatingSpeaker]) {
        goto LABEL_75;
      }
    }
  }
  int v35 = [(_INPBWholeHouseAudioMetadata *)self hasIsPauseOrStop];
  if (v35 != [v4 hasIsPauseOrStop]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsPauseOrStop])
  {
    if ([v4 hasIsPauseOrStop])
    {
      int isPauseOrStop = self->_isPauseOrStop;
      if (isPauseOrStop != [v4 isPauseOrStop]) {
        goto LABEL_75;
      }
    }
  }
  int v37 = [(_INPBWholeHouseAudioMetadata *)self hasIsWholeHouseAudioCommand];
  if (v37 != [v4 hasIsWholeHouseAudioCommand]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsWholeHouseAudioCommand])
  {
    if ([v4 hasIsWholeHouseAudioCommand])
    {
      int isWholeHouseAudioCommand = self->_isWholeHouseAudioCommand;
      if (isWholeHouseAudioCommand != [v4 isWholeHouseAudioCommand]) {
        goto LABEL_75;
      }
    }
  }
  int v39 = [(_INPBWholeHouseAudioMetadata *)self hasNumberOfHomeAutomationWords];
  if (v39 != [v4 hasNumberOfHomeAutomationWords]) {
    goto LABEL_75;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasNumberOfHomeAutomationWords])
  {
    if ([v4 hasNumberOfHomeAutomationWords])
    {
      int numberOfHomeAutomationWords = self->_numberOfHomeAutomationWords;
      if (numberOfHomeAutomationWords != [v4 numberOfHomeAutomationWords]) {
        goto LABEL_75;
      }
    }
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self permanentNames];
  uint64_t v8 = [v4 permanentNames];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v41 = [(_INPBWholeHouseAudioMetadata *)self permanentNames];
  if (v41)
  {
    uint64_t v42 = (void *)v41;
    uint64_t v43 = [(_INPBWholeHouseAudioMetadata *)self permanentNames];
    v44 = [v4 permanentNames];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self speakerNames];
  uint64_t v8 = [v4 speakerNames];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v46 = [(_INPBWholeHouseAudioMetadata *)self speakerNames];
  if (v46)
  {
    v47 = (void *)v46;
    uint64_t v48 = [(_INPBWholeHouseAudioMetadata *)self speakerNames];
    uint64_t v49 = [v4 speakerNames];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self speakerRooms];
  uint64_t v8 = [v4 speakerRooms];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v51 = [(_INPBWholeHouseAudioMetadata *)self speakerRooms];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_INPBWholeHouseAudioMetadata *)self speakerRooms];
    v54 = [v4 speakerRooms];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self spokenEntityNames];
  uint64_t v8 = [v4 spokenEntityNames];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_74;
  }
  uint64_t v56 = [(_INPBWholeHouseAudioMetadata *)self spokenEntityNames];
  if (v56)
  {
    uint64_t v57 = (void *)v56;
    v58 = [(_INPBWholeHouseAudioMetadata *)self spokenEntityNames];
    v59 = [v4 spokenEntityNames];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBWholeHouseAudioMetadata *)self spokenEntityTypes];
  uint64_t v8 = [v4 spokenEntityTypes];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v61 = [(_INPBWholeHouseAudioMetadata *)self spokenEntityTypes];
    if (!v61)
    {

LABEL_78:
      BOOL v66 = 1;
      goto LABEL_76;
    }
    uint64_t v62 = (void *)v61;
    uint64_t v63 = [(_INPBWholeHouseAudioMetadata *)self spokenEntityTypes];
    uint64_t v64 = [v4 spokenEntityTypes];
    char v65 = [v63 isEqual:v64];

    if (v65) {
      goto LABEL_78;
    }
  }
  else
  {
LABEL_74:
  }
LABEL_75:
  BOOL v66 = 0;
LABEL_76:

  return v66;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenEntityTypes, 0);
  objc_storeStrong((id *)&self->_spokenEntityNames, 0);
  objc_storeStrong((id *)&self->_speakerRooms, 0);
  objc_storeStrong((id *)&self->_speakerNames, 0);
  objc_storeStrong((id *)&self->_permanentNames, 0);
  objc_storeStrong((id *)&self->_intentSpeakerRooms, 0);
  objc_storeStrong((id *)&self->_intentSpeakerNames, 0);
  objc_storeStrong((id *)&self->_intentPermanentNames, 0);

  objc_storeStrong((id *)&self->_intentDestinationSpeakers, 0);
}

- (NSArray)spokenEntityTypes
{
  return self->_spokenEntityTypes;
}

- (NSArray)spokenEntityNames
{
  return self->_spokenEntityNames;
}

- (NSArray)speakerRooms
{
  return self->_speakerRooms;
}

- (NSArray)speakerNames
{
  return self->_speakerNames;
}

- (NSArray)permanentNames
{
  return self->_permanentNames;
}

- (int)numberOfHomeAutomationWords
{
  return self->_numberOfHomeAutomationWords;
}

- (BOOL)isWholeHouseAudioCommand
{
  return self->_isWholeHouseAudioCommand;
}

- (BOOL)isPauseOrStop
{
  return self->_isPauseOrStop;
}

- (BOOL)isParticipatingSpeaker
{
  return self->_isParticipatingSpeaker;
}

- (BOOL)isInHere
{
  return self->_isInHere;
}

- (BOOL)isAllSpeakers
{
  return self->_isAllSpeakers;
}

- (NSArray)intentSpeakerRooms
{
  return self->_intentSpeakerRooms;
}

- (NSArray)intentSpeakerNames
{
  return self->_intentSpeakerNames;
}

- (NSArray)intentPermanentNames
{
  return self->_intentPermanentNames;
}

- (NSArray)intentDestinationSpeakers
{
  return self->_intentDestinationSpeakers;
}

- (BOOL)hasExcept
{
  return self->_hasExcept;
}

- (unint64_t)hash
{
  if ([(_INPBWholeHouseAudioMetadata *)self hasHasExcept]) {
    uint64_t v19 = 2654435761 * self->_hasExcept;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v18 = [(NSArray *)self->_intentDestinationSpeakers hash];
  uint64_t v3 = [(NSArray *)self->_intentPermanentNames hash];
  uint64_t v4 = [(NSArray *)self->_intentSpeakerNames hash];
  uint64_t v5 = [(NSArray *)self->_intentSpeakerRooms hash];
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsAllSpeakers]) {
    uint64_t v6 = 2654435761 * self->_isAllSpeakers;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsInHere]) {
    uint64_t v7 = 2654435761 * self->_isInHere;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsParticipatingSpeaker]) {
    uint64_t v8 = 2654435761 * self->_isParticipatingSpeaker;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsPauseOrStop]) {
    uint64_t v9 = 2654435761 * self->_isPauseOrStop;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsWholeHouseAudioCommand]) {
    uint64_t v10 = 2654435761 * self->_isWholeHouseAudioCommand;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasNumberOfHomeAutomationWords]) {
    uint64_t v11 = 2654435761 * self->_numberOfHomeAutomationWords;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7;
  uint64_t v13 = v8 ^ v9 ^ v10 ^ v11 ^ [(NSArray *)self->_permanentNames hash];
  uint64_t v14 = v13 ^ [(NSArray *)self->_speakerNames hash];
  uint64_t v15 = v12 ^ v14 ^ [(NSArray *)self->_speakerRooms hash];
  uint64_t v16 = [(NSArray *)self->_spokenEntityNames hash];
  return v15 ^ v16 ^ [(NSArray *)self->_spokenEntityTypes hash];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWholeHouseAudioMetadata *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWholeHouseAudioMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWholeHouseAudioMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWholeHouseAudioMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWholeHouseAudioMetadata *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBWholeHouseAudioMetadata *)self hasHasExcept]) {
    PBDataWriterWriteBOOLField();
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v5 = self->_intentDestinationSpeakers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v83;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v83 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v82 objects:v94 count:16];
    }
    while (v7);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v10 = self->_intentPermanentNames;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
    }
    while (v12);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v15 = self->_intentSpeakerNames;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v75;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v17);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v20 = self->_intentSpeakerRooms;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v70 objects:v91 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v71;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v70 objects:v91 count:16];
    }
    while (v22);
  }

  if ([(_INPBWholeHouseAudioMetadata *)self hasIsAllSpeakers]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsInHere]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsParticipatingSpeaker]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsPauseOrStop]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasIsWholeHouseAudioCommand]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBWholeHouseAudioMetadata *)self hasNumberOfHomeAutomationWords]) {
    PBDataWriterWriteInt32Field();
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v25 = self->_permanentNames;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v66 objects:v90 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v67;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v66 objects:v90 count:16];
    }
    while (v27);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v30 = self->_speakerNames;
  uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v62 objects:v89 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v63;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v62 objects:v89 count:16];
    }
    while (v32);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int v35 = self->_speakerRooms;
  uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v58 objects:v88 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v58 objects:v88 count:16];
    }
    while (v37);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v40 = self->_spokenEntityNames;
  uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
    }
    while (v42);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v45 = self->_spokenEntityTypes;
  uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v50 objects:v86 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v51;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v50 objects:v86 count:16];
    }
    while (v47);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWholeHouseAudioMetadataReadFrom(self, (uint64_t)a3);
}

- (id)spokenEntityTypeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_spokenEntityTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)spokenEntityTypesCount
{
  return [(NSArray *)self->_spokenEntityTypes count];
}

- (void)addSpokenEntityType:(id)a3
{
  id v4 = a3;
  spokenEntityTypes = self->_spokenEntityTypes;
  id v8 = v4;
  if (!spokenEntityTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_spokenEntityTypes;
    self->_spokenEntityTypes = v6;

    id v4 = v8;
    spokenEntityTypes = self->_spokenEntityTypes;
  }
  [(NSArray *)spokenEntityTypes addObject:v4];
}

- (void)clearSpokenEntityTypes
{
}

- (void)setSpokenEntityTypes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  spokenEntityTypes = self->_spokenEntityTypes;
  self->_spokenEntityTypes = v4;

  MEMORY[0x1F41817F8](v4, spokenEntityTypes);
}

- (id)spokenEntityNameAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_spokenEntityNames objectAtIndexedSubscript:a3];
}

- (unint64_t)spokenEntityNamesCount
{
  return [(NSArray *)self->_spokenEntityNames count];
}

- (void)clearSpokenEntityNames
{
}

- (void)setSpokenEntityNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  spokenEntityNames = self->_spokenEntityNames;
  self->_spokenEntityNames = v4;

  MEMORY[0x1F41817F8](v4, spokenEntityNames);
}

- (id)speakerRoomsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_speakerRooms objectAtIndexedSubscript:a3];
}

- (unint64_t)speakerRoomsCount
{
  return [(NSArray *)self->_speakerRooms count];
}

- (void)addSpeakerRooms:(id)a3
{
  id v4 = a3;
  speakerRooms = self->_speakerRooms;
  id v8 = v4;
  if (!speakerRooms)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_speakerRooms;
    self->_speakerRooms = v6;

    id v4 = v8;
    speakerRooms = self->_speakerRooms;
  }
  [(NSArray *)speakerRooms addObject:v4];
}

- (void)clearSpeakerRooms
{
}

- (void)setSpeakerRooms:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  speakerRooms = self->_speakerRooms;
  self->_speakerRooms = v4;

  MEMORY[0x1F41817F8](v4, speakerRooms);
}

- (id)speakerNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_speakerNames objectAtIndexedSubscript:a3];
}

- (unint64_t)speakerNamesCount
{
  return [(NSArray *)self->_speakerNames count];
}

- (void)addSpeakerNames:(id)a3
{
  id v4 = a3;
  speakerNames = self->_speakerNames;
  id v8 = v4;
  if (!speakerNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_speakerNames;
    self->_speakerNames = v6;

    id v4 = v8;
    speakerNames = self->_speakerNames;
  }
  [(NSArray *)speakerNames addObject:v4];
}

- (void)clearSpeakerNames
{
}

- (void)setSpeakerNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  speakerNames = self->_speakerNames;
  self->_speakerNames = v4;

  MEMORY[0x1F41817F8](v4, speakerNames);
}

- (id)permanentNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_permanentNames objectAtIndexedSubscript:a3];
}

- (unint64_t)permanentNamesCount
{
  return [(NSArray *)self->_permanentNames count];
}

- (void)addPermanentNames:(id)a3
{
  id v4 = a3;
  permanentNames = self->_permanentNames;
  id v8 = v4;
  if (!permanentNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_permanentNames;
    self->_permanentNames = v6;

    id v4 = v8;
    permanentNames = self->_permanentNames;
  }
  [(NSArray *)permanentNames addObject:v4];
}

- (void)clearPermanentNames
{
}

- (void)setPermanentNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  permanentNames = self->_permanentNames;
  self->_permanentNames = v4;

  MEMORY[0x1F41817F8](v4, permanentNames);
}

- (void)setHasNumberOfHomeAutomationWords:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfHomeAutomationWords
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNumberOfHomeAutomationWords:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int numberOfHomeAutomationWords = a3;
}

- (void)setHasIsWholeHouseAudioCommand:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsWholeHouseAudioCommand
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsWholeHouseAudioCommand:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isWholeHouseAudioCommand = a3;
}

- (void)setHasIsPauseOrStop:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsPauseOrStop
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsPauseOrStop:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isPauseOrStop = a3;
}

- (void)setHasIsParticipatingSpeaker:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsParticipatingSpeaker
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsParticipatingSpeaker:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isParticipatingSpeaker = a3;
}

- (void)setHasIsInHere:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsInHere
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsInHere:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isInHere = a3;
}

- (void)setHasIsAllSpeakers:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAllSpeakers
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAllSpeakers:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isAllSpeakers = a3;
}

- (id)intentSpeakerRoomsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentSpeakerRooms objectAtIndexedSubscript:a3];
}

- (unint64_t)intentSpeakerRoomsCount
{
  return [(NSArray *)self->_intentSpeakerRooms count];
}

- (void)addIntentSpeakerRooms:(id)a3
{
  id v4 = a3;
  intentSpeakerRooms = self->_intentSpeakerRooms;
  id v8 = v4;
  if (!intentSpeakerRooms)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentSpeakerRooms;
    self->_intentSpeakerRooms = v6;

    id v4 = v8;
    intentSpeakerRooms = self->_intentSpeakerRooms;
  }
  [(NSArray *)intentSpeakerRooms addObject:v4];
}

- (void)clearIntentSpeakerRooms
{
}

- (void)setIntentSpeakerRooms:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentSpeakerRooms = self->_intentSpeakerRooms;
  self->_intentSpeakerRooms = v4;

  MEMORY[0x1F41817F8](v4, intentSpeakerRooms);
}

- (id)intentSpeakerNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentSpeakerNames objectAtIndexedSubscript:a3];
}

- (unint64_t)intentSpeakerNamesCount
{
  return [(NSArray *)self->_intentSpeakerNames count];
}

- (void)addIntentSpeakerNames:(id)a3
{
  id v4 = a3;
  intentSpeakerNames = self->_intentSpeakerNames;
  id v8 = v4;
  if (!intentSpeakerNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentSpeakerNames;
    self->_intentSpeakerNames = v6;

    id v4 = v8;
    intentSpeakerNames = self->_intentSpeakerNames;
  }
  [(NSArray *)intentSpeakerNames addObject:v4];
}

- (void)clearIntentSpeakerNames
{
}

- (void)setIntentSpeakerNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentSpeakerNames = self->_intentSpeakerNames;
  self->_intentSpeakerNames = v4;

  MEMORY[0x1F41817F8](v4, intentSpeakerNames);
}

- (id)intentPermanentNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentPermanentNames objectAtIndexedSubscript:a3];
}

- (unint64_t)intentPermanentNamesCount
{
  return [(NSArray *)self->_intentPermanentNames count];
}

- (void)addIntentPermanentNames:(id)a3
{
  id v4 = a3;
  intentPermanentNames = self->_intentPermanentNames;
  id v8 = v4;
  if (!intentPermanentNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentPermanentNames;
    self->_intentPermanentNames = v6;

    id v4 = v8;
    intentPermanentNames = self->_intentPermanentNames;
  }
  [(NSArray *)intentPermanentNames addObject:v4];
}

- (void)clearIntentPermanentNames
{
}

- (void)setIntentPermanentNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentPermanentNames = self->_intentPermanentNames;
  self->_intentPermanentNames = v4;

  MEMORY[0x1F41817F8](v4, intentPermanentNames);
}

- (id)intentDestinationSpeakersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentDestinationSpeakers objectAtIndexedSubscript:a3];
}

- (unint64_t)intentDestinationSpeakersCount
{
  return [(NSArray *)self->_intentDestinationSpeakers count];
}

- (void)addIntentDestinationSpeakers:(id)a3
{
  id v4 = a3;
  intentDestinationSpeakers = self->_intentDestinationSpeakers;
  id v8 = v4;
  if (!intentDestinationSpeakers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentDestinationSpeakers;
    self->_intentDestinationSpeakers = v6;

    id v4 = v8;
    intentDestinationSpeakers = self->_intentDestinationSpeakers;
  }
  [(NSArray *)intentDestinationSpeakers addObject:v4];
}

- (void)clearIntentDestinationSpeakers
{
}

- (void)setIntentDestinationSpeakers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  intentDestinationSpeakers = self->_intentDestinationSpeakers;
  self->_intentDestinationSpeakers = v4;

  MEMORY[0x1F41817F8](v4, intentDestinationSpeakers);
}

- (void)setHasHasExcept:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasExcept
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasExcept:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hasExcept = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)spokenEntityTypeType
{
  return (Class)objc_opt_class();
}

+ (Class)spokenEntityNameType
{
  return (Class)objc_opt_class();
}

+ (Class)speakerRoomsType
{
  return (Class)objc_opt_class();
}

+ (Class)speakerNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)permanentNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentSpeakerRoomsType
{
  return (Class)objc_opt_class();
}

+ (Class)intentSpeakerNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentPermanentNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentDestinationSpeakersType
{
  return (Class)objc_opt_class();
}

@end