@interface AXVoiceOverActivity
+ (BOOL)supportsSecureCoding;
+ (id)observerKeys;
- (AXCVoiceSelection)voiceSelection;
- (AXVoiceOverActivity)init;
- (AXVoiceOverActivity)initWithCoder:(id)a3;
- (BOOL)builtIn;
- (BOOL)identicalProperty:(id)a3 property2:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdenticalTo:(id)a3;
- (NSNumber)audioDucking;
- (NSNumber)brailleAlerts;
- (NSNumber)brailleAutoAdvanceDuration;
- (NSNumber)brailleFormatting;
- (NSNumber)brailleInput;
- (NSNumber)brailleOutput;
- (NSNumber)brailleStatusCellGeneral;
- (NSNumber)brailleStatusCellText;
- (NSNumber)containerFeedback;
- (NSNumber)hints;
- (NSNumber)imageDescriptions;
- (NSNumber)modifierKeys;
- (NSNumber)navigationStyle;
- (NSNumber)numberFeedback;
- (NSNumber)soundMuted;
- (NSNumber)speakEmojis;
- (NSNumber)speechMuted;
- (NSNumber)speechRate;
- (NSNumber)tableHeaders;
- (NSNumber)tableRowAndColumn;
- (NSNumber)typingStyle;
- (NSNumber)volume;
- (NSSet)appIdentifiers;
- (NSSet)textualContexts;
- (NSString)brailleInputTable;
- (NSString)brailleTable;
- (NSString)name;
- (NSString)voiceIdentifier;
- (NSUUID)punctuationGroup;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppIdentifiers:(id)a3;
- (void)setAudioDucking:(id)a3;
- (void)setBrailleAlerts:(id)a3;
- (void)setBrailleAutoAdvanceDuration:(id)a3;
- (void)setBrailleFormatting:(id)a3;
- (void)setBrailleInput:(id)a3;
- (void)setBrailleInputTable:(id)a3;
- (void)setBrailleOutput:(id)a3;
- (void)setBrailleStatusCellGeneral:(id)a3;
- (void)setBrailleStatusCellText:(id)a3;
- (void)setBrailleTable:(id)a3;
- (void)setBuiltIn:(BOOL)a3;
- (void)setContainerFeedback:(id)a3;
- (void)setHints:(id)a3;
- (void)setImageDescriptions:(id)a3;
- (void)setModifierKeys:(id)a3;
- (void)setName:(id)a3;
- (void)setNavigationStyle:(id)a3;
- (void)setNumberFeedback:(id)a3;
- (void)setPunctuationGroup:(id)a3;
- (void)setSoundMuted:(id)a3;
- (void)setSpeakEmojis:(id)a3;
- (void)setSpeechMuted:(id)a3;
- (void)setSpeechRate:(id)a3;
- (void)setTableHeaders:(id)a3;
- (void)setTableRowAndColumn:(id)a3;
- (void)setTextualContexts:(id)a3;
- (void)setTypingStyle:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVoiceIdentifier:(id)a3;
- (void)setVoiceSelection:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation AXVoiceOverActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXVoiceOverActivity)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXVoiceOverActivity;
  v2 = [(AXVoiceOverActivity *)&v5 init];
  v3 = [MEMORY[0x1E4F29128] UUID];
  [(AXVoiceOverActivity *)v2 setUuid:v3];

  return v2;
}

- (NSString)voiceIdentifier
{
  v2 = [(AXVoiceOverActivity *)self voiceSelection];
  v3 = [v2 voiceId];

  return (NSString *)v3;
}

- (void)setVoiceIdentifier:(id)a3
{
  id v10 = a3;
  v4 = [(AXVoiceOverActivity *)self voiceSelection];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F48308]);
    v6 = [(AXVoiceOverActivity *)self speechRate];
    v7 = [(AXVoiceOverActivity *)self volume];
    v8 = (void *)[v5 initWithVoiceId:v10 rate:v6 pitch:0 volume:v7 voiceSettings:0 effects:0];
    [(AXVoiceOverActivity *)self setVoiceSelection:v8];
  }
  v9 = [(AXVoiceOverActivity *)self voiceSelection];
  [v9 setVoiceId:v10];
}

- (NSNumber)speechRate
{
  v2 = [(AXVoiceOverActivity *)self voiceSelection];
  v3 = [v2 rate];

  return (NSNumber *)v3;
}

- (void)setSpeechRate:(id)a3
{
  id v10 = a3;
  v4 = [(AXVoiceOverActivity *)self voiceSelection];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F48308]);
    v6 = [(AXVoiceOverActivity *)self voiceIdentifier];
    v7 = [(AXVoiceOverActivity *)self volume];
    v8 = (void *)[v5 initWithVoiceId:v6 rate:v10 pitch:0 volume:v7 voiceSettings:0 effects:0];
    [(AXVoiceOverActivity *)self setVoiceSelection:v8];
  }
  v9 = [(AXVoiceOverActivity *)self voiceSelection];
  [v9 setRate:v10];
}

- (NSNumber)volume
{
  v2 = [(AXVoiceOverActivity *)self voiceSelection];
  v3 = [v2 volume];

  return (NSNumber *)v3;
}

- (void)setVolume:(id)a3
{
  id v10 = a3;
  v4 = [(AXVoiceOverActivity *)self voiceSelection];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F48308]);
    v6 = [(AXVoiceOverActivity *)self voiceIdentifier];
    v7 = [(AXVoiceOverActivity *)self speechRate];
    v8 = (void *)[v5 initWithVoiceId:v6 rate:v7 pitch:0 volume:v10 voiceSettings:0 effects:0];
    [(AXVoiceOverActivity *)self setVoiceSelection:v8];
  }
  v9 = [(AXVoiceOverActivity *)self voiceSelection];
  [v9 setVolume:v10];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXVoiceOverActivity builtIn](self, "builtIn"), @"builtIn");
  id v5 = [(AXVoiceOverActivity *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  v6 = [(AXVoiceOverActivity *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  v7 = [(AXVoiceOverActivity *)self textualContexts];
  [v4 encodeObject:v7 forKey:@"textualContext"];

  v8 = [(AXVoiceOverActivity *)self appIdentifiers];
  [v4 encodeObject:v8 forKey:@"appIdentifier"];

  v9 = [(AXVoiceOverActivity *)self punctuationGroup];
  [v4 encodeObject:v9 forKey:@"punctuationGroup"];

  id v10 = [(AXVoiceOverActivity *)self voiceIdentifier];
  [v4 encodeObject:v10 forKey:@"voiceIdentifier"];

  v11 = [(AXVoiceOverActivity *)self speechRate];
  [v4 encodeObject:v11 forKey:@"speechRate"];

  v12 = [(AXVoiceOverActivity *)self volume];
  [v4 encodeObject:v12 forKey:@"volume"];

  v13 = [(AXVoiceOverActivity *)self soundMuted];
  [v4 encodeObject:v13 forKey:@"soundMuted"];

  v14 = [(AXVoiceOverActivity *)self speechMuted];
  [v4 encodeObject:v14 forKey:@"speechMuted"];

  v15 = [(AXVoiceOverActivity *)self audioDucking];
  [v4 encodeObject:v15 forKey:@"audioDucking"];

  v16 = [(AXVoiceOverActivity *)self modifierKeys];
  [v4 encodeObject:v16 forKey:@"modifierKeys"];

  v17 = [(AXVoiceOverActivity *)self brailleTable];
  [v4 encodeObject:v17 forKey:@"brailleTable"];

  v18 = [(AXVoiceOverActivity *)self brailleInputTable];
  [v4 encodeObject:v18 forKey:@"brailleInputTable"];

  v19 = [(AXVoiceOverActivity *)self brailleStatusCellGeneral];
  [v4 encodeObject:v19 forKey:@"brailleStatusCellGeneral"];

  v20 = [(AXVoiceOverActivity *)self brailleStatusCellText];
  [v4 encodeObject:v20 forKey:@"brailleStatusCellText"];

  v21 = [(AXVoiceOverActivity *)self tableHeaders];
  [v4 encodeObject:v21 forKey:@"tableHeaders"];

  v22 = [(AXVoiceOverActivity *)self tableRowAndColumn];
  [v4 encodeObject:v22 forKey:@"tableRowAndColumn"];

  v23 = [(AXVoiceOverActivity *)self speakEmojis];
  [v4 encodeObject:v23 forKey:@"speakEmojis"];

  v24 = [(AXVoiceOverActivity *)self imageDescriptions];
  [v4 encodeObject:v24 forKey:@"imageDescriptions"];

  v25 = [(AXVoiceOverActivity *)self containerFeedback];
  [v4 encodeObject:v25 forKey:@"containerFeedback"];

  v26 = [(AXVoiceOverActivity *)self numberFeedback];
  [v4 encodeObject:v26 forKey:@"numberFeedback"];

  v27 = [(AXVoiceOverActivity *)self brailleOutput];
  [v4 encodeObject:v27 forKey:@"brailleOutput"];

  v28 = [(AXVoiceOverActivity *)self brailleInput];
  [v4 encodeObject:v28 forKey:@"brailleInput"];

  v29 = [(AXVoiceOverActivity *)self brailleAutoAdvanceDuration];
  [v4 encodeObject:v29 forKey:@"brailleAutoAdvanceDuration"];

  v30 = [(AXVoiceOverActivity *)self hints];
  [v4 encodeObject:v30 forKey:@"hints"];

  v31 = [(AXVoiceOverActivity *)self typingStyle];
  [v4 encodeObject:v31 forKey:@"typingStyle"];

  v32 = [(AXVoiceOverActivity *)self navigationStyle];
  [v4 encodeObject:v32 forKey:@"navigationStyle"];

  v33 = [(AXVoiceOverActivity *)self brailleAlerts];
  [v4 encodeObject:v33 forKey:@"brailleAlerts"];

  id v34 = [(AXVoiceOverActivity *)self brailleFormatting];
  [v4 encodeObject:v34 forKey:@"brailleFormatting"];
}

- (AXVoiceOverActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (AXVoiceOverActivity *)objc_opt_new();
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  [(AXVoiceOverActivity *)v5 setUuid:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  [(AXVoiceOverActivity *)v5 setName:v7];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"textualContext"];
  [(AXVoiceOverActivity *)v5 setTextualContexts:v11];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v15 = [v4 decodeObjectOfClasses:v14 forKey:@"appIdentifier"];
  [(AXVoiceOverActivity *)v5 setAppIdentifiers:v15];

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"punctuationGroup"];
  [(AXVoiceOverActivity *)v5 setPunctuationGroup:v16];

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voiceIdentifier"];
  [(AXVoiceOverActivity *)v5 setVoiceIdentifier:v17];

  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechRate"];
  [(AXVoiceOverActivity *)v5 setSpeechRate:v18];

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
  [(AXVoiceOverActivity *)v5 setVolume:v19];

  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"soundMuted"];
  [(AXVoiceOverActivity *)v5 setSoundMuted:v20];

  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechMuted"];
  [(AXVoiceOverActivity *)v5 setSpeechMuted:v21];

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioDucking"];
  [(AXVoiceOverActivity *)v5 setAudioDucking:v22];

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifierKeys"];
  [(AXVoiceOverActivity *)v5 setModifierKeys:v23];

  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleStatusCellGeneral"];
  [(AXVoiceOverActivity *)v5 setBrailleStatusCellGeneral:v24];

  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleStatusCellText"];
  [(AXVoiceOverActivity *)v5 setBrailleStatusCellText:v25];

  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleTable"];
  [(AXVoiceOverActivity *)v5 setBrailleTable:v26];

  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleInputTable"];
  [(AXVoiceOverActivity *)v5 setBrailleInputTable:v27];

  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speakEmojis"];
  [(AXVoiceOverActivity *)v5 setSpeakEmojis:v28];

  v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageDescriptions"];
  [(AXVoiceOverActivity *)v5 setImageDescriptions:v29];

  v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerFeedback"];
  [(AXVoiceOverActivity *)v5 setContainerFeedback:v30];

  v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberFeedback"];
  [(AXVoiceOverActivity *)v5 setNumberFeedback:v31];

  v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableRowAndColumn"];
  [(AXVoiceOverActivity *)v5 setTableRowAndColumn:v32];

  v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableHeaders"];
  [(AXVoiceOverActivity *)v5 setTableHeaders:v33];

  id v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleOutput"];
  [(AXVoiceOverActivity *)v5 setBrailleOutput:v34];

  v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleInput"];
  [(AXVoiceOverActivity *)v5 setBrailleInput:v35];

  v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleAutoAdvanceDuration"];
  [(AXVoiceOverActivity *)v5 setBrailleAutoAdvanceDuration:v36];

  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hints"];
  [(AXVoiceOverActivity *)v5 setHints:v37];

  v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typingStyle"];
  [(AXVoiceOverActivity *)v5 setTypingStyle:v38];

  v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"navigationStyle"];
  [(AXVoiceOverActivity *)v5 setNavigationStyle:v39];

  v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleAlerts"];
  [(AXVoiceOverActivity *)v5 setBrailleAlerts:v40];

  v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brailleFormatting"];
  [(AXVoiceOverActivity *)v5 setBrailleFormatting:v41];

  uint64_t v42 = [v4 decodeBoolForKey:@"builtIn"];
  [(AXVoiceOverActivity *)v5 setBuiltIn:v42];

  return v5;
}

+ (id)observerKeys
{
  return &unk_1EDC631B0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(AXVoiceOverActivity *)self uuid];
  [v4 setUuid:v5];

  v6 = [(AXVoiceOverActivity *)self name];
  [v4 setName:v6];

  v7 = [(AXVoiceOverActivity *)self textualContexts];
  [v4 setTextualContexts:v7];

  v8 = [(AXVoiceOverActivity *)self appIdentifiers];
  [v4 setAppIdentifiers:v8];

  uint64_t v9 = [(AXVoiceOverActivity *)self punctuationGroup];
  [v4 setPunctuationGroup:v9];

  id v10 = [(AXVoiceOverActivity *)self voiceIdentifier];
  [v4 setVoiceIdentifier:v10];

  v11 = [(AXVoiceOverActivity *)self speechRate];
  [v4 setSpeechRate:v11];

  v12 = [(AXVoiceOverActivity *)self volume];
  [v4 setVolume:v12];

  uint64_t v13 = [(AXVoiceOverActivity *)self speechMuted];
  [v4 setSpeechMuted:v13];

  v14 = [(AXVoiceOverActivity *)self audioDucking];
  [v4 setAudioDucking:v14];

  v15 = [(AXVoiceOverActivity *)self soundMuted];
  [v4 setSoundMuted:v15];

  objc_msgSend(v4, "setBuiltIn:", -[AXVoiceOverActivity builtIn](self, "builtIn"));
  v16 = [(AXVoiceOverActivity *)self modifierKeys];
  [v4 setModifierKeys:v16];

  v17 = [(AXVoiceOverActivity *)self brailleStatusCellGeneral];
  [v4 setBrailleStatusCellGeneral:v17];

  v18 = [(AXVoiceOverActivity *)self brailleStatusCellText];
  [v4 setBrailleStatusCellText:v18];

  v19 = [(AXVoiceOverActivity *)self brailleTable];
  [v4 setBrailleTable:v19];

  v20 = [(AXVoiceOverActivity *)self brailleInputTable];
  [v4 setBrailleInputTable:v20];

  v21 = [(AXVoiceOverActivity *)self tableHeaders];
  [v4 setTableHeaders:v21];

  v22 = [(AXVoiceOverActivity *)self tableRowAndColumn];
  [v4 setTableRowAndColumn:v22];

  v23 = [(AXVoiceOverActivity *)self speakEmojis];
  [v4 setSpeakEmojis:v23];

  v24 = [(AXVoiceOverActivity *)self imageDescriptions];
  [v4 setImageDescriptions:v24];

  v25 = [(AXVoiceOverActivity *)self containerFeedback];
  [v4 setContainerFeedback:v25];

  v26 = [(AXVoiceOverActivity *)self numberFeedback];
  [v4 setNumberFeedback:v26];

  v27 = [(AXVoiceOverActivity *)self brailleInput];
  [v4 setBrailleInput:v27];

  v28 = [(AXVoiceOverActivity *)self brailleOutput];
  [v4 setBrailleOutput:v28];

  v29 = [(AXVoiceOverActivity *)self brailleAutoAdvanceDuration];
  [v4 setBrailleAutoAdvanceDuration:v29];

  v30 = [(AXVoiceOverActivity *)self hints];
  [v4 setHints:v30];

  v31 = [(AXVoiceOverActivity *)self typingStyle];
  [v4 setTypingStyle:v31];

  v32 = [(AXVoiceOverActivity *)self navigationStyle];
  [v4 setNavigationStyle:v32];

  v33 = [(AXVoiceOverActivity *)self brailleAlerts];
  [v4 setBrailleAlerts:v33];

  id v34 = [(AXVoiceOverActivity *)self brailleFormatting];
  [v4 setBrailleFormatting:v34];

  return v4;
}

- (BOOL)identicalProperty:(id)a3 property2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = (v5 || !v6) && (!v5 || v6) && (!v5 || !v6 || [v5 isEqual:v6]);

  return v8;
}

- (BOOL)isIdenticalTo:(id)a3
{
  id v4 = a3;
  id v5 = [(AXVoiceOverActivity *)self speechRate];
  id v6 = [v4 speechRate];
  BOOL v7 = [(AXVoiceOverActivity *)self identicalProperty:v5 property2:v6];

  if (!v7) {
    goto LABEL_29;
  }
  BOOL v8 = [(AXVoiceOverActivity *)self volume];
  uint64_t v9 = [v4 volume];
  BOOL v10 = [(AXVoiceOverActivity *)self identicalProperty:v8 property2:v9];

  if (!v10) {
    goto LABEL_29;
  }
  v11 = [(AXVoiceOverActivity *)self speechMuted];
  v12 = [v4 speechMuted];
  BOOL v13 = [(AXVoiceOverActivity *)self identicalProperty:v11 property2:v12];

  if (!v13) {
    goto LABEL_29;
  }
  v14 = [(AXVoiceOverActivity *)self soundMuted];
  v15 = [v4 soundMuted];
  BOOL v16 = [(AXVoiceOverActivity *)self identicalProperty:v14 property2:v15];

  if (!v16) {
    goto LABEL_29;
  }
  v17 = [(AXVoiceOverActivity *)self voiceIdentifier];
  v18 = [v4 voiceIdentifier];
  BOOL v19 = [(AXVoiceOverActivity *)self identicalProperty:v17 property2:v18];

  if (!v19) {
    goto LABEL_29;
  }
  v20 = [(AXVoiceOverActivity *)self textualContexts];
  v21 = [v4 textualContexts];
  BOOL v22 = [(AXVoiceOverActivity *)self identicalProperty:v20 property2:v21];

  if (!v22) {
    goto LABEL_29;
  }
  v23 = [(AXVoiceOverActivity *)self name];
  v24 = [v4 name];
  BOOL v25 = [(AXVoiceOverActivity *)self identicalProperty:v23 property2:v24];

  if (!v25) {
    goto LABEL_29;
  }
  v26 = [(AXVoiceOverActivity *)self appIdentifiers];
  v27 = [v4 appIdentifiers];
  BOOL v28 = [(AXVoiceOverActivity *)self identicalProperty:v26 property2:v27];

  if (!v28) {
    goto LABEL_29;
  }
  v29 = [(AXVoiceOverActivity *)self modifierKeys];
  v30 = [v4 modifierKeys];
  BOOL v31 = [(AXVoiceOverActivity *)self identicalProperty:v29 property2:v30];

  if (!v31) {
    goto LABEL_29;
  }
  v32 = [(AXVoiceOverActivity *)self brailleStatusCellText];
  v33 = [v4 brailleStatusCellText];
  BOOL v34 = [(AXVoiceOverActivity *)self identicalProperty:v32 property2:v33];

  if (!v34) {
    goto LABEL_29;
  }
  v35 = [(AXVoiceOverActivity *)self brailleStatusCellGeneral];
  v36 = [v4 brailleStatusCellGeneral];
  BOOL v37 = [(AXVoiceOverActivity *)self identicalProperty:v35 property2:v36];

  if (!v37) {
    goto LABEL_29;
  }
  v38 = [(AXVoiceOverActivity *)self brailleTable];
  v39 = [v4 brailleTable];
  BOOL v40 = [(AXVoiceOverActivity *)self identicalProperty:v38 property2:v39];

  if (!v40) {
    goto LABEL_29;
  }
  v41 = [(AXVoiceOverActivity *)self brailleInputTable];
  uint64_t v42 = [v4 brailleInputTable];
  BOOL v43 = [(AXVoiceOverActivity *)self identicalProperty:v41 property2:v42];

  if (!v43) {
    goto LABEL_29;
  }
  v44 = [(AXVoiceOverActivity *)self tableHeaders];
  v45 = [v4 tableHeaders];
  BOOL v46 = [(AXVoiceOverActivity *)self identicalProperty:v44 property2:v45];

  if (!v46) {
    goto LABEL_29;
  }
  v47 = [(AXVoiceOverActivity *)self tableRowAndColumn];
  v48 = [v4 tableRowAndColumn];
  BOOL v49 = [(AXVoiceOverActivity *)self identicalProperty:v47 property2:v48];

  if (!v49) {
    goto LABEL_29;
  }
  v50 = [(AXVoiceOverActivity *)self speakEmojis];
  v51 = [v4 speakEmojis];
  BOOL v52 = [(AXVoiceOverActivity *)self identicalProperty:v50 property2:v51];

  if (!v52) {
    goto LABEL_29;
  }
  v53 = [(AXVoiceOverActivity *)self imageDescriptions];
  v54 = [v4 imageDescriptions];
  BOOL v55 = [(AXVoiceOverActivity *)self identicalProperty:v53 property2:v54];

  if (!v55) {
    goto LABEL_29;
  }
  v56 = [(AXVoiceOverActivity *)self containerFeedback];
  v57 = [v4 containerFeedback];
  BOOL v58 = [(AXVoiceOverActivity *)self identicalProperty:v56 property2:v57];

  if (!v58) {
    goto LABEL_29;
  }
  v59 = [(AXVoiceOverActivity *)self numberFeedback];
  v60 = [v4 numberFeedback];
  BOOL v61 = [(AXVoiceOverActivity *)self identicalProperty:v59 property2:v60];

  if (!v61) {
    goto LABEL_29;
  }
  v62 = [(AXVoiceOverActivity *)self brailleOutput];
  v63 = [v4 brailleOutput];
  BOOL v64 = [(AXVoiceOverActivity *)self identicalProperty:v62 property2:v63];

  if (!v64) {
    goto LABEL_29;
  }
  v65 = [(AXVoiceOverActivity *)self brailleInput];
  v66 = [v4 brailleInput];
  BOOL v67 = [(AXVoiceOverActivity *)self identicalProperty:v65 property2:v66];

  if (!v67) {
    goto LABEL_29;
  }
  v68 = [(AXVoiceOverActivity *)self brailleAutoAdvanceDuration];
  v69 = [v4 brailleAutoAdvanceDuration];
  BOOL v70 = [(AXVoiceOverActivity *)self identicalProperty:v68 property2:v69];

  if (!v70) {
    goto LABEL_29;
  }
  v71 = [(AXVoiceOverActivity *)self audioDucking];
  v72 = [v4 audioDucking];
  BOOL v73 = [(AXVoiceOverActivity *)self identicalProperty:v71 property2:v72];

  if (!v73) {
    goto LABEL_29;
  }
  v74 = [(AXVoiceOverActivity *)self hints];
  v75 = [v4 hints];
  BOOL v76 = [(AXVoiceOverActivity *)self identicalProperty:v74 property2:v75];

  if (!v76) {
    goto LABEL_29;
  }
  v77 = [(AXVoiceOverActivity *)self typingStyle];
  v78 = [v4 typingStyle];
  BOOL v79 = [(AXVoiceOverActivity *)self identicalProperty:v77 property2:v78];

  if (!v79) {
    goto LABEL_29;
  }
  v80 = [(AXVoiceOverActivity *)self navigationStyle];
  v81 = [v4 navigationStyle];
  BOOL v82 = [(AXVoiceOverActivity *)self identicalProperty:v80 property2:v81];

  if (!v82) {
    goto LABEL_29;
  }
  v83 = [(AXVoiceOverActivity *)self brailleAlerts];
  v84 = [v4 brailleAlerts];
  BOOL v85 = [(AXVoiceOverActivity *)self identicalProperty:v83 property2:v84];

  if (v85)
  {
    v86 = [(AXVoiceOverActivity *)self brailleFormatting];
    v87 = [v4 brailleFormatting];
    BOOL v88 = [(AXVoiceOverActivity *)self identicalProperty:v86 property2:v87];
  }
  else
  {
LABEL_29:
    BOOL v88 = 0;
  }

  return v88;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(AXVoiceOverActivity *)self uuid];
    id v6 = [v4 uuid];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)AXVoiceOverActivity;
  id v4 = [(AXVoiceOverActivity *)&v13 description];
  id v5 = [(AXVoiceOverActivity *)self name];
  id v6 = [(AXVoiceOverActivity *)self appIdentifiers];
  char v7 = [(AXVoiceOverActivity *)self voiceIdentifier];
  BOOL v8 = [(AXVoiceOverActivity *)self punctuationGroup];
  uint64_t v9 = [(AXVoiceOverActivity *)self volume];
  BOOL v10 = [(AXVoiceOverActivity *)self speechRate];
  v11 = [v3 stringWithFormat:@"%@: name: %@, apps: %@, voice: %@, punctuation: %@, volume: %@, rate: %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSSet)textualContexts
{
  return self->_textualContexts;
}

- (void)setTextualContexts:(id)a3
{
}

- (NSSet)appIdentifiers
{
  return self->_appIdentifiers;
}

- (void)setAppIdentifiers:(id)a3
{
}

- (NSUUID)punctuationGroup
{
  return self->_punctuationGroup;
}

- (void)setPunctuationGroup:(id)a3
{
}

- (NSNumber)tableHeaders
{
  return self->_tableHeaders;
}

- (void)setTableHeaders:(id)a3
{
}

- (NSNumber)tableRowAndColumn
{
  return self->_tableRowAndColumn;
}

- (void)setTableRowAndColumn:(id)a3
{
}

- (NSNumber)speakEmojis
{
  return self->_speakEmojis;
}

- (void)setSpeakEmojis:(id)a3
{
}

- (NSNumber)containerFeedback
{
  return self->_containerFeedback;
}

- (void)setContainerFeedback:(id)a3
{
}

- (NSNumber)imageDescriptions
{
  return self->_imageDescriptions;
}

- (void)setImageDescriptions:(id)a3
{
}

- (NSNumber)hints
{
  return self->_hints;
}

- (void)setHints:(id)a3
{
}

- (NSNumber)numberFeedback
{
  return self->_numberFeedback;
}

- (void)setNumberFeedback:(id)a3
{
}

- (NSNumber)typingStyle
{
  return self->_typingStyle;
}

- (void)setTypingStyle:(id)a3
{
}

- (NSNumber)navigationStyle
{
  return self->_navigationStyle;
}

- (void)setNavigationStyle:(id)a3
{
}

- (NSNumber)speechMuted
{
  return self->_speechMuted;
}

- (void)setSpeechMuted:(id)a3
{
}

- (NSNumber)soundMuted
{
  return self->_soundMuted;
}

- (void)setSoundMuted:(id)a3
{
}

- (NSNumber)audioDucking
{
  return self->_audioDucking;
}

- (void)setAudioDucking:(id)a3
{
}

- (NSNumber)modifierKeys
{
  return self->_modifierKeys;
}

- (void)setModifierKeys:(id)a3
{
}

- (NSNumber)brailleStatusCellGeneral
{
  return self->_brailleStatusCellGeneral;
}

- (void)setBrailleStatusCellGeneral:(id)a3
{
}

- (NSNumber)brailleStatusCellText
{
  return self->_brailleStatusCellText;
}

- (void)setBrailleStatusCellText:(id)a3
{
}

- (NSString)brailleTable
{
  return self->_brailleTable;
}

- (void)setBrailleTable:(id)a3
{
}

- (NSString)brailleInputTable
{
  return self->_brailleInputTable;
}

- (void)setBrailleInputTable:(id)a3
{
}

- (NSNumber)brailleOutput
{
  return self->_brailleOutput;
}

- (void)setBrailleOutput:(id)a3
{
}

- (NSNumber)brailleInput
{
  return self->_brailleInput;
}

- (void)setBrailleInput:(id)a3
{
}

- (NSNumber)brailleAutoAdvanceDuration
{
  return self->_brailleAutoAdvanceDuration;
}

- (void)setBrailleAutoAdvanceDuration:(id)a3
{
}

- (NSNumber)brailleAlerts
{
  return self->_brailleAlerts;
}

- (void)setBrailleAlerts:(id)a3
{
}

- (NSNumber)brailleFormatting
{
  return self->_brailleFormatting;
}

- (void)setBrailleFormatting:(id)a3
{
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (AXCVoiceSelection)voiceSelection
{
  return self->_voiceSelection;
}

- (void)setVoiceSelection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSelection, 0);
  objc_storeStrong((id *)&self->_brailleFormatting, 0);
  objc_storeStrong((id *)&self->_brailleAlerts, 0);
  objc_storeStrong((id *)&self->_brailleAutoAdvanceDuration, 0);
  objc_storeStrong((id *)&self->_brailleInput, 0);
  objc_storeStrong((id *)&self->_brailleOutput, 0);
  objc_storeStrong((id *)&self->_brailleInputTable, 0);
  objc_storeStrong((id *)&self->_brailleTable, 0);
  objc_storeStrong((id *)&self->_brailleStatusCellText, 0);
  objc_storeStrong((id *)&self->_brailleStatusCellGeneral, 0);
  objc_storeStrong((id *)&self->_modifierKeys, 0);
  objc_storeStrong((id *)&self->_audioDucking, 0);
  objc_storeStrong((id *)&self->_soundMuted, 0);
  objc_storeStrong((id *)&self->_speechMuted, 0);
  objc_storeStrong((id *)&self->_navigationStyle, 0);
  objc_storeStrong((id *)&self->_typingStyle, 0);
  objc_storeStrong((id *)&self->_numberFeedback, 0);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_imageDescriptions, 0);
  objc_storeStrong((id *)&self->_containerFeedback, 0);
  objc_storeStrong((id *)&self->_speakEmojis, 0);
  objc_storeStrong((id *)&self->_tableRowAndColumn, 0);
  objc_storeStrong((id *)&self->_tableHeaders, 0);
  objc_storeStrong((id *)&self->_punctuationGroup, 0);
  objc_storeStrong((id *)&self->_appIdentifiers, 0);
  objc_storeStrong((id *)&self->_textualContexts, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end