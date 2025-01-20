@interface MPPlaybackEQSetting
+ (MPPlaybackEQSetting)settingWithName:(id)a3;
+ (MPPlaybackEQSetting)settingWithPreset:(int64_t)a3;
+ (NSArray)allSettings;
- (NSString)localizedName;
- (NSString)name;
- (id)_initWithPreset:(int64_t)a3;
- (int)avPreset;
- (int64_t)preset;
@end

@implementation MPPlaybackEQSetting

+ (MPPlaybackEQSetting)settingWithName:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"Off"
    || (char v6 = [(__CFString *)v4 isEqual:@"Off"], v5, (v6 & 1) != 0))
  {
    uint64_t v7 = 0;
LABEL_73:
    v77 = [a1 settingWithPreset:v7];
    goto LABEL_74;
  }
  v8 = v5;
  if (v8 == @"Acoustic"
    || (v9 = v8, char v10 = [(__CFString *)v8 isEqual:@"Acoustic"], v9, (v10 & 1) != 0))
  {
    uint64_t v7 = 100;
    goto LABEL_73;
  }
  v11 = v9;
  if (v11 == @"BassBooster"
    || (v12 = v11, char v13 = [(__CFString *)v11 isEqual:@"BassBooster"],
                   v12,
                   (v13 & 1) != 0))
  {
    uint64_t v7 = 101;
    goto LABEL_73;
  }
  v14 = v12;
  if (v14 == @"BassReducer"
    || (v15 = v14, char v16 = [(__CFString *)v14 isEqual:@"BassReducer"],
                   v15,
                   (v16 & 1) != 0))
  {
    uint64_t v7 = 102;
    goto LABEL_73;
  }
  v17 = v15;
  if (v17 == @"Classical"
    || (v18 = v17, char v19 = [(__CFString *)v17 isEqual:@"Classical"], v18, (v19 & 1) != 0))
  {
    uint64_t v7 = 103;
    goto LABEL_73;
  }
  v20 = v18;
  if (v20 == @"Dance"
    || (v21 = v20, char v22 = [(__CFString *)v20 isEqual:@"Dance"], v21, (v22 & 1) != 0))
  {
    uint64_t v7 = 104;
    goto LABEL_73;
  }
  v23 = v21;
  if (v23 == @"Deep"
    || (v24 = v23, char v25 = [(__CFString *)v23 isEqual:@"Deep"], v24, (v25 & 1) != 0))
  {
    uint64_t v7 = 105;
    goto LABEL_73;
  }
  v26 = v24;
  if (v26 == @"Electronic"
    || (v27 = v26, char v28 = [(__CFString *)v26 isEqual:@"Electronic"], v27, (v28 & 1) != 0))
  {
    uint64_t v7 = 106;
    goto LABEL_73;
  }
  v29 = v27;
  if (v29 == @"Flat"
    || (v30 = v29, char v31 = [(__CFString *)v29 isEqual:@"Flat"], v30, (v31 & 1) != 0))
  {
    uint64_t v7 = 107;
    goto LABEL_73;
  }
  v32 = v30;
  if (v32 == @"HipHop"
    || (v33 = v32, char v34 = [(__CFString *)v32 isEqual:@"HipHop"], v33, (v34 & 1) != 0))
  {
    uint64_t v7 = 108;
    goto LABEL_73;
  }
  v35 = v33;
  if (v35 == @"Jazz"
    || (v36 = v35, char v37 = [(__CFString *)v35 isEqual:@"Jazz"], v36, (v37 & 1) != 0))
  {
    uint64_t v7 = 109;
    goto LABEL_73;
  }
  v38 = v36;
  if (v38 == @"Latin"
    || (v39 = v38, char v40 = [(__CFString *)v38 isEqual:@"Latin"], v39, (v40 & 1) != 0))
  {
    uint64_t v7 = 110;
    goto LABEL_73;
  }
  v41 = v39;
  if (v41 == @"Loudness"
    || (v42 = v41, char v43 = [(__CFString *)v41 isEqual:@"Loudness"], v42, (v43 & 1) != 0))
  {
    uint64_t v7 = 111;
    goto LABEL_73;
  }
  v44 = v42;
  if (v44 == @"Lounge"
    || (v45 = v44, char v46 = [(__CFString *)v44 isEqual:@"Lounge"], v45, (v46 & 1) != 0))
  {
    uint64_t v7 = 112;
    goto LABEL_73;
  }
  v47 = v45;
  if (v47 == @"Piano"
    || (v48 = v47, char v49 = [(__CFString *)v47 isEqual:@"Piano"], v48, (v49 & 1) != 0))
  {
    uint64_t v7 = 113;
    goto LABEL_73;
  }
  v50 = v48;
  if (v50 == @"Pop"
    || (v51 = v50, char v52 = [(__CFString *)v50 isEqual:@"Pop"], v51, (v52 & 1) != 0))
  {
    uint64_t v7 = 114;
    goto LABEL_73;
  }
  v53 = v51;
  if (v53 == @"R&B"
    || (v54 = v53, char v55 = [(__CFString *)v53 isEqual:@"R&B"], v54, (v55 & 1) != 0))
  {
    uint64_t v7 = 115;
    goto LABEL_73;
  }
  v56 = v54;
  if (v56 == @"Rock"
    || (v57 = v56, char v58 = [(__CFString *)v56 isEqual:@"Rock"], v57, (v58 & 1) != 0))
  {
    uint64_t v7 = 116;
    goto LABEL_73;
  }
  v59 = v57;
  if (v59 == @"SmallSpeakers"
    || (v60 = v59,
        char v61 = [(__CFString *)v59 isEqual:@"SmallSpeakers"],
        v60,
        (v61 & 1) != 0))
  {
    uint64_t v7 = 117;
    goto LABEL_73;
  }
  v62 = v60;
  if (v62 == @"SpokenWord"
    || (v63 = v62, char v64 = [(__CFString *)v62 isEqual:@"SpokenWord"], v63, (v64 & 1) != 0))
  {
    uint64_t v7 = 118;
    goto LABEL_73;
  }
  v65 = v63;
  if (v65 == @"TrebleBooster"
    || (v66 = v65,
        char v67 = [(__CFString *)v65 isEqual:@"TrebleBooster"],
        v66,
        (v67 & 1) != 0))
  {
    uint64_t v7 = 119;
    goto LABEL_73;
  }
  v68 = v66;
  if (v68 == @"TrebleReducer"
    || (v69 = v68,
        char v70 = [(__CFString *)v68 isEqual:@"TrebleReducer"],
        v69,
        (v70 & 1) != 0))
  {
    uint64_t v7 = 120;
    goto LABEL_73;
  }
  v71 = v69;
  if (v71 == @"VocalBooster"
    || (v72 = v71,
        char v73 = [(__CFString *)v71 isEqual:@"VocalBooster"],
        v72,
        (v73 & 1) != 0))
  {
    uint64_t v7 = 121;
    goto LABEL_73;
  }
  v74 = v72;
  if (v74 == @"LateNightMode"
    || (v75 = v74, int v76 = [(__CFString *)v74 isEqual:@"LateNightMode"], v75, v76))
  {
    uint64_t v7 = 122;
    goto LABEL_73;
  }
  v77 = 0;
LABEL_74:

  return (MPPlaybackEQSetting *)v77;
}

- (int64_t)preset
{
  return self->_preset;
}

- (int)avPreset
{
  int64_t preset = self->_preset;
  int v3 = preset - 99;
  if (preset == 122) {
    int v3 = 0;
  }
  if (preset) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)localizedName
{
  int64_t preset = self->_preset;
  switch(preset)
  {
    case 'd':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_ACOUSTIC";
      goto LABEL_27;
    case 'e':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_BASS_BOOSTER";
      goto LABEL_27;
    case 'f':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_BASS_REDUCER";
      goto LABEL_27;
    case 'g':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_CLASSICAL";
      goto LABEL_27;
    case 'h':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_DANCE";
      goto LABEL_27;
    case 'i':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_DEEP";
      goto LABEL_27;
    case 'j':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_ELECTRONIC";
      goto LABEL_27;
    case 'k':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_FLAT";
      goto LABEL_27;
    case 'l':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_HIPHOP";
      goto LABEL_27;
    case 'm':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_JAZZ";
      goto LABEL_27;
    case 'n':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_LATIN";
      goto LABEL_27;
    case 'o':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_LOUDNESS";
      goto LABEL_27;
    case 'p':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_LOUNGE";
      goto LABEL_27;
    case 'q':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_PIANO";
      goto LABEL_27;
    case 'r':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_POP";
      goto LABEL_27;
    case 's':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_RANDB";
      goto LABEL_27;
    case 't':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_ROCK";
      goto LABEL_27;
    case 'u':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_SMALL_SPEAKERS";
      goto LABEL_27;
    case 'v':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_SPOKEN_WORD";
      goto LABEL_27;
    case 'w':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_TREBLE_BOOSTER";
      goto LABEL_27;
    case 'x':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_TREBLE_REDUCER";
      goto LABEL_27;
    case 'y':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_VOCAL_BOOSTER";
      goto LABEL_27;
    case 'z':
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"EQ_LATE_NIGHT";
      goto LABEL_27;
    default:
      if (preset) {
        goto LABEL_28;
      }
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v5 = v4;
      char v6 = @"OFF";
LABEL_27:
      v2 = [v4 localizedStringForKey:v6 value:&stru_1EE680640 table:@"MediaPlayer"];

LABEL_28:
      return (NSString *)v2;
  }
}

- (NSString)name
{
  int64_t preset = self->_preset;
  switch(preset)
  {
    case 'd':
      result = (NSString *)@"Acoustic";
      break;
    case 'e':
      result = (NSString *)@"BassBooster";
      break;
    case 'f':
      result = (NSString *)@"BassReducer";
      break;
    case 'g':
      result = (NSString *)@"Classical";
      break;
    case 'h':
      result = (NSString *)@"Dance";
      break;
    case 'i':
      result = (NSString *)@"Deep";
      break;
    case 'j':
      result = (NSString *)@"Electronic";
      break;
    case 'k':
      result = (NSString *)@"Flat";
      break;
    case 'l':
      result = (NSString *)@"HipHop";
      break;
    case 'm':
      result = (NSString *)@"Jazz";
      break;
    case 'n':
      result = (NSString *)@"Latin";
      break;
    case 'o':
      result = (NSString *)@"Loudness";
      break;
    case 'p':
      result = (NSString *)@"Lounge";
      break;
    case 'q':
      result = (NSString *)@"Piano";
      break;
    case 'r':
      result = (NSString *)@"Pop";
      break;
    case 's':
      result = (NSString *)@"R&B";
      break;
    case 't':
      result = (NSString *)@"Rock";
      break;
    case 'u':
      result = (NSString *)@"SmallSpeakers";
      break;
    case 'v':
      result = (NSString *)@"SpokenWord";
      break;
    case 'w':
      result = (NSString *)@"TrebleBooster";
      break;
    case 'x':
      result = (NSString *)@"TrebleReducer";
      break;
    case 'y':
      result = (NSString *)@"VocalBooster";
      break;
    case 'z':
      result = (NSString *)@"LateNightMode";
      break;
    default:
      if (preset) {
        result = (NSString *)@"Unknown";
      }
      else {
        result = (NSString *)@"Off";
      }
      break;
  }
  return result;
}

- (id)_initWithPreset:(int64_t)a3
{
  if (a3 && (unint64_t)(a3 - 123) < 0xFFFFFFFFFFFFFFE9)
  {
    v4 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MPPlaybackEQSetting;
    v5 = [(MPPlaybackEQSetting *)&v7 init];
    if (v5) {
      v5->_int64_t preset = a3;
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

+ (MPPlaybackEQSetting)settingWithPreset:(int64_t)a3
{
  int v3 = (void *)[objc_alloc((Class)a1) _initWithPreset:a3];

  return (MPPlaybackEQSetting *)v3;
}

+ (NSArray)allSettings
{
  v29[24] = *MEMORY[0x1E4F143B8];
  char v28 = [a1 settingWithPreset:0];
  v29[0] = v28;
  v27 = [a1 settingWithPreset:100];
  v29[1] = v27;
  v26 = [a1 settingWithPreset:101];
  v29[2] = v26;
  char v25 = [a1 settingWithPreset:102];
  v29[3] = v25;
  v24 = [a1 settingWithPreset:103];
  v29[4] = v24;
  v23 = [a1 settingWithPreset:104];
  v29[5] = v23;
  char v22 = [a1 settingWithPreset:105];
  v29[6] = v22;
  v21 = [a1 settingWithPreset:106];
  v29[7] = v21;
  v20 = [a1 settingWithPreset:107];
  v29[8] = v20;
  char v19 = [a1 settingWithPreset:108];
  v29[9] = v19;
  v18 = [a1 settingWithPreset:109];
  v29[10] = v18;
  v17 = [a1 settingWithPreset:110];
  v29[11] = v17;
  char v16 = [a1 settingWithPreset:111];
  v29[12] = v16;
  v15 = [a1 settingWithPreset:112];
  v29[13] = v15;
  int v3 = [a1 settingWithPreset:113];
  v29[14] = v3;
  v4 = [a1 settingWithPreset:114];
  v29[15] = v4;
  v5 = [a1 settingWithPreset:115];
  v29[16] = v5;
  char v6 = [a1 settingWithPreset:116];
  v29[17] = v6;
  objc_super v7 = [a1 settingWithPreset:117];
  v29[18] = v7;
  v8 = [a1 settingWithPreset:118];
  v29[19] = v8;
  v9 = [a1 settingWithPreset:119];
  v29[20] = v9;
  char v10 = [a1 settingWithPreset:120];
  v29[21] = v10;
  v11 = [a1 settingWithPreset:121];
  v29[22] = v11;
  v12 = [a1 settingWithPreset:122];
  v29[23] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:24];

  return (NSArray *)v14;
}

@end