@interface ESUserData
+ (id)_vocabularyLabelsForFieldType:(unsigned __int16)a3;
+ (void)_addVocabWord:(id)a3 vocabularyLabels:(id)a4 toVocabularyWords:(id)a5;
+ (void)_applyContactLimitsToFirstPartyContacts:(id)a3 thirdPartyContacts:(id)a4 groupNames:(id)a5;
+ (void)_limitVocabularyWords:(id)a3 toApplicableSpeechCategories:(id)a4;
+ (void)_processContactItem:(id)a3 contactWords:(id)a4;
+ (void)_processRadioItem:(id)a3 radioWords:(id)a4;
+ (void)_processVocabularyItem:(id)a3 vocabularyWords:(id)a4;
- (ESUserData)initWithItems:(id)a3 applicableSpeechCategories:(id)a4;
- (NSDictionary)vocabularyWords;
- (NSOrderedSet)firstPartyContactWords;
- (NSOrderedSet)groupNameWords;
- (NSOrderedSet)radioWords;
- (NSOrderedSet)thirdPartyContactWords;
- (void)_populateUserDataFromItems:(id)a3 applicableSpeechCategories:(id)a4;
@end

@implementation ESUserData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioWords, 0);
  objc_storeStrong((id *)&self->_vocabularyWords, 0);
  objc_storeStrong((id *)&self->_groupNameWords, 0);
  objc_storeStrong((id *)&self->_thirdPartyContactWords, 0);

  objc_storeStrong((id *)&self->_firstPartyContactWords, 0);
}

- (NSOrderedSet)radioWords
{
  return self->_radioWords;
}

- (NSDictionary)vocabularyWords
{
  return self->_vocabularyWords;
}

- (NSOrderedSet)groupNameWords
{
  return self->_groupNameWords;
}

- (NSOrderedSet)thirdPartyContactWords
{
  return self->_thirdPartyContactWords;
}

- (NSOrderedSet)firstPartyContactWords
{
  return self->_firstPartyContactWords;
}

- (void)_populateUserDataFromItems:(id)a3 applicableSpeechCategories:(id)a4
{
  v32 = self;
  id v5 = a3;
  id v6 = a4;
  v37 = +[NSMutableOrderedSet orderedSet];
  v34 = +[NSMutableOrderedSet orderedSet];
  v35 = +[NSMutableOrderedSet orderedSet];
  v36 = +[NSMutableOrderedSet orderedSet];
  v38 = +[NSMutableDictionary dictionary];
  v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 136315650;
    v45 = "-[ESUserData _populateUserDataFromItems:applicableSpeechCategories:]";
    __int16 v46 = 2048;
    id v47 = [v5 count];
    __int16 v48 = 2112;
    id v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Processing %tu items for speech categories: %@.", buf, 0x20u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v16 = [v14 content];
        int v17 = [(id)objc_opt_class() itemType];

        if (v17 > 61351)
        {
          switch(v17)
          {
            case 61352:
              if (![v6 containsObject:@"\\NT-appcontact"]) {
                goto LABEL_25;
              }
              v18 = v14;
              v19 = v34;
              goto LABEL_23;
            case 63369:
              if (![v6 containsObject:@"\\NT-appcontact"]) {
                goto LABEL_25;
              }
              v18 = v14;
              v19 = v35;
              goto LABEL_23;
            case 61509:
              goto LABEL_17;
          }
LABEL_24:
          +[ESUserData _processVocabularyItem:vocabularyWords:](ESUserData, "_processVocabularyItem:vocabularyWords:", v14, v38, v32);
          goto LABEL_25;
        }
        if (v17 == 19668)
        {
LABEL_17:
          if (!objc_msgSend(v6, "containsObject:", @"\\NT-contact", v32)) {
            goto LABEL_25;
          }
          v18 = v14;
          v19 = v37;
LABEL_23:
          +[ESUserData _processContactItem:contactWords:](ESUserData, "_processContactItem:contactWords:", v18, v19, v32);
          goto LABEL_25;
        }
        if (v17 != 49066) {
          goto LABEL_24;
        }
        if ([v6 containsObject:@"\\NT-playlist"]) {
          +[ESUserData _processRadioItem:v14 radioWords:v36];
        }
LABEL_25:
      }
      id v11 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v11);
  }

  +[ESUserData _limitVocabularyWords:v38 toApplicableSpeechCategories:v6];
  [v38 enumerateKeysAndObjectsUsingBlock:&stru_100050CF8];
  v20 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    v30 = v20;
    id v31 = [v36 count];
    *(_DWORD *)buf = 136315394;
    v45 = "-[ESUserData _populateUserDataFromItems:applicableSpeechCategories:]";
    __int16 v46 = 2048;
    id v47 = v31;
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s Processed %tu radio entities.", buf, 0x16u);
  }
  +[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:](ESUserData, "_applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:", v37, v34, v35, v32);
  v21 = (void *)v33[1];
  v33[1] = v37;
  id v22 = v37;

  v23 = (void *)v33[2];
  v33[2] = v34;
  id v24 = v34;

  v25 = (void *)v33[3];
  v33[3] = v35;
  id v26 = v35;

  v27 = (void *)v33[5];
  v33[5] = v36;
  id v28 = v36;

  v29 = (void *)v33[4];
  v33[4] = v38;
}

- (ESUserData)initWithItems:(id)a3 applicableSpeechCategories:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ESUserData;
  v8 = [(ESUserData *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    [(ESUserData *)v8 _populateUserDataFromItems:v6 applicableSpeechCategories:v7];
    id v10 = v9;
  }

  return v9;
}

+ (id)_vocabularyLabelsForFieldType:(unsigned __int16)a3
{
  v3 = 0;
  if ((int)a3 <= 17040)
  {
    if ((int)a3 <= 7721)
    {
      switch(a3)
      {
        case 0x1E15u:
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-house";
          CFStringRef v6 = @"\\house-first";
          goto LABEL_63;
        case 0x1E16u:
        case 0x1E1Au:
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-device";
          CFStringRef v6 = @"\\device-first";
          goto LABEL_63;
        case 0x1E17u:
        case 0x1E1Bu:
        case 0x1E1Du:
          goto LABEL_64;
        case 0x1E18u:
          goto LABEL_46;
        case 0x1E19u:
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-scene";
          CFStringRef v6 = @"\\scene-first";
          goto LABEL_63;
        case 0x1E1Cu:
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-group";
          CFStringRef v6 = @"\\group-first";
          goto LABEL_63;
        case 0x1E1Eu:
          goto LABEL_11;
        default:
          if (a3 == 803)
          {
            v4 = [ESVocabularyLabel alloc];
            CFStringRef v5 = @"\\NT-device";
            CFStringRef v6 = @"\\carName-first";
          }
          else
          {
            if (a3 != 5598) {
              goto LABEL_64;
            }
            v4 = [ESVocabularyLabel alloc];
            CFStringRef v5 = @"\\NT-notefolder";
            CFStringRef v6 = @"\\notebookFolderTitle-first";
          }
          break;
      }
      goto LABEL_63;
    }
    if ((int)a3 > 14708)
    {
      if ((int)a3 > 16253)
      {
        if (a3 == 16254)
        {
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-payaccount";
          CFStringRef v6 = @"\\paymentsOrganizationName-first";
        }
        else
        {
          if (a3 != 17037) {
            goto LABEL_64;
          }
LABEL_46:
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-room";
          CFStringRef v6 = @"\\room-first";
        }
      }
      else if (a3 == 14709)
      {
        v4 = [ESVocabularyLabel alloc];
        CFStringRef v5 = @"\\NT-playlist";
        CFStringRef v6 = @"\\appAudiobookTitle-first";
      }
      else
      {
        if (a3 != 15575) {
          goto LABEL_64;
        }
        v4 = [ESVocabularyLabel alloc];
        CFStringRef v5 = @"\\NT-playlist";
        CFStringRef v6 = @"\\appShowTitle-first";
      }
      goto LABEL_63;
    }
    if ((int)a3 > 12998)
    {
      if ((a3 - 12999) >= 2)
      {
        if (a3 != 13887) {
          goto LABEL_64;
        }
        v4 = [ESVocabularyLabel alloc];
        CFStringRef v5 = @"\\NT-phototag";
        CFStringRef v6 = @"\\photoTags-first";
      }
      else
      {
        v4 = [ESVocabularyLabel alloc];
        CFStringRef v5 = @"\\NT-appvocab";
        CFStringRef v6 = @"\\unknown-first";
      }
      goto LABEL_63;
    }
    if (a3 != 7722)
    {
      int v8 = 12013;
      goto LABEL_39;
    }
    goto LABEL_49;
  }
  if ((int)a3 <= 32967)
  {
    if ((int)a3 > 25885)
    {
      if (a3 == 25886)
      {
        v4 = [ESVocabularyLabel alloc];
        CFStringRef v5 = @"\\NT-payaccount";
        CFStringRef v6 = @"\\paymentsAccountName-first";
      }
      else
      {
        if (a3 != 26515)
        {
          int v8 = 30601;
LABEL_39:
          if (a3 != v8) {
            goto LABEL_64;
          }
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-action";
          CFStringRef v6 = @"\\voiceCommandName-first";
          goto LABEL_63;
        }
        v4 = [ESVocabularyLabel alloc];
        CFStringRef v5 = @"\\NT-notetitle";
        CFStringRef v6 = @"\\notebookTitle-first";
      }
LABEL_63:
      v3 = [(ESVocabularyLabel *)v4 initWithSpeechCategoryName:v5 tagName:v6];
      goto LABEL_64;
    }
    if ((a3 - 18555) > 9)
    {
LABEL_10:
      if (a3 != 17041) {
        goto LABEL_64;
      }
LABEL_11:
      v4 = [ESVocabularyLabel alloc];
      CFStringRef v5 = @"\\NT-zone";
      CFStringRef v6 = @"\\zone-first";
      goto LABEL_63;
    }
    int v7 = 1 << (a3 - 123);
    if ((v7 & 0x181) == 0)
    {
      if ((v7 & 0x202) == 0) {
        goto LABEL_10;
      }
      goto LABEL_33;
    }
    goto LABEL_43;
  }
  if ((int)a3 > 42187)
  {
    if ((int)a3 > 42189)
    {
      if (a3 != 42190)
      {
        if (a3 == 44938)
        {
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-savedactivity";
          CFStringRef v6 = @"\\healthActivity-first";
        }
        else
        {
          if (a3 != 53485) {
            goto LABEL_64;
          }
          v4 = [ESVocabularyLabel alloc];
          CFStringRef v5 = @"\\NT-photoalbum";
          CFStringRef v6 = @"\\photoAlbumName-first";
        }
        goto LABEL_63;
      }
LABEL_33:
      v4 = [ESVocabularyLabel alloc];
      CFStringRef v5 = @"\\NT-artist";
      CFStringRef v6 = @"\\artist-first";
      goto LABEL_63;
    }
    if (a3 != 42188)
    {
      v4 = [ESVocabularyLabel alloc];
      CFStringRef v5 = @"\\NT-playlist";
      CFStringRef v6 = @"\\podcastTitle-first";
      goto LABEL_63;
    }
LABEL_43:
    v4 = [ESVocabularyLabel alloc];
    CFStringRef v5 = @"\\NT-playlist";
    CFStringRef v6 = @"\\playlist-first";
    goto LABEL_63;
  }
  if ((int)a3 > 36440)
  {
    if (a3 != 36441)
    {
      if (a3 != 38254) {
        goto LABEL_64;
      }
LABEL_49:
      v4 = [ESVocabularyLabel alloc];
      CFStringRef v5 = @"\\NT-artist";
      CFStringRef v6 = @"\\appMusicArtistName-first";
      goto LABEL_63;
    }
LABEL_50:
    v4 = [ESVocabularyLabel alloc];
    CFStringRef v5 = @"\\NT-appname";
    CFStringRef v6 = @"\\app-first";
    goto LABEL_63;
  }
  if (a3 == 32968)
  {
    v4 = [ESVocabularyLabel alloc];
    CFStringRef v5 = @"\\NT-playlist";
    CFStringRef v6 = @"\\appPlaylistTitle-first";
    goto LABEL_63;
  }
  if (a3 == 36439) {
    goto LABEL_50;
  }
LABEL_64:

  return v3;
}

+ (void)_addVocabWord:(id)a3 vocabularyLabels:(id)a4 toVocabularyWords:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    id v10 = [v8 objectForKeyedSubscript:v7];

    if (v10)
    {
      id v11 = [v9 objectForKeyedSubscript:v7];
      [v11 addObject:v12];
    }
    else
    {
      id v11 = +[NSMutableOrderedSet orderedSetWithObject:v12];
      [v9 setObject:v11 forKeyedSubscript:v7];
    }
  }
}

+ (void)_processVocabularyItem:(id)a3 vocabularyWords:(id)a4
{
  id v5 = a4;
  CFStringRef v6 = [a3 content];
  id v12 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010670;
  v10[3] = &unk_100050D20;
  id v7 = v5;
  id v11 = v7;
  [v6 recursivelyEnumerateFieldsWithError:&v12 usingBlock:v10];
  id v8 = v12;
  if (v8)
  {
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[ESUserData _processVocabularyItem:vocabularyWords:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Error enumerating CCItemFields: %@", buf, 0x16u);
    }
  }
}

+ (void)_processRadioItem:(id)a3 radioWords:(id)a4
{
  id v5 = a4;
  CFStringRef v6 = [a3 content];
  id v12 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001095C;
  v10[3] = &unk_100050D20;
  id v7 = v5;
  id v11 = v7;
  [v6 recursivelyEnumerateFieldsWithError:&v12 usingBlock:v10];
  id v8 = v12;

  if (v8)
  {
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[ESUserData _processRadioItem:radioWords:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Error enumerating CCItemFields: %@", buf, 0x16u);
    }
  }
}

+ (void)_applyContactLimitsToFirstPartyContacts:(id)a3 thirdPartyContacts:(id)a4 groupNames:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  if ([v9 count])
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [v9 objectAtIndex:v13];
      [v11 addObject:v14];

      unint64_t v15 = v13 + 1;
      id v16 = [v9 count];
      if (v13 > 0x62) {
        break;
      }
      ++v13;
    }
    while (v15 < (unint64_t)v16);
    uint64_t v17 = 5000 - v15;
  }
  else
  {
    uint64_t v17 = 5000;
  }
  if ([v7 count])
  {
    uint64_t v18 = 0;
    while (v17)
    {
      --v17;
      v19 = [v7 objectAtIndex:v18];
      [v10 addObject:v19];

      if (++v18 >= (unint64_t)[v7 count]) {
        goto LABEL_13;
      }
    }
    uint64_t v17 = -1;
  }
LABEL_13:
  if ([v8 count])
  {
    uint64_t v20 = 0;
    uint64_t v21 = v17 & (v17 >> 63);
    uint64_t v35 = v21 - 1;
    uint64_t v22 = v17 - v21;
    while (v20 != v22)
    {
      --v17;
      v23 = [v8 objectAtIndex:v20];
      [v12 addObject:v23];

      if (++v20 >= (unint64_t)[v8 count]) {
        goto LABEL_19;
      }
    }
    uint64_t v17 = v35;
  }
LABEL_19:
  if ((unint64_t)[v9 count] >= 0x65 && v17 >= 1)
  {
    unint64_t v24 = 101;
    do
    {
      v25 = [v9 objectAtIndex:v24 - 1];
      [v11 addObject:v25];

      if (v24 >= (unint64_t)[v9 count]) {
        break;
      }
      ++v24;
    }
    while ((unint64_t)v17-- > 1);
  }
  v27 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v28 = v27;
    *(_DWORD *)buf = 136315650;
    v37 = "+[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]";
    __int16 v38 = 2048;
    id v39 = [v7 count];
    __int16 v40 = 2048;
    id v41 = [v10 count];
    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s Processed first party contacts: %tu (accepted=%tu)", buf, 0x20u);

    v27 = AFSiriLogContextSpeech;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v29 = v27;
    id v30 = [v8 count];
    id v31 = [v12 count];
    *(_DWORD *)buf = 136315650;
    v37 = "+[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]";
    __int16 v38 = 2048;
    id v39 = v30;
    __int16 v40 = 2048;
    id v41 = v31;
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s Processed third party contacts: %tu (accepted=%tu)", buf, 0x20u);

    v27 = AFSiriLogContextSpeech;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v32 = v27;
    id v33 = [v9 count];
    id v34 = [v11 count];
    *(_DWORD *)buf = 136315650;
    v37 = "+[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]";
    __int16 v38 = 2048;
    id v39 = v33;
    __int16 v40 = 2048;
    id v41 = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s Processed group names: %tu (accepted=%tu)", buf, 0x20u);
  }
  [v7 removeAllObjects];
  [v7 addObjectsFromArray:v10];
  [v8 removeAllObjects];
  [v8 addObjectsFromArray:v12];
  [v9 removeAllObjects];
  [v9 addObjectsFromArray:v11];
}

+ (void)_processContactItem:(id)a3 contactWords:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [v6 content];
  id v19 = 0;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100011038;
  uint64_t v17 = &unk_100050D20;
  id v9 = v7;
  id v18 = v9;
  [v8 recursivelyEnumerateFieldsWithError:&v19 usingBlock:&v14];
  id v10 = v19;

  LODWORD(v8) = objc_msgSend(v6, "isBoosted", v14, v15, v16, v17);
  id v11 = [ESUserDataContactWord alloc];
  if (v8)
  {
    id v12 = [(ESUserDataContactWord *)v11 initWithComponents:v9 frequency:2];
    [v5 insertObject:v12 atIndex:0];
  }
  else
  {
    id v12 = [(ESUserDataContactWord *)v11 initWithComponents:v9 frequency:1];
    [v5 addObject:v12];
  }

  if (v10)
  {
    unint64_t v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "+[ESUserData _processContactItem:contactWords:]";
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Error enumerating CCItemFields: %@", buf, 0x16u);
    }
  }
}

+ (void)_limitVocabularyWords:(id)a3 toApplicableSpeechCategories:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(v5, "allKeys", 0);
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v13 = [v12 speechCategoryName];
        unsigned __int8 v14 = [v6 containsObject:v13];

        if ((v14 & 1) == 0) {
          [v5 removeObjectForKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

@end