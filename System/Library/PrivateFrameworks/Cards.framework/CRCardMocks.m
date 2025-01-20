@interface CRCardMocks
+ (id)basicMovieCard;
+ (id)formattedTextWithImage:(id)a3;
+ (id)formattedTextWithString:(id)a3;
+ (id)formattedTextsForStringsAndImages:(id)a3;
+ (id)mockAsyncCardWithCard:(id)a3;
+ (id)mockCards;
+ (id)mockCardsDeserialized;
+ (id)movieCard;
+ (id)responseCard;
+ (id)rosterCard;
+ (id)tableAlignmentSchemaFromTextAlignments:(id)a3 columnsAreEqualWidth:(id)a4;
+ (id)translationCard;
@end

@implementation CRCardMocks

+ (id)mockCardsDeserialized
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend(a1, "mockCards", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) data];
        v10 = +[CRPBSerialization cardForData:v9 messageName:@"searchfoundation.Card"];

        if (v10)
        {
          [v3 addObject:v10];
          v11 = [a1 mockAsyncCardWithCard:v10];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)mockCards
{
  v8[3] = *MEMORY[0x263EF8340];
  id v3 = +[CRCardMocks movieCard];
  v4 = +[CRCardMocks translationCard];
  v8[1] = v4;
  uint64_t v5 = [a1 rosterCard];
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)translationCard
{
  v19[1] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  id v3 = objc_opt_new();
  v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  [v5 setMaxLines:0];
  uint64_t v6 = objc_opt_new();
  [v5 setText:v6];

  uint64_t v7 = [v5 text];
  [v7 setText:@"Hello"];

  v8 = objc_opt_new();
  [v8 setMaxLines:0];
  v9 = objc_opt_new();
  [v8 setText:v9];

  v10 = [v8 text];
  [v10 setText:@"你好"];

  v11 = objc_opt_new();
  [v11 setMaxLines:0];
  v12 = objc_opt_new();
  [v11 setText:v12];

  long long v13 = [v11 text];
  [v13 setText:@"Nǐ hǎo"];

  [v4 setDetailText:v5];
  [v4 setTitle:v8];
  [v4 setSubtitle:v11];
  [v2 setType:18];
  [v3 setAudioPlaybackCardSection:v4];
  [v2 setValue:v3];
  long long v14 = objc_opt_new();
  [v14 setTitle:@"Translation"];
  id v15 = objc_alloc(MEMORY[0x263EFF980]);
  v19[0] = v2;
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  v17 = (void *)[v15 initWithArray:v16];
  [v14 setCardSections:v17];

  return v14;
}

+ (id)movieCard
{
  v143[11] = *MEMORY[0x263EF8340];
  v136 = objc_opt_new();
  [v136 setTitle:@"Marvel’s the Avengers"];
  [v136 setSubtitle:@"Marvel Studios (2012)"];
  [v136 setContentAdvisory:@"PG-13"];
  id v135 = objc_alloc_init(MEMORY[0x263F67B50]);
  v2 = [MEMORY[0x263F1C6B0] imageNamed:@"tomato"];
  id v3 = UIImagePNGRepresentation(v2);
  [v135 setImageData:v3];

  v4 = objc_opt_new();
  [v4 setTitle:@"Runtime"];
  id v5 = objc_alloc_init(MEMORY[0x263F67BC8]);
  [v4 setContent:v5];

  v129 = v4;
  uint64_t v6 = [v4 content];
  [v6 setText:@"2h 23m"];

  uint64_t v7 = objc_opt_new();
  [v7 setTitle:@"Director"];
  id v8 = objc_alloc_init(MEMORY[0x263F67BC8]);
  [v7 setContent:v8];

  v128 = v7;
  v9 = [v7 content];
  [v9 setText:@"Joss Whedon"];

  v10 = objc_opt_new();
  [v10 setTitle:@"Starring"];
  id v11 = objc_alloc_init(MEMORY[0x263F67BC8]);
  [v10 setContent:v11];

  v127 = v10;
  v12 = [v10 content];
  [v12 setText:@"Robert Downey Jr.\nChris Evans\nMark Ruffalo\nChris Hemsworth\nScarlett Johansson"];

  long long v13 = objc_opt_new();
  [v13 setLabel:@"ShowTime"];
  long long v14 = (void *)MEMORY[0x263F67B80];
  id v15 = [NSURL URLWithString:@"http://www.showtime.com"];
  long long v16 = [v14 punchoutWithURL:v15];
  v126 = v13;
  [v13 setPunchout:v16];

  v17 = objc_opt_new();
  uint64_t v18 = objc_opt_new();
  [v17 setActionItem:v18];

  v19 = [v17 actionItem];
  [v19 setLabel:@"$3.99"];

  [v17 setSublabel:@"Rent on iTunes"];
  v20 = (void *)MEMORY[0x263F67B80];
  v21 = [NSURL URLWithString:@"http://www.apple.com/itunes"];
  v22 = [v20 punchoutWithURL:v21];
  v23 = [v17 actionItem];
  [v23 setPunchout:v22];

  v24 = [v17 actionItem];
  [v24 setApplicationBundleIdentifier:@"533654020"];

  v125 = v17;
  [v17 setOfferIdentifier:@"HDVOD"];
  v25 = objc_opt_new();
  v26 = objc_opt_new();
  [v25 setActionItem:v26];

  v27 = [v25 actionItem];
  [v27 setLabel:@"$19.99"];

  [v25 setSublabel:@"Buy with iTunes Extras"];
  v28 = (void *)MEMORY[0x263F67B80];
  v29 = [NSURL URLWithString:@"http://www.apple.com/itunes"];
  v30 = [v28 punchoutWithURL:v29];
  v31 = [v25 actionItem];
  [v31 setPunchout:v30];

  v32 = [v25 actionItem];
  [v32 setApplicationBundleIdentifier:@"533654020"];

  v124 = v25;
  [v25 setOfferIdentifier:@"HDBUY"];
  v33 = objc_opt_new();
  [v33 setTitle:@"Description"];
  v34 = [MEMORY[0x263F67BC8] textWithString:@"When Thor's evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of SHIELD, initiates a superhero recruitment effort to defeat the unprecedented threat to Earth."];
  [v33 setDescriptionText:v34];

  v134 = v33;
  v35 = [v33 descriptionText];
  [v35 setMaxLines:3];

  [v33 setExpandText:@"more"];
  v137 = objc_opt_new();
  [v137 setTitle:@"Trailers"];
  v36 = objc_opt_new();
  [v36 setTitle:@"Trailer"];
  v37 = (void *)MEMORY[0x263F67B50];
  v38 = [MEMORY[0x263F1C6B0] imageNamed:@"trailer1"];
  v39 = UIImagePNGRepresentation(v38);
  v40 = [v37 imageWithData:v39];
  [v36 setThumbnail:v40];

  v41 = (void *)MEMORY[0x263F67B80];
  v42 = [NSURL URLWithString:@"http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-fte1_a720p.m4v"];
  v43 = [v41 punchoutWithURL:v42];
  [v36 setPunchout:v43];

  v44 = objc_opt_new();
  [v44 setTitle:@"Trailer 2"];
  v45 = (void *)MEMORY[0x263F67B50];
  v46 = [MEMORY[0x263F1C6B0] imageNamed:@"trailer2"];
  v47 = UIImagePNGRepresentation(v46);
  v48 = [v45 imageWithData:v47];
  [v44 setThumbnail:v48];

  v49 = (void *)MEMORY[0x263F67B80];
  v50 = [NSURL URLWithString:@"http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr2_a720p.m4v"];
  v51 = [v49 punchoutWithURL:v50];
  [v44 setPunchout:v51];

  v52 = objc_opt_new();
  [v52 setTitle:@"Trailer 3"];
  id v53 = objc_alloc_init(MEMORY[0x263F67B50]);
  [v52 setThumbnail:v53];

  v54 = [MEMORY[0x263F1C6B0] imageNamed:@"trailer3"];
  v55 = UIImagePNGRepresentation(v54);
  v56 = [v52 thumbnail];
  [v56 setImageData:v55];

  v57 = (void *)MEMORY[0x263F67B80];
  v58 = [NSURL URLWithString:@"http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr1_a720p.m4v"];
  v59 = [v57 punchoutWithURL:v58];
  [v52 setPunchout:v59];

  v121 = v52;
  v122 = v44;
  v123 = v36;
  v60 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v36, v44, v52, 0);
  [v137 setMediaItems:v60];

  v133 = objc_opt_new();
  [v133 setTitle:@"Top Critics' Reviews"];
  v132 = objc_opt_new();
  v61 = [MEMORY[0x263F67B90] textWithString:@"A lot of fun."];
  [v132 setLeadingText:v61];

  [v132 setImage:v135];
  v131 = objc_opt_new();
  v62 = [MEMORY[0x263F67B90] textWithString:@"Downey's Stark/Iron Man steals the show because the actor is capable of making the tritest dialogue sound wonderfully witty, but the CGI effects are amazing and, despite its length, the film is very enjoyable."];
  [v131 setLeadingText:v62];

  [v131 setImage:v135];
  v130 = objc_opt_new();
  [v130 setTitle:@"Available on:"];
  v63 = objc_opt_new();
  v64 = [MEMORY[0x263F67B90] textWithString:@"iTunes Store"];
  [v63 setLeadingText:v64];

  v65 = [v63 leadingText];
  v66 = [v65 text];
  [v66 setMaxLines:1];

  v67 = (void *)MEMORY[0x263F67B50];
  v68 = [MEMORY[0x263F1C6B0] imageNamed:@"iTunes"];
  v69 = UIImagePNGRepresentation(v68);
  v70 = [v67 imageWithData:v69];
  [v63 setImage:v70];

  id v71 = objc_alloc_init(MEMORY[0x263F67B80]);
  [v71 setBundleIdentifier:@"com.apple.mobilenotes"];
  v119 = v71;
  v72 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v71, 0);
  [v63 setPunchoutOptions:v72];

  v73 = objc_opt_new();
  v74 = [MEMORY[0x263F67B90] textWithString:@"Netflix"];
  [v73 setLeadingText:v74];

  v75 = [v73 leadingText];
  v76 = [v75 text];
  [v76 setMaxLines:1];

  v77 = (void *)MEMORY[0x263F67B50];
  v78 = [MEMORY[0x263F1C6B0] imageNamed:@"netflix"];
  v79 = UIImagePNGRepresentation(v78);
  v80 = [v77 imageWithData:v79];
  [v73 setImage:v80];

  v81 = (void *)MEMORY[0x263EFF980];
  v82 = (void *)MEMORY[0x263F67B80];
  v83 = [NSURL URLWithString:@"http://www.netflix.com"];
  v84 = [v82 punchoutWithURL:v83];
  v85 = objc_msgSend(v81, "arrayWithObjects:", v84, 0);
  [v73 setPunchoutOptions:v85];

  v86 = objc_opt_new();
  v87 = [MEMORY[0x263F67B90] textWithString:@"Hulu Plus"];
  [v86 setLeadingText:v87];

  v88 = [v86 leadingText];
  v89 = [v88 text];
  [v89 setMaxLines:1];

  v90 = (void *)MEMORY[0x263F67B50];
  v91 = [MEMORY[0x263F1C6B0] imageNamed:@"hulu"];
  v92 = UIImagePNGRepresentation(v91);
  v93 = [v90 imageWithData:v92];
  [v86 setImage:v93];

  v94 = (void *)MEMORY[0x263EFF980];
  v95 = (void *)MEMORY[0x263F67B80];
  v96 = [NSURL URLWithString:@"http://www.hulu.com"];
  v97 = [v95 punchoutWithURL:v96];
  v98 = objc_msgSend(v94, "arrayWithObjects:", v97, 0);
  [v86 setPunchoutOptions:v98];

  v99 = objc_opt_new();
  v100 = [MEMORY[0x263F67B90] textWithString:@"More Info on Wikipedia…"];
  [v99 setLeadingText:v100];

  v101 = (void *)MEMORY[0x263EFF980];
  v102 = (void *)MEMORY[0x263F67B80];
  v103 = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Main_Page"];
  v104 = [v102 punchoutWithURL:v103];
  v105 = objc_msgSend(v101, "arrayWithObjects:", v104, 0);
  [v99 setPunchoutOptions:v105];

  v118 = objc_opt_new();
  [v118 setTitle:@"Movie"];
  v143[0] = v136;
  v143[1] = v134;
  v143[2] = v137;
  v143[3] = v133;
  v143[4] = v132;
  v143[5] = v131;
  v143[6] = v130;
  v143[7] = v63;
  v120 = v63;
  v143[8] = v73;
  v143[9] = v86;
  v117 = v99;
  v143[10] = v99;
  v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:11];
  id v107 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v108 = v106;
  uint64_t v109 = [v108 countByEnumeratingWithState:&v138 objects:v142 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v139;
    do
    {
      for (uint64_t i = 0; i != v110; ++i)
      {
        if (*(void *)v139 != v111) {
          objc_enumerationMutation(v108);
        }
        uint64_t v113 = *(void *)(*((void *)&v138 + 1) + 8 * i);
        v114 = objc_opt_new();
        v115 = objc_opt_new();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v114 setType:8];
          [v115 setRichTitleCardSection:v113];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v114 setType:5];
            [v115 setMediaInfoCardSection:v113];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v114 setType:2];
              [v115 setDescriptionCardSection:v113];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v114 setType:6];
                [v115 setMediaPlayerCardSection:v113];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v114 setType:16];
                  [v115 setTitleCardSection:v113];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v114 setType:9];
                    [v115 setRowCardSection:v113];
                  }
                }
              }
            }
          }
        }
        [v114 setValue:v115];
        [v107 addObject:v114];
      }
      uint64_t v110 = [v108 countByEnumeratingWithState:&v138 objects:v142 count:16];
    }
    while (v110);
  }

  [v118 setCardSections:v107];
  return v118;
}

+ (id)responseCard
{
  v30[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F67B88]);
  id v3 = objc_alloc_init(MEMORY[0x263F67B18]);
  [v3 setCatIdentifier:@"success#happyCat"];
  v23 = v3;
  [v2 setCatModel:v3];
  id v4 = objc_alloc_init(MEMORY[0x263F67B88]);
  id v5 = objc_alloc_init(MEMORY[0x263F67B18]);
  [v5 setCatIdentifier:@"success#happyCat"];
  v22 = v5;
  [v4 setCatModel:v5];
  id v6 = objc_alloc_init(MEMORY[0x263F67B88]);
  id v7 = objc_alloc_init(MEMORY[0x263F67B18]);
  [v7 setCatIdentifier:@"fail#sadCat"];
  v20 = v7;
  [v6 setCatModel:v7];
  v24 = v2;
  v30[0] = v2;
  v30[1] = v4;
  v21 = v6;
  v30[2] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v16 = objc_opt_new();
        v17 = objc_opt_new();
        [v16 setType:53];
        [v17 setResponseWrapperCardSection:v15];
        [v16 setValue:v17];
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  id v18 = objc_alloc_init(MEMORY[0x263F67B20]);
  [v18 setTitle:@"Response"];
  [v18 setCardSections:v9];

  return v18;
}

+ (id)basicMovieCard
{
  v142[3] = *MEMORY[0x263EF8340];
  v124 = objc_alloc_init(CRBasicCard);
  v133 = objc_opt_new();
  [v133 setTitle:@"Marvel’s the Avengers"];
  [v133 setSubtitle:@"Marvel Studios (2012)"];
  [v133 setContentAdvisory:@"PG-13"];
  id v2 = (void *)MEMORY[0x263F678C8];
  id v3 = [MEMORY[0x263F1C6B0] imageNamed:@"tomato"];
  id v4 = UIImagePNGRepresentation(v3);
  v129 = [v2 imageWithData:v4];

  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = (void *)MEMORY[0x263F678C8];
  id v8 = [MEMORY[0x263F1C6B0] imageNamed:@"avengers-big"];
  id v9 = UIImagePNGRepresentation(v8);
  id v10 = [v7 imageWithData:v9];
  [v6 setThumbnail:v10];

  v123 = v6;
  [v6 setReviewGlyph:v129];
  [v6 setReviewText:@"92%"];
  [v5 setMediaItem:v6];
  uint64_t v11 = objc_opt_new();
  [v11 setTitle:@"Runtime"];
  uint64_t v12 = [MEMORY[0x263F67A90] textWithString:@"2h 23m"];
  v122 = v11;
  [v11 setContent:v12];

  uint64_t v13 = objc_opt_new();
  [v13 setTitle:@"Director"];
  long long v14 = [MEMORY[0x263F67A90] textWithString:@"Joss Whedon"];
  v121 = v13;
  [v13 setContent:v14];

  v120 = objc_opt_new();
  [v120 setTitle:@"Starring"];
  uint64_t v15 = [MEMORY[0x263F67A90] textWithString:@"Robert Downey Jr.\nChris Evans\nMark Ruffalo\nChris Hemsworth\nScarlett Johansson"];
  [v120 setContent:v15];

  v142[0] = v11;
  v142[1] = v13;
  v142[2] = v120;
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:3];
  [v5 setDetails:v16];

  v119 = objc_opt_new();
  [v119 setLabel:@"ShowTime"];
  v17 = (void *)MEMORY[0x263F679B0];
  id v18 = [NSURL URLWithString:@"http://www.showtime.com"];
  v19 = [v17 punchoutWithURL:v18];
  [v119 setPunchout:v19];

  v132 = v5;
  [v5 setPlayAction:v119];
  v20 = objc_opt_new();
  [v20 setLabel:@"$3.99"];
  [v20 setSublabel:@"Rent on iTunes"];
  v21 = (void *)MEMORY[0x263F679B0];
  v22 = [NSURL URLWithString:@"http://www.apple.com/itunes"];
  v23 = [v21 punchoutWithURL:v22];
  [v20 setPunchout:v23];

  [v20 setApplicationBundleIdentifier:@"533654020"];
  v24 = v20;
  v118 = v20;
  [v20 setOfferIdentifier:@"HDVOD"];
  long long v25 = objc_opt_new();
  [v25 setLabel:@"$19.99"];
  v117 = v25;
  [v25 setSublabel:@"Buy with iTunes Extras"];
  long long v26 = (void *)MEMORY[0x263F679B0];
  long long v27 = [NSURL URLWithString:@"http://www.apple.com/itunes"];
  long long v28 = [v26 punchoutWithURL:v27];
  [v25 setPunchout:v28];

  [v25 setApplicationBundleIdentifier:@"533654020"];
  [v25 setOfferIdentifier:@"HDBUY"];
  v141[0] = v24;
  v141[1] = v25;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:2];
  [v5 setOffers:v29];

  v30 = objc_opt_new();
  [v30 setTitle:@"Description"];
  v31 = [MEMORY[0x263F67A90] textWithString:@"When Thor's evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of SHIELD, initiates a superhero recruitment effort to defeat the unprecedented threat to Earth."];
  [v30 setDescriptionText:v31];

  v131 = v30;
  v32 = [v30 descriptionText];
  [v32 setMaxLines:3];

  [v30 setExpandText:@"more"];
  v134 = objc_opt_new();
  [v134 setTitle:@"Trailers"];
  v33 = objc_opt_new();
  [v33 setTitle:@"Trailer"];
  v34 = (void *)MEMORY[0x263F678C8];
  v35 = [MEMORY[0x263F1C6B0] imageNamed:@"trailer1"];
  v36 = UIImagePNGRepresentation(v35);
  v37 = [v34 imageWithData:v36];
  [v33 setThumbnail:v37];

  v38 = (void *)MEMORY[0x263F679B0];
  v39 = [NSURL URLWithString:@"http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-fte1_a720p.m4v"];
  v40 = [v38 punchoutWithURL:v39];
  v116 = v33;
  [v33 setPunchout:v40];

  v41 = objc_opt_new();
  [v41 setTitle:@"Trailer 2"];
  v42 = (void *)MEMORY[0x263F678C8];
  v43 = [MEMORY[0x263F1C6B0] imageNamed:@"trailer2"];
  v44 = UIImagePNGRepresentation(v43);
  v45 = [v42 imageWithData:v44];
  [v41 setThumbnail:v45];

  v46 = (void *)MEMORY[0x263F679B0];
  v47 = [NSURL URLWithString:@"http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr2_a720p.m4v"];
  v48 = [v46 punchoutWithURL:v47];
  v115 = v41;
  [v41 setPunchout:v48];

  v49 = objc_opt_new();
  [v49 setTitle:@"Trailer 3"];
  v50 = (void *)MEMORY[0x263F678C8];
  v51 = [MEMORY[0x263F1C6B0] imageNamed:@"trailer3"];
  v52 = UIImagePNGRepresentation(v51);
  id v53 = [v50 imageWithData:v52];
  [v49 setThumbnail:v53];

  v54 = (void *)MEMORY[0x263F679B0];
  v55 = [NSURL URLWithString:@"http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr1_a720p.m4v"];
  v56 = [v54 punchoutWithURL:v55];
  v114 = v49;
  [v49 setPunchout:v56];

  v140[0] = v33;
  v140[1] = v41;
  v140[2] = v49;
  v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:3];
  [v134 setMediaItems:v57];

  v130 = objc_opt_new();
  [v130 setTitle:@"Top Critics' Reviews"];
  v128 = objc_opt_new();
  v58 = [MEMORY[0x263F679F0] textWithString:@"A lot of fun."];
  [v128 setLeadingText:v58];

  [v128 setImage:v129];
  v127 = objc_opt_new();
  v59 = [MEMORY[0x263F679F0] textWithString:@"Downey's Stark/Iron Man steals the show because the actor is capable of making the tritest dialogue sound wonderfully witty, but the CGI effects are amazing and, despite its length, the film is very enjoyable."];
  [v127 setLeadingText:v59];

  [v127 setImage:v129];
  v126 = objc_opt_new();
  [v126 setTitle:@"Available on:"];
  v60 = objc_opt_new();
  v61 = [MEMORY[0x263F679F0] textWithString:@"iTunes Store"];
  [v60 setLeadingText:v61];

  v62 = [v60 leadingText];
  [v62 setMaxLines:1];

  v63 = (void *)MEMORY[0x263F678C8];
  v64 = [MEMORY[0x263F1C6B0] imageNamed:@"iTunes"];
  v65 = UIImagePNGRepresentation(v64);
  v66 = [v63 imageWithData:v65];
  v125 = v60;
  [v60 setImage:v66];

  id v113 = objc_alloc_init(MEMORY[0x263F679B0]);
  [v113 setBundleIdentifier:@"com.apple.mobilesafari"];
  id v139 = v113;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v139 count:1];
  [v60 setPunchoutOptions:v67];

  v68 = objc_opt_new();
  v69 = [MEMORY[0x263F679F0] textWithString:@"Netflix"];
  [v68 setLeadingText:v69];

  v70 = [v68 leadingText];
  [v70 setMaxLines:1];

  id v71 = (void *)MEMORY[0x263F678C8];
  v72 = [MEMORY[0x263F1C6B0] imageNamed:@"netflix"];
  v73 = UIImagePNGRepresentation(v72);
  v74 = [v71 imageWithData:v73];
  v112 = v68;
  [v68 setImage:v74];

  v75 = (void *)MEMORY[0x263F679B0];
  v76 = [NSURL URLWithString:@"http://www.netflix.com"];
  v77 = [v75 punchoutWithURL:v76];
  long long v138 = v77;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v138 count:1];
  [v68 setPunchoutOptions:v78];

  v79 = objc_opt_new();
  v80 = [MEMORY[0x263F679F0] textWithString:@"Hulu Plus"];
  [v79 setLeadingText:v80];

  v81 = [v79 leadingText];
  [v81 setMaxLines:1];

  v82 = (void *)MEMORY[0x263F678C8];
  v83 = [MEMORY[0x263F1C6B0] imageNamed:@"hulu"];
  v84 = UIImagePNGRepresentation(v83);
  v85 = [v82 imageWithData:v84];
  [v79 setImage:v85];

  v86 = (void *)MEMORY[0x263F679B0];
  v87 = [NSURL URLWithString:@"http://www.hulu.com"];
  v88 = [v86 punchoutWithURL:v87];
  v137 = v88;
  v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
  v90 = v79;
  [v79 setPunchoutOptions:v89];

  v91 = objc_opt_new();
  v92 = [MEMORY[0x263F679F0] textWithString:@"More Info on Wikipedia…"];
  [v91 setLeadingText:v92];

  v93 = (void *)MEMORY[0x263F679B0];
  v94 = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Main_Page"];
  v95 = [v93 punchoutWithURL:v94];
  v136 = v95;
  v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
  v106 = v91;
  [v91 setPunchoutOptions:v96];

  uint64_t v111 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v133];
  v135[0] = v111;
  uint64_t v110 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v132];
  v135[1] = v110;
  uint64_t v109 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v131];
  v135[2] = v109;
  id v108 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v134];
  v135[3] = v108;
  id v107 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v130];
  v135[4] = v107;
  v97 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v128];
  v135[5] = v97;
  v98 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v127];
  v135[6] = v98;
  v99 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v126];
  v135[7] = v99;
  v100 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v125];
  v135[8] = v100;
  v101 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v112];
  v135[9] = v101;
  v102 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v90];
  v135[10] = v102;
  v103 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v91];
  v135[11] = v103;
  v104 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:12];
  [(CRBasicCard *)v124 setCardSections:v104];

  return v124;
}

+ (id)rosterCard
{
  v43[14] = *MEMORY[0x263EF8340];
  v40 = objc_opt_new();
  id v3 = objc_opt_new();
  [v40 setText:v3];

  id v4 = [v40 text];
  [v4 setText:@"2014-2015 Season"];

  v37 = objc_opt_new();
  id v5 = objc_opt_new();
  [v5 setTitle:@"Seahawks Roster"];
  [v5 setIsCentered:1];
  v39 = objc_opt_new();
  id v6 = [MEMORY[0x263F1C6B0] imageNamed:@"Seahawks"];
  id v7 = UIImagePNGRepresentation(v6);
  [v39 setImageData:v7];

  v38 = v5;
  [v5 setTitleImage:v39];
  v42 = objc_opt_new();
  v36 = objc_opt_new();
  [v42 setType:8];
  [v36 setRichTitleCardSection:v5];
  [v42 setValue:v36];
  id v8 = objc_opt_new();
  id v9 = [a1 tableAlignmentSchemaFromTextAlignments:&unk_26DB13190 columnsAreEqualWidth:0];
  [v8 setAlignmentSchema:v9];

  id v10 = [a1 formattedTextsForStringsAndImages:&unk_26DB131A8];
  uint64_t v11 = (void *)[v10 mutableCopy];
  [v8 setDatas:v11];

  v35 = v8;
  objc_msgSend(v8, "setTableIdentifier:");
  v41 = objc_opt_new();
  v34 = objc_opt_new();
  [v41 setType:13];
  [v34 setTableHeaderRowCardSection:v8];
  [v41 setValue:v34];
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [a1 formattedTextsForStringsAndImages:&unk_26DB131C0];
  [v12 setDatas:v13];

  v33 = v12;
  [v12 setTableIdentifier:@"Roster"];
  long long v14 = objc_opt_new();
  v32 = objc_opt_new();
  [v14 setType:14];
  [v32 setTableRowCardSection:v12];
  [v14 setValue:v32];
  uint64_t v15 = objc_opt_new();
  long long v16 = [a1 formattedTextsForStringsAndImages:&unk_26DB131D8];
  [v15 setDatas:v16];

  v17 = v15;
  v31 = v15;
  [v15 setTableIdentifier:@"Roster"];
  id v18 = objc_opt_new();
  v30 = objc_opt_new();
  [v18 setType:14];
  [v30 setTableRowCardSection:v17];
  [v18 setValue:v30];
  v19 = objc_opt_new();
  v20 = [a1 formattedTextsForStringsAndImages:&unk_26DB131F0];
  [v19 setDatas:v20];

  [v19 setTableIdentifier:@"Roster"];
  v21 = objc_opt_new();
  v22 = objc_opt_new();
  [v21 setType:14];
  [v22 setTableRowCardSection:v19];
  [v21 setValue:v22];
  v23 = objc_opt_new();
  v24 = [a1 formattedTextsForStringsAndImages:&unk_26DB13208];
  [v23 setDatas:v24];

  [v23 setTableIdentifier:@"Roster"];
  long long v25 = objc_opt_new();
  long long v26 = objc_opt_new();
  [v25 setType:14];
  [v26 setTableRowCardSection:v23];
  [v25 setValue:v26];
  v43[0] = v42;
  v43[1] = v41;
  v43[2] = v14;
  v43[3] = v18;
  v43[4] = v21;
  v43[5] = v25;
  v43[6] = v14;
  v43[7] = v18;
  v43[8] = v21;
  v43[9] = v25;
  v43[10] = v14;
  v43[11] = v18;
  v43[12] = v21;
  v43[13] = v25;
  long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:14];
  long long v28 = (void *)[v27 mutableCopy];
  [v37 setCardSections:v28];

  [v37 setTitle:@"Roster"];
  return v37;
}

+ (id)tableAlignmentSchemaFromTextAlignments:(id)a3 columnsAreEqualWidth:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v19 = objc_opt_new();
  id v7 = objc_opt_new();
  if ([v5 count])
  {
    int v8 = 0;
    unint64_t v9 = 0;
    do
    {
      id v10 = objc_opt_new();
      uint64_t v11 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 unsignedIntegerValue];

      [v10 setDataAlignment:v12];
      BOOL v13 = v12 == 0;
      BOOL v14 = v12 == 0;
      int v15 = !v13;
      if ((v8 & v15) != 0) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 0;
      }
      [v10 setColumnAlignment:v16];
      if ([v6 count] <= v9)
      {
        [v10 setIsEqualWidth:0];
      }
      else
      {
        v17 = [v6 objectAtIndexedSubscript:v9];
        objc_msgSend(v10, "setIsEqualWidth:", objc_msgSend(v17, "BOOLValue"));
      }
      v8 |= v14;
      [v7 addObject:v10];

      ++v9;
    }
    while (v9 < [v5 count]);
  }
  [v19 setTableColumnAlignments:v7];

  return v19;
}

+ (id)mockAsyncCardWithCard:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(CRMockAsyncCard);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v3, "cardSections", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_alloc_init(CRBasicCardSection);
        [(CRBasicCardSection *)v12 setBackingCardSection:v11];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(CRBasicCard *)v4 setCardSections:v5];
  return v4;
}

+ (id)formattedTextsForStringsAndImages:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
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
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_msgSend((id)objc_opt_class(), "formattedTextWithString:", v10, (void)v14);
          [v4 addObject:v11];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [(id)objc_opt_class() formattedTextWithImage:v10];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)formattedTextWithString:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F67BC8] textWithString:v3];

  [v4 setText:v5];
  return v4;
}

+ (id)formattedTextWithImage:(id)a3
{
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F1C6B0] imageNamed:@"Seahawks"];
  uint64_t v6 = UIImagePNGRepresentation(v5);
  [v4 setImageData:v6];

  [v3 setGlyph:v4];
  return v3;
}

@end