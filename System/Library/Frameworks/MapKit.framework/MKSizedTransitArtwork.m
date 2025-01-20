@interface MKSizedTransitArtwork
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransitArtworkViewMode:(id)a3;
- (GEOTransitArtworkDataSource)artwork;
- (MKArtworkDataSourceCache)artworkCache;
- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4;
- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4 artworkCache:(id)a5;
- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4 fallbackShieldSize:(int64_t)a5 artworkCache:(id)a6;
- (id)badgeImageToDisplayWithScreenScale:(double)a3 nightMode:(BOOL)a4;
- (id)imageToDisplayWithScreenScale:(double)a3 nightMode:(BOOL)a4;
- (int64_t)fallbackShieldSize;
- (int64_t)shieldSize;
- (unint64_t)hash;
- (void)setArtworkCache:(id)a3;
@end

@implementation MKSizedTransitArtwork

- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4
{
  return [(MKSizedTransitArtwork *)self initWithArtwork:a3 shieldSize:a4 artworkCache:0];
}

- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4 artworkCache:(id)a5
{
  return [(MKSizedTransitArtwork *)self initWithArtwork:a3 shieldSize:a4 fallbackShieldSize:a4 artworkCache:a5];
}

- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4 fallbackShieldSize:(int64_t)a5 artworkCache:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MKSizedTransitArtwork;
  v13 = [(MKSizedTransitArtwork *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_artwork, a3);
    v14->_shieldSize = a4;
    v14->_fallbackShieldSize = a5;
    if (v12)
    {
      v15 = (MKArtworkDataSourceCache *)v12;
    }
    else
    {
      v15 = +[MKArtworkDataSourceCache sharedInstance];
    }
    artworkCache = v14->_artworkCache;
    v14->_artworkCache = v15;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(MKSizedTransitArtwork *)self isEqualToTransitArtworkViewMode:v4];

  return v5;
}

- (BOOL)isEqualToTransitArtworkViewMode:(id)a3
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 shieldSize];
  if (v6 == [(MKSizedTransitArtwork *)self shieldSize])
  {
    v7 = [v5 artwork];
    v8 = [(MKSizedTransitArtwork *)self artwork];
    unint64_t v9 = v7;
    unint64_t v10 = v8;
    id v11 = (void *)v10;
    char v12 = (v9 | v10) == 0;
    if (!(v9 | v10)) {
      goto LABEL_142;
    }
    BOOL v13 = v9 != 0;
    if (v10)
    {
      BOOL v13 = 0;
      BOOL v14 = v9 == 0;
    }
    else
    {
      BOOL v14 = 0;
    }
    if (v14 || v13) {
      goto LABEL_142;
    }
    int v15 = [(id)v9 artworkSourceType];
    if (v15 != [v11 artworkSourceType]
      || (int v16 = [(id)v9 artworkUseType], v16 != objc_msgSend(v11, "artworkUseType")))
    {

      char v12 = 0;
LABEL_143:

      goto LABEL_144;
    }
    v17 = [(id)v9 shieldDataSource];
    objc_super v18 = [v11 shieldDataSource];
    unint64_t v19 = v17;
    unint64_t v20 = v18;
    v21 = (void *)v20;
    if (!(v19 | v20))
    {
LABEL_11:
      v22 = [(id)v9 iconDataSource];
      v23 = [v11 iconDataSource];
      unint64_t v24 = v22;
      unint64_t v25 = v23;
      v26 = (void *)v25;
      if (v24 | v25)
      {
        BOOL v50 = v24 != 0;
        if (v25)
        {
          BOOL v50 = 0;
          BOOL v51 = v24 == 0;
        }
        else
        {
          BOOL v51 = 0;
        }
        if (v51
          || v50
          || (int v52 = [(id)v24 iconType], v52 != objc_msgSend(v26, "iconType"))
          || (int v53 = [(id)v24 cartoID], v53 != objc_msgSend(v26, "cartoID"))
          || (int v54 = [(id)v24 defaultTransitType],
              v54 != [v26 defaultTransitType])
          || (int v55 = [(id)v24 iconAttributeKey], v55 != objc_msgSend(v26, "iconAttributeKey")))
        {

LABEL_98:
          char v12 = 0;
LABEL_140:

          goto LABEL_141;
        }
        int v56 = [(id)v24 iconAttributeValue];
        int v57 = [v26 iconAttributeValue];

        if (v56 != v57) {
          goto LABEL_98;
        }
      }
      v27 = [(id)v9 iconFallbackShieldDataSource];
      v28 = [v11 iconFallbackShieldDataSource];
      unint64_t v29 = v27;
      unint64_t v30 = v28;
      v31 = (void *)v30;
      if (!(v29 | v30)) {
        goto LABEL_13;
      }
      BOOL v58 = v29 != 0;
      if (v30)
      {
        BOOL v58 = 0;
        BOOL v59 = v29 == 0;
      }
      else
      {
        BOOL v59 = 0;
      }
      if (!v59 && !v58)
      {
        uint64_t v60 = [(id)v29 shieldType];
        if (v60 == [v31 shieldType])
        {
          v167 = [(id)v29 shieldText];
          if (!v167)
          {
            v150 = [v31 shieldText];
            if (!v150)
            {
              v155 = v26;
              v159 = (void *)v29;
              v150 = 0;
              int v65 = 0;
              [v159 shieldColorString];
              goto LABEL_107;
            }
          }
          uint64_t v61 = [(id)v29 shieldText];
          uint64_t v62 = [v31 shieldText];
          v151 = (void *)v61;
          v63 = (void *)v61;
          v64 = (void *)v62;
          if ([v63 isEqualToString:v62])
          {
            v155 = v26;
            v159 = (void *)v29;
            int v65 = 1;
            v145 = v64;
            [v159 shieldColorString];
            v94 = LABEL_107:;
            if (v94 || ([v31 shieldColorString], (uint64_t v143 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              int v148 = v65;
              v95 = [v159 shieldColorString];
              v172 = v31;
              v96 = [v31 shieldColorString];
              int v65 = [v95 isEqualToString:v96];

              if (v94)
              {

                v31 = v172;
                int v97 = v65;
                if (!v148) {
                  goto LABEL_112;
                }
                goto LABEL_111;
              }
              v31 = v172;
              int v97 = v65;
              LOBYTE(v65) = v148;
              v98 = (void *)v143;
            }
            else
            {
              v98 = 0;
              int v97 = 1;
            }

            if ((v65 & 1) == 0)
            {
LABEL_112:
              if (v167)
              {

                unint64_t v29 = (unint64_t)v159;
                v26 = v155;
                if (!v97) {
                  goto LABEL_97;
                }
              }
              else
              {

                unint64_t v29 = (unint64_t)v159;
                v26 = v155;
                if ((v97 & 1) == 0) {
                  goto LABEL_97;
                }
              }
LABEL_13:
              v170 = v31;
              v32 = [(id)v9 textDataSource];
              v33 = [v11 textDataSource];
              unint64_t v34 = v32;
              unint64_t v35 = v33;
              v36 = (void *)v35;
              unint64_t v169 = v24;
              if (!(v34 | v35)) {
                goto LABEL_21;
              }
              BOOL v37 = v34 != 0;
              if (v35)
              {
                BOOL v37 = 0;
                BOOL v38 = v34 == 0;
              }
              else
              {
                BOOL v38 = 0;
              }
              if (v38 || v37)
              {

LABEL_64:
                v40 = v36;
LABEL_138:
                char v12 = 0;
                goto LABEL_139;
              }
              [(id)v34 text];
              v39 = v165 = (void *)v34;
              [v36 text];
              v41 = v40 = v36;
              unint64_t v42 = v39;
              unint64_t v43 = v41;
              if (!(v42 | v43))
              {

                unint64_t v34 = (unint64_t)v165;
                v36 = v40;
                goto LABEL_21;
              }
              v69 = (void *)v43;
              v153 = v40;
              BOOL v70 = v42 != 0;
              if (v43)
              {
                BOOL v70 = 0;
                BOOL v71 = v42 == 0;
              }
              else
              {
                BOOL v71 = 0;
              }
              if (v71 || v70)
              {

                unint64_t v34 = (unint64_t)v165;
              }
              else
              {
                v146 = (void *)v42;
                v72 = [(id)v42 formatStrings];
                v144 = v69;
                v73 = [v69 formatStrings];
                unint64_t v74 = v72;
                unint64_t v75 = v73;
                v76 = (void *)v75;
                v139 = (void *)v74;
                if (!(v74 | v75))
                {
                  v150 = (void *)v75;
                  goto LABEL_75;
                }
                BOOL v99 = v74 != 0;
                if (v75)
                {
                  BOOL v99 = 0;
                  BOOL v100 = v74 == 0;
                }
                else
                {
                  BOOL v100 = 0;
                }
                if (!v100 && !v99)
                {
                  uint64_t v101 = [(id)v74 count];
                  BOOL v14 = v101 == [v76 count];
                  unint64_t v74 = (unint64_t)v139;
                  if (v14)
                  {
                    v150 = v76;
                    v158 = v26;
                    unint64_t v163 = v29;
                    long long v175 = 0u;
                    long long v176 = 0u;
                    long long v173 = 0u;
                    long long v174 = 0u;
                    id obja = v139;
                    uint64_t v102 = [obja countByEnumeratingWithState:&v173 objects:v177 count:16];
                    if (v102)
                    {
                      uint64_t v103 = v102;
                      uint64_t v104 = 0;
                      uint64_t v149 = *(void *)v174;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v103; ++i)
                        {
                          if (*(void *)v174 != v149) {
                            objc_enumerationMutation(obja);
                          }
                          unint64_t v106 = *(void *)(*((void *)&v173 + 1) + 8 * i);
                          uint64_t v107 = [v150 objectAtIndexedSubscript:v104 + i];
                          if (v106 | v107)
                          {
                            v108 = (void *)v107;
                            int v109 = [(id)v106 isEqual:v107];

                            if (!v109)
                            {

                              v76 = v150;
                              v26 = v158;
                              unint64_t v29 = v163;
                              goto LABEL_136;
                            }
                          }
                        }
                        v104 += i;
                        uint64_t v103 = [obja countByEnumeratingWithState:&v173 objects:v177 count:16];
                        if (v103) {
                          continue;
                        }
                        break;
                      }
                    }

                    v26 = v158;
                    unint64_t v29 = v163;
LABEL_75:
                    v77 = [v146 separators];
                    v78 = [v144 separators];
                    unint64_t v79 = v77;
                    unint64_t v147 = v78;
                    v157 = v26;
                    unint64_t v161 = v29;
                    if (v79 | v147)
                    {
                      BOOL v111 = v79 != 0;
                      if (v147)
                      {
                        BOOL v111 = 0;
                        BOOL v112 = v79 == 0;
                      }
                      else
                      {
                        BOOL v112 = 0;
                      }
                      if (v112
                        || v111
                        || (v135 = (void *)v79,
                            uint64_t v113 = [(id)v79 count],
                            BOOL v14 = v113 == [(id)v147 count],
                            unint64_t v79 = (unint64_t)v135,
                            !v14))
                      {

                        goto LABEL_190;
                      }
                      long long v175 = 0u;
                      long long v176 = 0u;
                      long long v173 = 0u;
                      long long v174 = 0u;
                      id v137 = v135;
                      uint64_t v114 = [v137 countByEnumeratingWithState:&v173 objects:v177 count:16];
                      if (v114)
                      {
                        uint64_t v115 = v114;
                        uint64_t v116 = 0;
                        id objb = *(id *)v174;
                        while (2)
                        {
                          for (uint64_t j = 0; j != v115; ++j)
                          {
                            if (*(id *)v174 != objb) {
                              objc_enumerationMutation(v137);
                            }
                            unint64_t v118 = *(void *)(*((void *)&v173 + 1) + 8 * j);
                            uint64_t v119 = [(id)v147 objectAtIndexedSubscript:v116 + j];
                            if (v118 | v119)
                            {
                              v120 = (void *)v119;
                              int v121 = [(id)v118 isEqual:v119];

                              if (!v121)
                              {
                                v131 = v137;

LABEL_188:
                                goto LABEL_189;
                              }
                            }
                          }
                          v116 += j;
                          uint64_t v115 = [v137 countByEnumeratingWithState:&v173 objects:v177 count:16];
                          if (v115) {
                            continue;
                          }
                          break;
                        }
                      }
                    }
                    else
                    {
                      v135 = (void *)v79;
                    }
                    v80 = [v146 formatTokens];
                    v81 = [v144 formatTokens];
                    unint64_t v82 = v80;
                    obuint64_t j = v81;
                    if (!(v82 | obj))
                    {
                      unint64_t v132 = v82;
                      goto LABEL_79;
                    }
                    BOOL v122 = v82 != 0;
                    if (obj)
                    {
                      BOOL v122 = 0;
                      BOOL v123 = v82 == 0;
                    }
                    else
                    {
                      BOOL v123 = 0;
                    }
                    if (!v123 && !v122)
                    {
                      uint64_t v124 = [(id)v82 count];
                      if (v124 == [(id)obj count])
                      {
                        long long v175 = 0u;
                        long long v176 = 0u;
                        long long v173 = 0u;
                        long long v174 = 0u;
                        unint64_t v132 = v82;
                        id v134 = (id)v82;
                        uint64_t v125 = [v134 countByEnumeratingWithState:&v173 objects:v177 count:16];
                        if (v125)
                        {
                          uint64_t v126 = v125;
                          uint64_t v127 = 0;
                          id v138 = *(id *)v174;
                          while (2)
                          {
                            for (uint64_t k = 0; k != v126; ++k)
                            {
                              if (*(id *)v174 != v138) {
                                objc_enumerationMutation(v134);
                              }
                              v129 = objc_msgSend((id)obj, "objectAtIndexedSubscript:", v127 + k, v132);
                              int v130 = GEOServerFormatTokenEqual();

                              if (!v130)
                              {
                                v131 = v134;

                                goto LABEL_188;
                              }
                            }
                            v127 += k;
                            uint64_t v126 = [v134 countByEnumeratingWithState:&v173 objects:v177 count:16];
                            if (v126) {
                              continue;
                            }
                            break;
                          }
                        }

LABEL_79:
                        uint64_t v83 = objc_msgSend(v146, "alternativeString", v132);
                        uint64_t v84 = [v144 alternativeString];
                        if (v83 | v84) {
                          char v136 = [(id)v83 isEqual:v84];
                        }
                        else {
                          char v136 = 1;
                        }

                        v36 = v153;
                        unint64_t v34 = (unint64_t)v165;

                        v26 = v157;
                        unint64_t v29 = v161;
                        if (v136)
                        {
LABEL_21:
                          unint64_t v166 = v34;
                          int v44 = [(id)v9 hasRoutingIncidentBadge];
                          if (v44 != [v11 hasRoutingIncidentBadge])
                          {
                            v40 = v36;
                            char v12 = 0;
                            unint64_t v34 = v166;
LABEL_139:

                            unint64_t v24 = v169;
                            goto LABEL_140;
                          }
                          v152 = v36;
                          v66 = [(id)v9 accessibilityText];
                          if (v66
                            || ([v11 accessibilityText],
                                (v150 = objc_claimAutoreleasedReturnValue()) != 0))
                          {
                            v156 = v26;
                            unint64_t v160 = v29;
                            v67 = [(id)v9 accessibilityText];
                            v68 = [v11 accessibilityText];
                            char v12 = [v67 isEqualToString:v68];

                            if (v66)
                            {

                              v26 = v156;
                              unint64_t v29 = v160;
LABEL_105:
                              unint64_t v34 = v166;
                              v40 = v152;
                              goto LABEL_139;
                            }
                            v26 = v156;
                            unint64_t v29 = v160;
                            v92 = v150;
                          }
                          else
                          {
                            v92 = 0;
                            char v12 = 1;
                          }

                          goto LABEL_105;
                        }
                        goto LABEL_64;
                      }
                    }

LABEL_189:
                    unint64_t v79 = (unint64_t)v135;
LABEL_190:

                    v40 = v153;
                    unint64_t v34 = (unint64_t)v165;

                    char v12 = 0;
                    v26 = v157;
                    unint64_t v29 = v161;
                    goto LABEL_139;
                  }
                }

LABEL_136:
                unint64_t v34 = (unint64_t)v165;

                v40 = v153;
              }

              goto LABEL_138;
            }
LABEL_111:

            goto LABEL_112;
          }

          v93 = v150;
          if (v167) {
            v93 = v167;
          }
        }
      }

LABEL_97:
      goto LABEL_98;
    }
    BOOL v45 = v19 != 0;
    if (v20)
    {
      BOOL v45 = 0;
      BOOL v46 = v19 == 0;
    }
    else
    {
      BOOL v46 = 0;
    }
    if (!v46 && !v45)
    {
      uint64_t v47 = [(id)v19 shieldType];
      if (v47 == [v21 shieldType])
      {
        v48 = [(id)v19 shieldText];
        if (!v48)
        {
          v164 = [v21 shieldText];
          if (!v164)
          {
            v164 = 0;
            int v171 = 0;
            goto LABEL_82;
          }
        }
        v49 = [(id)v19 shieldText];
        v3 = [v21 shieldText];
        if ([v49 isEqualToString:v3])
        {
          v168 = v49;
          int v171 = 1;
LABEL_82:
          v162 = v3;
          v85 = [(id)v19 shieldColorString];
          if (v85 || ([v21 shieldColorString], (uint64_t v154 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v86 = [(id)v19 shieldColorString];
            v87 = [v21 shieldColorString];
            char v88 = [v86 isEqualToString:v87];

            if (v85)
            {

              v89 = v168;
              if (!v171) {
                goto LABEL_87;
              }
              goto LABEL_86;
            }
            v89 = v168;
            char v90 = v171;
            v91 = (void *)v154;
          }
          else
          {
            v91 = 0;
            char v88 = 1;
            v89 = v168;
            char v90 = v171;
          }

          if ((v90 & 1) == 0)
          {
LABEL_87:
            if (!v48) {

            }
            if (v88) {
              goto LABEL_11;
            }
LABEL_67:
            char v12 = 0;
LABEL_141:

LABEL_142:
            goto LABEL_143;
          }
LABEL_86:

          goto LABEL_87;
        }

        if (v48) {
        else
        }
      }
    }

    goto LABEL_67;
  }
  char v12 = 0;
LABEL_144:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v33 = 2654435761 * [(MKSizedTransitArtwork *)self shieldSize];
  uint64_t v32 = 2654435761 * [(MKSizedTransitArtwork *)self fallbackShieldSize];
  v3 = [(MKSizedTransitArtwork *)self artwork];
  uint64_t v31 = 2654435761 * (int)[v3 artworkSourceType];
  id v4 = [v3 shieldDataSource];
  uint64_t v30 = 2654435761 * [v4 shieldType];
  id v5 = [v4 shieldText];
  uint64_t v29 = [v5 hash];
  uint64_t v6 = [v4 shieldColorString];
  uint64_t v28 = [v6 hash];

  v7 = [v3 iconDataSource];
  uint64_t v27 = 2654435761 * (int)[v7 iconType];
  uint64_t v26 = 2654435761 * [v7 cartoID];
  uint64_t v25 = 2654435761 * [v7 defaultTransitType];
  uint64_t v24 = 2654435761 * [v7 iconAttributeKey];
  uint64_t v23 = 2654435761 * [v7 iconAttributeValue];
  v8 = [v3 iconFallbackShieldDataSource];
  uint64_t v22 = 2654435761 * [v8 shieldType];
  unint64_t v9 = [v8 shieldText];
  uint64_t v21 = [v9 hash];
  unint64_t v10 = [v8 shieldColorString];
  uint64_t v19 = [v10 hash];

  id v11 = [v3 textDataSource];
  char v12 = [v11 text];
  uint64_t v13 = [v12 hash];

  uint64_t v14 = 2654435761 * (int)[v3 artworkUseType];
  if ([v3 hasRoutingIncidentBadge]) {
    uint64_t v15 = 2654435761;
  }
  else {
    uint64_t v15 = 0;
  }
  int v16 = objc_msgSend(v3, "accessibilityText", v19);
  uint64_t v17 = [v16 hash];

  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v13 ^ v14 ^ v15 ^ v17;
}

- (id)imageToDisplayWithScreenScale:(double)a3 nightMode:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(MKSizedTransitArtwork *)self artwork];
  BOOL v8 = MKTransitArtworkDataSourceAllowMasking(v7);

  unint64_t v9 = [(MKSizedTransitArtwork *)self artworkCache];
  unint64_t v10 = [v9 imageForSizedArtwork:self scale:v4 nightMode:a3];

  if (v8)
  {
    uint64_t v11 = [v10 imageWithRenderingMode:2];

    unint64_t v10 = (void *)v11;
  }

  return v10;
}

- (id)badgeImageToDisplayWithScreenScale:(double)a3 nightMode:(BOOL)a4
{
  BOOL v4 = [(MKSizedTransitArtwork *)self artwork];
  if ([v4 hasRoutingIncidentBadge])
  {
    id v5 = MKTransitIncidentIcon();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (int64_t)fallbackShieldSize
{
  return self->_fallbackShieldSize;
}

- (MKArtworkDataSourceCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end