@interface CUIKEventDescriptionGenerator
+ (id)sharedGenerator;
- (BOOL)_virtualConferenceUsesShortRepresentation:(id)a3;
- (id)_attributedStringWithURL:(id)a3 title:(id)a4;
- (id)_basicTextAttributes;
- (id)_boldBasicTextAttributes;
- (id)_htmlStringWithURL:(id)a3 title:(id)a4;
- (id)_showEventURLStringForEvent:(id)a3;
- (id)_textRepresentationForAttendee:(id)a3 includeEmailAddress:(BOOL)a4;
- (id)_urlAttributes:(id)a3;
- (id)_virtualConferenceHTMLRepresentation:(id)a3 isForEmail:(BOOL)a4;
- (id)dateStringRepresentationForEvent:(id)a3;
- (id)textRepresentationForEvent:(id)a3 withTextFormat:(unint64_t)a4 showURI:(BOOL)a5;
- (id)virtualConferenceEmailHTMLRepresentation:(id)a3;
@end

@implementation CUIKEventDescriptionGenerator

+ (id)sharedGenerator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CUIKEventDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_2 != -1) {
    dispatch_once(&sharedGenerator_onceToken_2, block);
  }
  v2 = (void *)sharedGenerator___sharedInstance_2;

  return v2;
}

void __48__CUIKEventDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_2;
  sharedGenerator___sharedInstance_2 = (uint64_t)v1;
}

- (id)textRepresentationForEvent:(id)a3 withTextFormat:(unint64_t)a4 showURI:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [v8 title];
  v161 = [v8 location];
  v10 = [v8 URL];
  v154 = [v8 attendees];
  v157 = [v8 displayNotes];
  v11 = [v8 virtualConference];
  BOOL v12 = [(CUIKEventDescriptionGenerator *)self _virtualConferenceUsesShortRepresentation:v11];
  v162 = self;
  unint64_t v158 = a4;
  if (a4 == 1)
  {
    v13 = &stru_1F187C430;
    goto LABEL_6;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    BOOL v14 = a4 == 3;
    if (a4 == 3)
    {
      v13 = @"\n\n\n";
LABEL_6:
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13];
      BOOL v151 = v158 == 3;
LABEL_7:
      id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
      v17 = [NSString stringWithFormat:@"%@\n", v9];
      v18 = [(CUIKEventDescriptionGenerator *)self _boldBasicTextAttributes];
      v19 = (void *)[v16 initWithString:v17 attributes:v18];

      self = v162;
      [v15 appendAttributedString:v19];
LABEL_8:

      a4 = v158;
      goto LABEL_9;
    }
    v15 = 0;
  }
  else
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F187C430];
  }
  int v25 = v14;
  BOOL v151 = v25;
  switch(a4)
  {
    case 0uLL:
      v19 = [NSString stringWithFormat:@"%@\n", v9];
      [v15 appendString:v19];
      goto LABEL_8;
    case 1uLL:
    case 3uLL:
      goto LABEL_7;
    case 2uLL:
      uint64_t v141 = [v9 stringByTrimmingWhitespaceAndRemovingNewlines];
      v142 = (void *)v141;
      v143 = NSString;
      if (v5)
      {
        v144 = [(CUIKEventDescriptionGenerator *)v162 _showEventURLStringForEvent:v8];
        v19 = [v143 stringWithFormat:@"<b><a href = %@>%@</a></b><br />", v144, v142];
      }
      else
      {
        v19 = [NSString stringWithFormat:@"<b>%@</b><br />", v141];
      }
      [v15 appendString:v19];

      self = v162;
      goto LABEL_8;
    default:
      break;
  }
LABEL_9:
  uint64_t v20 = [(CUIKEventDescriptionGenerator *)self dateStringRepresentationForEvent:v8];
  if (v20)
  {
    v156 = (void *)v20;
    switch(a4)
    {
      case 0uLL:
        v26 = (void *)v20;
        [NSString stringWithFormat:@"%@\n", v20];
        goto LABEL_22;
      case 1uLL:
      case 3uLL:
        id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
        v22 = [NSString stringWithFormat:@"%@\n", v156];
        v23 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
        v24 = (void *)[v21 initWithString:v22 attributes:v23];

        self = v162;
        [v15 appendAttributedString:v24];

        break;
      case 2uLL:
        v26 = (void *)v20;
        [NSString stringWithFormat:@"%@<br />", v20];
        uint64_t v27 = LABEL_22:;

        [v15 appendString:v27];
        v156 = (void *)v27;
        break;
      default:
        break;
    }
  }
  else
  {
    v156 = 0;
  }
  v155 = v11;
  if ([v161 length])
  {
    v28 = NSString;
    v29 = CUIKBundle();
    v30 = [v29 localizedStringForKey:@"Location: %@" value:&stru_1F187C430 table:0];
    v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v161);

    switch(v158)
    {
      case 0uLL:
        [NSString stringWithFormat:@"%@\n", v31];
        goto LABEL_28;
      case 1uLL:
      case 3uLL:
        id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
        v33 = [NSString stringWithFormat:@"%@\n", v31];
        v34 = [(CUIKEventDescriptionGenerator *)v162 _basicTextAttributes];
        v35 = (void *)[v32 initWithString:v33 attributes:v34];
        [v15 appendAttributedString:v35];

        goto LABEL_29;
      case 2uLL:
        [NSString stringWithFormat:@"%@<br />", v31];
        v33 = LABEL_28:;
        [v15 appendString:v33];
LABEL_29:

        break;
      default:
        break;
    }

    v11 = v155;
    self = v162;
  }
  char v36 = !v12;
  if (!v11) {
    char v36 = 1;
  }
  if ((v36 & 1) == 0)
  {
    v37 = CUIKBundle();
    v38 = [v37 localizedStringForKey:@"Video Call: %@" value:&stru_1F187C430 table:0];

    v39 = [v11 joinMethods];
    v40 = [v39 firstObject];
    v41 = [v40 URL];

    switch(v158)
    {
      case 0uLL:
        v50 = NSString;
        v51 = [v41 absoluteString];
        v52 = objc_msgSend(v50, "localizedStringWithFormat:", v38, v51);
        [v15 appendString:v52];

        [v15 appendString:@"\n"];
        break;
      case 1uLL:
      case 3uLL:
        id v42 = objc_alloc(MEMORY[0x1E4F28B18]);
        v43 = v10;
        v44 = v9;
        v45 = [(CUIKEventDescriptionGenerator *)v162 _basicTextAttributes];
        v46 = (void *)[v42 initWithString:v38 attributes:v45];

        v47 = [v41 absoluteString];
        v48 = [(CUIKEventDescriptionGenerator *)v162 _attributedStringWithURL:v41 title:v47];

        v49 = objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v46, v48);
        [v15 appendAttributedString:v49];

        v9 = v44;
        v10 = v43;
        goto LABEL_38;
      case 2uLL:
        v46 = [(CUIKEventDescriptionGenerator *)v162 _virtualConferenceHTMLRepresentation:v8 isForEmail:0];
        [v15 appendString:v46];
LABEL_38:

        break;
      default:
        break;
    }

    v11 = v155;
    self = v162;
  }
  v163 = v15;
  if (v10)
  {
    unint64_t v53 = v158;
    switch(v158)
    {
      case 0uLL:
        v83 = NSString;
        v84 = [v10 absoluteString];
        v85 = [v83 stringWithFormat:@"%@\n", v84];
        [v15 appendString:v85];

        break;
      case 1uLL:
      case 3uLL:
        v54 = [v10 absoluteString];
        v55 = [(CUIKEventDescriptionGenerator *)self _attributedStringWithURL:v10 title:v54];

        [v15 appendAttributedString:v55];
        goto LABEL_43;
      case 2uLL:
        v86 = [v10 absoluteString];
        v87 = [(CUIKEventDescriptionGenerator *)self _htmlStringWithURL:v10 title:v86];
        [v15 appendString:v87];

        break;
      default:
        goto LABEL_64;
    }
    unint64_t v53 = v158;
LABEL_64:
    if (!v11) {
      goto LABEL_89;
    }
    goto LABEL_69;
  }
LABEL_43:
  unint64_t v53 = v158;
  if ((v158 | 2) != 3 || ![v154 count]) {
    goto LABEL_64;
  }
  BOOL v152 = v12;
  v145 = v10;
  id v147 = v8;
  v149 = v9;
  uint64_t v56 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F187C430];
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v57 = v154;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v168 objects:v173 count:16];
  v59 = (void *)v56;
  if (v58)
  {
    uint64_t v60 = v58;
    uint64_t v61 = *(void *)v169;
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v169 != v61) {
          objc_enumerationMutation(v57);
        }
        v63 = *(void **)(*((void *)&v168 + 1) + 8 * i);
        uint64_t v64 = [v63 name];
        if (v64)
        {
          v65 = (void *)v64;
          v66 = [v63 name];
          uint64_t v67 = [v161 rangeOfString:v66];

          v15 = v163;
          BOOL v14 = v67 == 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v56 = (uint64_t)v59;
          if (v14) {
            [obj addObject:v63];
          }
        }
      }
      uint64_t v60 = [v57 countByEnumeratingWithState:&v168 objects:v173 count:16];
    }
    while (v60);
  }

  v68 = obj;
  v69 = (void *)v56;
  v9 = v149;
  if ([obj count])
  {
    BOOL v70 = !v151;
    v71 = [obj objectAtIndex:0];
    v72 = [(CUIKEventDescriptionGenerator *)v162 _textRepresentationForAttendee:v71 includeEmailAddress:v70];

    [v69 appendAttributedString:v72];
    uint64_t v73 = [obj count];
    if (v73 < 2)
    {
      v79 = v72;
      v76 = v162;
      v69 = v59;
      id v77 = obj;
    }
    else
    {
      uint64_t v74 = v73;
      uint64_t v75 = 1;
      v76 = v162;
      v69 = v59;
      id v77 = obj;
      do
      {
        v78 = [obj objectAtIndex:v75];
        v79 = [(CUIKEventDescriptionGenerator *)v162 _textRepresentationForAttendee:v78 includeEmailAddress:v70];

        id v80 = objc_alloc(MEMORY[0x1E4F28B18]);
        v81 = [(CUIKEventDescriptionGenerator *)v162 _basicTextAttributes];
        v82 = (void *)[v80 initWithString:@", ", v81 attributes];
        [v69 appendAttributedString:v82];

        [v69 appendAttributedString:v79];
        ++v75;
        v72 = v79;
      }
      while (v74 != v75);
    }
    id v88 = objc_alloc(MEMORY[0x1E4F28B18]);
    v89 = CUIKBundle();
    v90 = [v89 localizedStringForKey:@"Invitees: " value:&stru_1F187C430 table:0];
    v91 = [(CUIKEventDescriptionGenerator *)v76 _basicTextAttributes];
    v92 = (void *)[v88 initWithString:v90 attributes:v91];
    [v163 appendAttributedString:v92];

    [v163 appendAttributedString:v69];
    id v93 = objc_alloc(MEMORY[0x1E4F28B18]);
    v94 = [(CUIKEventDescriptionGenerator *)v76 _basicTextAttributes];
    v95 = (void *)[v93 initWithString:@"\n" attributes:v94];
    [v163 appendAttributedString:v95];

    v15 = v163;
    v9 = v149;
    v68 = v77;
  }

  v10 = v145;
  id v8 = v147;
  v11 = v155;
  self = v162;
  unint64_t v53 = v158;
  BOOL v12 = v152;
  if (v155)
  {
LABEL_69:
    if (!v12)
    {
      v96 = CUIKBundle();
      v97 = [v96 localizedStringForKey:@"Video Call:" value:&stru_1F187C430 table:0];

      unint64_t v53 = v158;
      switch(v158)
      {
        case 0uLL:
          v135 = NSString;
          v134 = [v8 virtualConferenceTextRepresentation];
          v136 = [v135 stringWithFormat:@"\n%@\n%@\n\n", v97, v134];
          [v15 appendString:v136];

          self = v162;
          goto LABEL_86;
        case 1uLL:
        case 3uLL:
          v146 = v10;
          id v148 = v8;
          v150 = v9;
          uint64_t v98 = [NSString stringWithFormat:@"\n%@\n", v97];

          id v99 = objc_alloc(MEMORY[0x1E4F28B18]);
          v100 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
          v153 = (void *)v98;
          v101 = (void *)[v99 initWithString:v98 attributes:v100];
          [v15 appendAttributedString:v101];

          v102 = [v11 title];

          if (v102)
          {
            v103 = self;
            id v104 = objc_alloc(MEMORY[0x1E4F28B18]);
            id v105 = [NSString alloc];
            v106 = [v11 title];
            v107 = (void *)[v105 initWithFormat:@"%@\n\n", v106];
            v108 = [(CUIKEventDescriptionGenerator *)v103 _basicTextAttributes];
            v109 = (void *)[v104 initWithString:v107 attributes:v108];

            v11 = v155;
            [v15 appendAttributedString:v109];
          }
          long long v166 = 0u;
          long long v167 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          id obja = [v11 joinMethods];
          uint64_t v110 = [obja countByEnumeratingWithState:&v164 objects:v172 count:16];
          if (v110)
          {
            uint64_t v111 = v110;
            uint64_t v112 = *(void *)v165;
            do
            {
              for (uint64_t j = 0; j != v111; ++j)
              {
                if (*(void *)v165 != v112) {
                  objc_enumerationMutation(obja);
                }
                v114 = *(void **)(*((void *)&v164 + 1) + 8 * j);
                v115 = [v114 title];

                if (v115)
                {
                  id v116 = objc_alloc(MEMORY[0x1E4F28B18]);
                  id v117 = [NSString alloc];
                  v118 = [v114 title];
                  v119 = (void *)[v117 initWithFormat:@"%@\n", v118];
                  v120 = [(CUIKEventDescriptionGenerator *)v162 _basicTextAttributes];
                  v121 = (void *)[v116 initWithString:v119 attributes:v120];

                  v15 = v163;
                  [v163 appendAttributedString:v121];
                }
                v122 = [v114 URL];
                v123 = [v122 absoluteString];
                v124 = [(CUIKEventDescriptionGenerator *)v162 _attributedStringWithURL:v122 title:v123];

                [v15 appendAttributedString:v124];
                id v125 = objc_alloc(MEMORY[0x1E4F28B18]);
                v126 = [(CUIKEventDescriptionGenerator *)v162 _basicTextAttributes];
                v127 = (void *)[v125 initWithString:@"\n" attributes:v126];
                [v15 appendAttributedString:v127];
              }
              uint64_t v111 = [obja countByEnumeratingWithState:&v164 objects:v172 count:16];
            }
            while (v111);
          }

          v11 = v155;
          v128 = [v155 conferenceDetails];

          if (v128)
          {
            id v129 = objc_alloc(MEMORY[0x1E4F28B18]);
            id v130 = [NSString alloc];
            v131 = [v155 conferenceDetails];
            v132 = (void *)[v130 initWithFormat:@"%@\n\n", v131];
            v133 = [(CUIKEventDescriptionGenerator *)v162 _basicTextAttributes];
            v134 = (void *)[v129 initWithString:v132 attributes:v133];

            self = v162;
            [v15 appendAttributedString:v134];
            id v8 = v148;
            v9 = v150;
            v10 = v146;
            v97 = v153;
LABEL_86:
          }
          else
          {
            v97 = v153;
            id v8 = v148;
            v9 = v150;
            v10 = v146;
            self = v162;
          }
          unint64_t v53 = v158;
LABEL_88:

          break;
        case 2uLL:
          v134 = [(CUIKEventDescriptionGenerator *)self _virtualConferenceHTMLRepresentation:v8 isForEmail:0];
          [v15 appendString:v134];
          goto LABEL_86;
        default:
          goto LABEL_88;
      }
    }
  }
LABEL_89:
  if (v157)
  {
    switch(v53)
    {
      case 0uLL:
        [NSString stringWithFormat:@"%@\n", v157];
        goto LABEL_94;
      case 1uLL:
      case 3uLL:
        id v137 = objc_alloc(MEMORY[0x1E4F28B18]);
        v138 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
        v139 = (void *)[v137 initWithString:v157 attributes:v138];
        [v15 appendAttributedString:v139];

        goto LABEL_95;
      case 2uLL:
        [NSString stringWithFormat:@"%@<br />", v157];
        v138 = LABEL_94:;
        [v15 appendString:v138];
LABEL_95:

        break;
      default:
        break;
    }
  }

  return v15;
}

- (id)dateStringRepresentationForEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 startDate];
  if (v4)
  {
    if ([v3 isReminderIntegrationEvent])
    {
      BOOL v5 = (void *)MEMORY[0x1E4F576C8];
      v6 = [v3 startDate];
      v7 = objc_msgSend(v5, "dateStringRepresentationForReminderStartDate:allDay:", v6, objc_msgSend(v3, "isAllDay"));
    }
    else
    {
      v6 = [v3 endDateUnadjustedForLegacyClients];
      if (v6)
      {
        uint64_t v8 = [v3 isAllDay];
        v9 = [v3 timeZone];
        v7 = [MEMORY[0x1E4F576C8] dateStringRepresentationForEventCompontentsStartDate:v4 endDate:v6 allDay:v8 timeZone:v9];
      }
      else
      {
        v7 = 0;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_showEventURLStringForEvent:(id)a3
{
  id v3 = [a3 externalURL];
  v4 = [v3 absoluteString];

  return v4;
}

- (BOOL)_virtualConferenceUsesShortRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 joinMethods];
  if ([v4 count] == 1)
  {
    BOOL v5 = [v3 conferenceDetails];
    BOOL v6 = [v5 length] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_textRepresentationForAttendee:(id)a3 includeEmailAddress:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (objc_class *)MEMORY[0x1E4F28E48];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithString:&stru_1F187C430];
  v9 = [v7 name];
  v10 = [v7 emailAddress];

  if (v10 && v4)
  {
    if (v9)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
      BOOL v12 = [NSString stringWithFormat:@"%@ ", v9];
      v13 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
      BOOL v14 = (void *)[v11 initWithString:v12 attributes:v13];
      [v8 appendAttributedString:v14];
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v16 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
    v17 = (void *)[v15 initWithString:@"<" attributes:v16];
    [v8 appendAttributedString:v17];

    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19 = [(CUIKEventDescriptionGenerator *)self _urlAttributes:0];
    uint64_t v20 = (void *)[v18 initWithString:v10 attributes:v19];
    [v8 appendAttributedString:v20];

    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    v22 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
    v23 = @">";
    v24 = v21;
  }
  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
    v22 = [(CUIKEventDescriptionGenerator *)self _basicTextAttributes];
    v24 = v25;
    v23 = v9;
  }
  v26 = (void *)[v24 initWithString:v23 attributes:v22];
  [v8 appendAttributedString:v26];

LABEL_9:

  return v8;
}

- (id)_attributedStringWithURL:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = [(CUIKEventDescriptionGenerator *)self _urlAttributes:a3];
  uint64_t v8 = [NSString stringWithFormat:@"%@\n", v6];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v7];

  return v9;
}

- (id)_urlAttributes:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x1E4FB0720];
    v20[0] = a3;
    uint64_t v4 = *MEMORY[0x1E4FB0808];
    v19[0] = v3;
    v19[1] = v4;
    BOOL v5 = NSNumber;
    id v6 = a3;
    id v7 = [v5 numberWithInteger:1];
    v20[1] = v7;
    v19[2] = *MEMORY[0x1E4FB0700];
    uint64_t v8 = [MEMORY[0x1E4FB1618] linkColor];
    v20[2] = v8;
    v19[3] = *MEMORY[0x1E4FB06F8];
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    v20[3] = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v20;
    BOOL v12 = v19;
    uint64_t v13 = 4;
  }
  else
  {
    v17[0] = *MEMORY[0x1E4FB0808];
    BOOL v14 = NSNumber;
    id v6 = 0;
    id v7 = [v14 numberWithInteger:1];
    v18[0] = v7;
    v17[1] = *MEMORY[0x1E4FB0700];
    uint64_t v8 = [MEMORY[0x1E4FB1618] linkColor];
    v18[1] = v8;
    v17[2] = *MEMORY[0x1E4FB06F8];
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    v18[2] = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v18;
    BOOL v12 = v17;
    uint64_t v13 = 3;
  }
  id v15 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:v13];

  return v15;
}

- (id)_basicTextAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)_boldBasicTextAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v2 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:16.0];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)virtualConferenceEmailHTMLRepresentation:(id)a3
{
  return [(CUIKEventDescriptionGenerator *)self _virtualConferenceHTMLRepresentation:a3 isForEmail:1];
}

- (id)_htmlStringWithURL:(id)a3 title:(id)a4
{
  uint64_t v5 = NSString;
  id v6 = a4;
  id v7 = [a3 absoluteString];
  uint64_t v8 = [v5 stringWithFormat:@"<a href=%@>%@</a><br />", v7, v6];

  return v8;
}

- (id)_virtualConferenceHTMLRepresentation:(id)a3 isForEmail:(BOOL)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 virtualConference];
  if (v5)
  {
    if ([(CUIKEventDescriptionGenerator *)self _virtualConferenceUsesShortRepresentation:v5])
    {
      id v6 = CUIKBundle();
      id v7 = [v6 localizedStringForKey:@"Video Call: %@" value:&stru_1F187C430 table:0];

      uint64_t v8 = [v5 joinMethods];
      v9 = [v8 firstObject];
      v10 = [v9 URL];

      id v11 = [v10 absoluteString];
      BOOL v12 = [(CUIKEventDescriptionGenerator *)self _htmlStringWithURL:v10 title:v11];

      objc_msgSend(NSString, "localizedStringWithFormat:", v7, v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      BOOL v14 = CUIKBundle();
      id v15 = [v14 localizedStringForKey:@"Video Call:" value:&stru_1F187C430 table:0];

      uint64_t v16 = [NSString stringWithFormat:@"<br />%@<br />", v15];

      v33 = (void *)v16;
      [v13 appendString:v16];
      v17 = [v5 title];

      if (v17)
      {
        id v18 = [v5 title];
        [v13 appendFormat:@"%@<br /><br />", v18];
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v34 = v5;
      v19 = [v5 joinMethods];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v25 = [v24 title];

            if (v25)
            {
              v26 = [v24 title];
              [v13 appendFormat:@"%@<br />", v26];
            }
            uint64_t v27 = [v24 URL];
            v28 = [v27 absoluteString];
            v29 = [(CUIKEventDescriptionGenerator *)self _htmlStringWithURL:v27 title:v28];

            [v13 appendString:v29];
            [v13 appendString:@"<br />"];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v21);
      }

      uint64_t v5 = v34;
      v30 = [v34 conferenceDetails];

      if (v30)
      {
        v31 = [v34 conferenceDetails];
        [v13 appendFormat:@"%@<br /><br />", v31];
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end