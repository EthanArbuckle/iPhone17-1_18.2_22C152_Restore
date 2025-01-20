@interface SKBitmapFont
+ (BOOL)supportsSecureCoding;
+ (id)_fontForFileNamed:(id)a3;
+ (id)fontForFileNamed:(id)a3;
+ (id)fontWithTexture:(id)a3 fontDataString:(id)a4;
- (BOOL)loadFontWithTexture:(id)a3 fontDataString:(id)a4;
- (SKBitmapFont)init;
- (SKBitmapFont)initWithCoder:(id)a3;
- (double)advanceForCharacterNamed:(unsigned __int16)a3;
- (double)kerningForCharacterNamed:(unsigned __int16)a3 followedBy:(unsigned __int16)a4;
- (double)lineHeight;
- (id).cxx_construct;
- (id)fontName;
- (id)spriteForCharacterNamed:(unsigned __int16)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKBitmapFont

- (id)fontName
{
  return self->_fileName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKBitmapFont)init
{
  v17.receiver = self;
  v17.super_class = (Class)SKBitmapFont;
  v2 = [(SKBitmapFont *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_internal = 0;
    v15 = 0;
    unint64_t v16 = 0;
    v14 = &v15;
    p_pair1 = &v2->_characterSpriteByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v2->_characterSpriteByChar, (void *)v2->_characterSpriteByChar.__tree_.__pair1_.__value_.__left_);
    v5 = v15;
    v3->_characterSpriteByChar.__tree_.__begin_node_ = &v15;
    p_pair1->__value_.__left_ = v5;
    unint64_t v6 = v16;
    v3->_characterSpriteByChar.__tree_.__pair3_.__value_ = v16;
    if (v6)
    {
      v5[2] = p_pair1;
      v14 = &v15;
      v15 = 0;
      unint64_t v16 = 0;
      v5 = 0;
    }
    else
    {
      v3->_characterSpriteByChar.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v14, v5);
    v15 = 0;
    unint64_t v16 = 0;
    v14 = &v15;
    v7 = &v3->_characterAdvanceByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v3->_characterAdvanceByChar, (void *)v3->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_);
    v8 = v15;
    v3->_characterAdvanceByChar.__tree_.__begin_node_ = v14;
    v3->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_ = v8;
    unint64_t v9 = v16;
    v3->_characterAdvanceByChar.__tree_.__pair3_.__value_ = v16;
    if (v9)
    {
      v8[2] = v7;
      v14 = &v15;
      v15 = 0;
      unint64_t v16 = 0;
      v8 = 0;
    }
    else
    {
      v3->_characterAdvanceByChar.__tree_.__begin_node_ = v7;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v14, v8);
    v15 = 0;
    unint64_t v16 = 0;
    v14 = &v15;
    v10 = &v3->_characterKerningByCharPair.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v3->_characterKerningByCharPair, (void *)v3->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_);
    v11 = v15;
    v3->_characterKerningByCharPair.__tree_.__begin_node_ = v14;
    v3->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_ = v11;
    unint64_t v12 = v16;
    v3->_characterKerningByCharPair.__tree_.__pair3_.__value_ = v16;
    if (v12)
    {
      v11[2] = v10;
      v14 = &v15;
      v15 = 0;
      unint64_t v16 = 0;
      v11 = 0;
    }
    else
    {
      v3->_characterKerningByCharPair.__tree_.__begin_node_ = v10;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v14, v11);
    if (onceToken != -1) {
      dispatch_once(&onceToken, &__block_literal_global);
    }
  }
  return v3;
}

void __20__SKBitmapFont_init__block_invoke()
{
  v0 = [SKThreadSafeMapTable alloc];
  id v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  uint64_t v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  v2 = (void *)_fontDict;
  _fontDict = v1;
}

- (SKBitmapFont)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SKBitmapFont;
  v5 = [(SKBitmapFont *)&v26 init];
  unint64_t v6 = v5;
  if (v5)
  {
    v5->_internal = 0;
    v24 = 0;
    unint64_t v25 = 0;
    v23 = &v24;
    p_pair1 = &v5->_characterSpriteByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v5->_characterSpriteByChar, (void *)v5->_characterSpriteByChar.__tree_.__pair1_.__value_.__left_);
    v8 = v24;
    v6->_characterSpriteByChar.__tree_.__begin_node_ = &v24;
    p_pair1->__value_.__left_ = v8;
    unint64_t v9 = v25;
    v6->_characterSpriteByChar.__tree_.__pair3_.__value_ = v25;
    if (v9)
    {
      v8[2] = p_pair1;
      v23 = &v24;
      v24 = 0;
      unint64_t v25 = 0;
      v8 = 0;
    }
    else
    {
      v6->_characterSpriteByChar.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v23, v8);
    v24 = 0;
    unint64_t v25 = 0;
    v23 = &v24;
    v10 = &v6->_characterAdvanceByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v6->_characterAdvanceByChar, (void *)v6->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_);
    v11 = v24;
    v6->_characterAdvanceByChar.__tree_.__begin_node_ = v23;
    v6->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_ = v11;
    unint64_t v12 = v25;
    v6->_characterAdvanceByChar.__tree_.__pair3_.__value_ = v25;
    if (v12)
    {
      v11[2] = v10;
      v23 = &v24;
      v24 = 0;
      unint64_t v25 = 0;
      v11 = 0;
    }
    else
    {
      v6->_characterAdvanceByChar.__tree_.__begin_node_ = v10;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v23, v11);
    v24 = 0;
    unint64_t v25 = 0;
    v23 = &v24;
    v13 = &v6->_characterKerningByCharPair.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v6->_characterKerningByCharPair, (void *)v6->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_);
    v14 = v24;
    v6->_characterKerningByCharPair.__tree_.__begin_node_ = v23;
    v6->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_ = v14;
    unint64_t v15 = v25;
    v6->_characterKerningByCharPair.__tree_.__pair3_.__value_ = v25;
    if (v15)
    {
      v14[2] = v13;
      v23 = &v24;
      v24 = 0;
      unint64_t v25 = 0;
      v14 = 0;
    }
    else
    {
      v6->_characterKerningByCharPair.__tree_.__begin_node_ = v13;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v23, v14);
    if (onceToken != -1) {
      dispatch_once(&onceToken, &__block_literal_global_4);
    }
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileName"];
    fileName = v6->_fileName;
    v6->_fileName = (NSString *)v16;

    v18 = SKGetResourceBundle();
    uint64_t v19 = [v18 pathForResource:v6->_fileName ofType:@"fnt"];
    filePath = v6->_filePath;
    v6->_filePath = (NSString *)v19;

    v21 = [NSString stringWithContentsOfFile:v6->_filePath encoding:4 error:0];
    [(SKBitmapFont *)v6 loadFontWithTexture:0 fontDataString:v21];
  }
  return v6;
}

void __30__SKBitmapFont_initWithCoder___block_invoke()
{
  v0 = [SKThreadSafeMapTable alloc];
  id v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  uint64_t v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  v2 = (void *)_fontDict;
  _fontDict = v1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)loadFontWithTexture:(id)a3 fontDataString:(id)a4
{
  id v176 = a3;
  id v171 = a4;
  v177 = self;
  id obj = (id)objc_opt_new();
  v184[0] = 0;
  v184[1] = 0;
  v182[1] = 0;
  v183 = v184;
  v181 = (uint64_t *)v182;
  v182[0] = 0;
  v180[0] = 0;
  v180[1] = 0;
  v179 = (uint64_t *)v180;
  v175 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  id v6 = v171;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 componentsSeparatedByString:@"\n"];
    unint64_t v9 = [v8 objectAtIndex:0];
    uint64_t v10 = [v9 rangeOfString:@"info face=\""];
    unint64_t v12 = [v9 substringFromIndex:v10 + v11];

    v169 = objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "rangeOfString:", @"\""));
    objc_storeStrong((id *)&v177->_fontName, v169);
    v13 = [v8 objectAtIndex:1];

    uint64_t v14 = [v13 rangeOfString:@"common lineHeight="];
    uint64_t v16 = [v13 substringFromIndex:v14 + v15];

    objc_super v17 = objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "rangeOfString:", @" "));
    [v17 doubleValue];
    v177->_lineHeight = v18;

    uint64_t v19 = [v16 rangeOfString:@"base="];
    v21 = [v16 substringFromIndex:v19 + v20];

    v22 = objc_msgSend(v21, "substringToIndex:", objc_msgSend(v21, "rangeOfString:", @" "));
    [v22 doubleValue];
    v177->_baseLine = v23;

    v24 = [v8 objectAtIndex:2];

    uint64_t v25 = [v24 rangeOfString:@"file=\""];
    v27 = [v24 substringFromIndex:v25 + v26];

    v170 = objc_msgSend(v27, "substringToIndex:", objc_msgSend(v27, "rangeOfString:", @"\""));
    if (!v176)
    {
      if (v177->_internal) {
        +[SKTexture _textureWithImageNamed:v170];
      }
      else {
      id v176 = +[SKTexture textureWithImageNamed:v170];
      }
    }
    v29 = [v8 objectAtIndex:3];

    uint64_t v30 = [v29 rangeOfString:@"chars count="];
    v32 = [v29 substringFromIndex:v30 + v31];

    int v33 = [v32 intValue];
    BOOL v28 = 0;
    if (v33 >= 1 && v176)
    {
      if ([v8 count] >= (unint64_t)(v33 + 4))
      {
        unint64_t v167 = (v33 + 4);
        v168 = v7;
        v173 = v8;
        [v176 pixelSize];
        double v172 = v34;
        double v36 = v35;
        uint64_t v37 = 0;
        int v166 = v33;
        uint64_t v38 = v33;
        do
        {
          LOWORD(v178) = 0;
          v39 = [v173 objectAtIndex:v37 + 4];

          uint64_t v40 = [v39 rangeOfString:@"id="];
          v42 = [v39 substringFromIndex:v40 + v41];

          uint64_t v43 = [v42 rangeOfString:@" "];
          uint64_t v45 = v44;
          v46 = [v42 substringToIndex:v43];
          uint64_t v47 = [v46 intValue];

          v48 = [v42 substringFromIndex:v43 + v45];

          uint64_t v49 = [v48 rangeOfString:@"x="];
          v51 = [v48 substringFromIndex:v49 + v50];

          uint64_t v52 = [v51 rangeOfString:@" "];
          uint64_t v54 = v53;
          v55 = [v51 substringToIndex:v52];
          [v55 doubleValue];
          double v57 = v56;

          v58 = [v51 substringFromIndex:v52 + v54];

          uint64_t v59 = [v58 rangeOfString:@"y="];
          v61 = [v58 substringFromIndex:v59 + v60];

          uint64_t v62 = [v61 rangeOfString:@" "];
          uint64_t v64 = v63;
          v65 = [v61 substringToIndex:v62];
          [v65 doubleValue];
          double v67 = v66;

          v68 = [v61 substringFromIndex:v62 + v64];

          uint64_t v69 = [v68 rangeOfString:@"width="];
          v71 = [v68 substringFromIndex:v69 + v70];

          uint64_t v72 = [v71 rangeOfString:@" "];
          uint64_t v74 = v73;
          v75 = [v71 substringToIndex:v72];
          [v75 doubleValue];
          double v77 = v76;

          v78 = [v71 substringFromIndex:v72 + v74];

          uint64_t v79 = [v78 rangeOfString:@"height="];
          v81 = [v78 substringFromIndex:v79 + v80];

          uint64_t v82 = [v81 rangeOfString:@" "];
          uint64_t v84 = v83;
          v85 = [v81 substringToIndex:v82];
          [v85 doubleValue];
          double v87 = v86;

          v88 = [v81 substringFromIndex:v82 + v84];

          uint64_t v89 = [v88 rangeOfString:@"xoffset="];
          v91 = [v88 substringFromIndex:v89 + v90];

          uint64_t v92 = [v91 rangeOfString:@" "];
          uint64_t v94 = v93;
          v95 = [v91 substringToIndex:v92];
          [v95 doubleValue];
          double v97 = v96;

          v98 = [v91 substringFromIndex:v92 + v94];

          uint64_t v99 = [v98 rangeOfString:@"yoffset="];
          v101 = [v98 substringFromIndex:v99 + v100];

          uint64_t v102 = [v101 rangeOfString:@" "];
          uint64_t v104 = v103;
          v105 = [v101 substringToIndex:v102];
          [v105 doubleValue];
          double v107 = v106;

          v108 = [v101 substringFromIndex:v102 + v104];

          uint64_t v109 = [v108 rangeOfString:@"xadvance="];
          v111 = [v108 substringFromIndex:v109 + v110];

          uint64_t v112 = [v111 rangeOfString:@" "];
          uint64_t v114 = v113;
          v115 = [v111 substringToIndex:v112];
          [v115 doubleValue];
          v117 = v116;

          v118 = [v111 substringFromIndex:v112 + v114];

          uint64_t v119 = [v118 rangeOfString:@"letter=\""];
          v121 = [v118 substringFromIndex:v119 + v120];

          objc_msgSend(v121, "substringToIndex:", objc_msgSend(v121, "rangeOfString:", @"\""));
          v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ([(__CFString *)v122 isEqualToString:@"space"])
          {
            LOWORD(v178) = 32;

            v122 = @" ";
          }
          else if ([(__CFString *)v122 length])
          {
            LOWORD(v178) = [(__CFString *)v122 characterAtIndex:0];
          }
          else
          {
            LOWORD(v178) = 0;
          }
          v123 = +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v176, v57 / v172, (v36 - (v67 + v87)) / v36, v77 / v172, v87 / v36);
          if (SKGetGlobalFlippedFlag())
          {
            v124 = +[SKSpriteNode spriteNodeWithTexture:v123];
            objc_msgSend(v124, "setAnchorPoint:", 0.0, 0.0);
            v125 = v124;
            objc_msgSend(v124, "setPosition:", v97, v107 - v177->_lineHeight);
          }
          else
          {
            v126 = +[SKSpriteNode spriteNodeWithTexture:v123];
            objc_msgSend(v126, "setAnchorPoint:", 0.0, 1.0);
            v125 = v126;
            objc_msgSend(v126, "setPosition:", v97, v177->_lineHeight - v107);
          }
          [obj addObject:v125];
          v185[0] = &v178;
          v127 = std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>((uint64_t **)&v183, (unsigned __int16 *)&v178, (uint64_t)&std::piecewise_construct, v185);
          objc_storeStrong((id *)v127 + 5, v125);
          v185[0] = &v178;
          std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>(&v181, (unsigned __int16 *)&v178, (uint64_t)&std::piecewise_construct, v185)[5] = v117;
          v128 = [NSNumber numberWithInt:v47];
          [v175 setObject:v122 forKey:v128];

          ++v37;
          v32 = v121;
        }
        while (v38 != v37);
        if ([v173 count] > v167)
        {
          v129 = [v173 objectAtIndex:v167];

          uint64_t v130 = [v129 rangeOfString:@"kernings count="];
          if (v130 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v121 = v129;
          }
          else
          {
            v132 = [v129 substringFromIndex:v130 + v131];

            int v133 = [v132 intValue];
            if ([v173 count] <= (unint64_t)(v133 + (int)v167) || v133 < 1)
            {
              v121 = v132;
            }
            else
            {
              uint64_t v134 = v133;
              uint64_t v135 = v166 + 5;
              v121 = v132;
              do
              {
                v136 = [v173 objectAtIndex:v135];

                uint64_t v137 = [v136 rangeOfString:@"first="];
                v139 = [v136 substringFromIndex:v137 + v138];

                uint64_t v140 = [v139 rangeOfString:@" "];
                uint64_t v142 = v141;
                v143 = [v139 substringToIndex:v140];
                uint64_t v144 = [v143 intValue];

                v145 = [v139 substringFromIndex:v140 + v142];

                uint64_t v146 = [v145 rangeOfString:@"second="];
                v148 = [v145 substringFromIndex:v146 + v147];

                uint64_t v149 = [v148 rangeOfString:@" "];
                uint64_t v151 = v150;
                v152 = [v148 substringToIndex:v149];
                uint64_t v153 = [v152 intValue];

                v154 = [v148 substringFromIndex:v149 + v151];

                uint64_t v155 = [v154 rangeOfString:@"amount="];
                v121 = [v154 substringFromIndex:v155 + v156];

                [v121 doubleValue];
                v158 = v157;
                v159 = [NSNumber numberWithInt:v144];
                v160 = [v175 objectForKey:v159];
                int v161 = [v160 characterAtIndex:0];

                v162 = [NSNumber numberWithInt:v153];
                v163 = [v175 objectForKey:v162];
                int v164 = [v163 characterAtIndex:0];

                if (v161 && v164)
                {
                  int v178 = v164 | (v161 << 16);
                  v185[0] = &v178;
                  std::__tree<std::__value_type<unsigned int,double>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,double>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v179, (unsigned int *)&v178, (uint64_t)&std::piecewise_construct, (_DWORD **)v185)[5] = v158;
                }
                ++v135;
                --v134;
              }
              while (v134);
            }
          }
        }
        objc_storeStrong((id *)&v177->_characterSprites, obj);
        v7 = v168;
        v8 = v173;
        if (&v177->_characterSpriteByChar != (map<unsigned short, SKSpriteNode *, std::less<unsigned short>, std::allocator<std::pair<const unsigned short, SKSpriteNode *>>> *)&v183) {
          std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__tree_node<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,void *> *,long>>((uint64_t **)&v177->_characterSpriteByChar, v183, v184);
        }
        if (&v177->_characterAdvanceByChar != (map<unsigned short, double, std::less<unsigned short>, std::allocator<std::pair<const unsigned short, double>>> *)&v181) {
          std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned short,double>,std::__tree_node<std::__value_type<unsigned short,double>,void *> *,long>>((uint64_t **)&v177->_characterAdvanceByChar, v181, v182);
        }
        if (&v177->_characterKerningByCharPair != (map<unsigned int, double, std::less<unsigned int>, std::allocator<std::pair<const unsigned int, double>>> *)&v179) {
          std::__tree<std::__value_type<unsigned int,double>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,double>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned int,double>,std::__tree_node<std::__value_type<unsigned int,double>,void *> *,long>>((uint64_t **)&v177->_characterKerningByCharPair, v179, v180);
        }
        if (v177->_fileName) {
          objc_msgSend((id)_fontDict, "setObject:forKey:");
        }
        BOOL v28 = 1;
        v32 = v121;
      }
      else
      {
        BOOL v28 = 0;
      }
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v179, v180[0]);
  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v181, v182[0]);
  std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v183, (void *)v184[0]);

  return v28;
}

+ (id)fontForFileNamed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)_fontDict objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = SKGetResourceBundle();
      unint64_t v9 = [v8 pathForResource:v4 ofType:@"fnt"];

      if (v9)
      {
        uint64_t v10 = objc_alloc_init(SKBitmapFont);
        objc_storeStrong((id *)&v10->_fileName, a3);
        objc_storeStrong((id *)&v10->_filePath, v9);
        uint64_t v11 = [NSString stringWithContentsOfFile:v10->_filePath encoding:4 error:0];
        BOOL v12 = [(SKBitmapFont *)v10 loadFontWithTexture:0 fontDataString:v11];

        if (v12) {
          v7 = v10;
        }
        else {
          v7 = 0;
        }
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

- (id)spriteForCharacterNamed:(unsigned __int16)a3
{
  unsigned __int16 v5 = a3;
  id v6 = &v5;
  id v3 = objc_msgSend(std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>((uint64_t **)&self->_characterSpriteByChar, &v5, (uint64_t)&std::piecewise_construct, &v6)[5], "copy");

  return v3;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (double)advanceForCharacterNamed:(unsigned __int16)a3
{
  unsigned __int16 v4 = a3;
  unsigned __int16 v5 = &v4;
  return *((double *)std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>((uint64_t **)&self->_characterAdvanceByChar, &v4, (uint64_t)&std::piecewise_construct, &v5)+ 5);
}

- (double)kerningForCharacterNamed:(unsigned __int16)a3 followedBy:(unsigned __int16)a4
{
  unsigned int v5 = a4 | (a3 << 16);
  id v6 = (int *)&v5;
  return *((double *)std::__tree<std::__value_type<unsigned int,double>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,double>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_characterKerningByCharPair, &v5, (uint64_t)&std::piecewise_construct, &v6)+ 5);
}

+ (id)fontWithTexture:(id)a3 fontDataString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(SKBitmapFont);
    if ([(SKBitmapFont *)v7 loadFontWithTexture:v5 fontDataString:v6]) {
      goto LABEL_5;
    }
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&self->_characterKerningByCharPair, (void *)self->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&self->_characterAdvanceByChar, (void *)self->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&self->_characterSpriteByChar, (void *)self->_characterSpriteByChar.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_characterSprites, 0);
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_fontName, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 6) = (char *)self + 56;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = (char *)self + 80;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = (char *)self + 104;
  return self;
}

+ (id)_fontForFileNamed:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unsigned __int16 v4 = v3;
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 pathForResource:v4 ofType:@"fnt"];

    v7 = [(id)_fontDict objectForKey:v6];
    v8 = v7;
    if (v7)
    {
      unint64_t v9 = v7;
    }
    else
    {
      uint64_t v10 = objc_alloc_init(SKBitmapFont);
      objc_storeStrong((id *)&v10->_fileName, v6);
      objc_storeStrong((id *)&v10->_filePath, v6);
      v10->_internal = 1;
      uint64_t v11 = [NSString stringWithContentsOfFile:v10->_filePath encoding:4 error:0];
      BOOL v12 = [(SKBitmapFont *)v10 loadFontWithTexture:0 fontDataString:v11];

      if (v12) {
        unint64_t v9 = v10;
      }
      else {
        unint64_t v9 = 0;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

@end