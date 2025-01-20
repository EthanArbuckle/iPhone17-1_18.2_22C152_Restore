@interface MTRContentLauncherClusterLaunchURLParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRContentLauncherClusterBrandingInformationStruct)brandingInformation;
- (MTRContentLauncherClusterLaunchURLParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)contentURL;
- (NSString)displayString;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBrandingInformation:(MTRContentLauncherClusterBrandingInformationStruct *)brandingInformation;
- (void)setContentURL:(NSString *)contentURL;
- (void)setDisplayString:(NSString *)displayString;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRContentLauncherClusterLaunchURLParams

- (MTRContentLauncherClusterLaunchURLParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRContentLauncherClusterLaunchURLParams;
  v2 = [(MTRContentLauncherClusterLaunchURLParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    contentURL = v2->_contentURL;
    v2->_contentURL = (NSString *)&stru_26F969DC8;

    displayString = v3->_displayString;
    v3->_displayString = 0;

    brandingInformation = v3->_brandingInformation;
    v3->_brandingInformation = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterLaunchURLParams);
  v7 = objc_msgSend_contentURL(self, v5, v6);
  objc_msgSend_setContentURL_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_displayString(self, v9, v10);
  objc_msgSend_setDisplayString_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_brandingInformation(self, v13, v14);
  objc_msgSend_setBrandingInformation_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: contentURL:%@; displayString:%@; brandingInformation:%@; >",
    v5,
    self->_contentURL,
    self->_displayString,
  v7 = self->_brandingInformation);

  return v7;
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(NSString *)contentURL
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(NSString *)displayString
{
}

- (MTRContentLauncherClusterBrandingInformationStruct)brandingInformation
{
  return self->_brandingInformation;
}

- (void)setBrandingInformation:(MTRContentLauncherClusterBrandingInformationStruct *)brandingInformation
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_brandingInformation, 0);
  objc_storeStrong((id *)&self->_displayString, 0);

  objc_storeStrong((id *)&self->_contentURL, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v537 = 0;
  long long v534 = 0uLL;
  char v535 = 0;
  v533[0] = 0;
  v533[1] = 0;
  v532 = v533;
  objc_msgSend_contentURL(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_UTF8String(v7, v8, v9);
  uint64_t v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v7, v11, 4);
  sub_24479476C(v526, v10, v12);

  long long v534 = *(_OWORD *)v526;
  v15 = objc_msgSend_displayString(self, v13, v14);

  if (v15)
  {
    char v535 = 1;
    long long v536 = 0uLL;
    objc_msgSend_displayString(self, v16, v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_UTF8String(v18, v19, v20);
    uint64_t v23 = objc_msgSend_lengthOfBytesUsingEncoding_(v18, v22, 4);
    sub_24479476C(v526, v21, v23);

    long long v536 = *(_OWORD *)v526;
  }
  v24 = objc_msgSend_brandingInformation(self, v16, v17);

  if (v24)
  {
    char v537 = 1;
    long long v538 = 0u;
    memset(v539, 0, sizeof(v539));
    memset(v540, 0, sizeof(v540));
    long long v541 = 0u;
    long long v542 = 0u;
    long long v543 = 0u;
    memset(v544, 0, sizeof(v544));
    memset(v545, 0, sizeof(v545));
    long long v546 = 0u;
    long long v547 = 0u;
    long long v548 = 0u;
    memset(v549, 0, sizeof(v549));
    v27 = objc_msgSend_brandingInformation(self, v25, v26);
    objc_msgSend_providerName(v27, v28, v29);
    id v30 = objc_claimAutoreleasedReturnValue();
    uint64_t v33 = objc_msgSend_UTF8String(v30, v31, v32);
    uint64_t v35 = objc_msgSend_lengthOfBytesUsingEncoding_(v30, v34, 4);
    sub_24479476C(v526, v33, v35);

    long long v538 = *(_OWORD *)v526;
    v38 = objc_msgSend_brandingInformation(self, v36, v37);
    v41 = objc_msgSend_background(v38, v39, v40);

    if (v41)
    {
      LOBYTE(v539[0]) = 1;
      memset((char *)v539 + 8, 0, 80);
      v44 = objc_msgSend_brandingInformation(self, v42, v43);
      v47 = objc_msgSend_background(v44, v45, v46);
      v50 = objc_msgSend_imageURL(v47, v48, v49);

      if (v50)
      {
        BYTE8(v539[0]) = 1;
        v539[1] = 0uLL;
        v53 = objc_msgSend_brandingInformation(self, v51, v52);
        v56 = objc_msgSend_background(v53, v54, v55);
        objc_msgSend_imageURL(v56, v57, v58);
        id v59 = objc_claimAutoreleasedReturnValue();
        uint64_t v62 = objc_msgSend_UTF8String(v59, v60, v61);
        uint64_t v64 = objc_msgSend_lengthOfBytesUsingEncoding_(v59, v63, 4);
        sub_24479476C(v526, v62, v64);

        v539[1] = *(_OWORD *)v526;
      }
      v65 = objc_msgSend_brandingInformation(self, v51, v52);
      v68 = objc_msgSend_background(v65, v66, v67);
      v71 = objc_msgSend_color(v68, v69, v70);

      if (v71)
      {
        LOBYTE(v539[2]) = 1;
        *((void *)&v539[2] + 1) = 0;
        *(void *)&v539[3] = 0;
        v74 = objc_msgSend_brandingInformation(self, v72, v73);
        v77 = objc_msgSend_background(v74, v75, v76);
        objc_msgSend_color(v77, v78, v79);
        id v80 = objc_claimAutoreleasedReturnValue();
        uint64_t v83 = objc_msgSend_UTF8String(v80, v81, v82);
        uint64_t v85 = objc_msgSend_lengthOfBytesUsingEncoding_(v80, v84, 4);
        sub_24479476C(v526, v83, v85);

        *(_OWORD *)((char *)&v539[2] + 8) = *(_OWORD *)v526;
      }
      v86 = objc_msgSend_brandingInformation(self, v72, v73);
      v89 = objc_msgSend_background(v86, v87, v88);
      v92 = objc_msgSend_size(v89, v90, v91);

      if (v92)
      {
        BYTE8(v539[3]) = 1;
        memset(&v539[4], 0, 24);
        v93 = objc_msgSend_brandingInformation(self, v42, v43);
        v96 = objc_msgSend_background(v93, v94, v95);
        v99 = objc_msgSend_size(v96, v97, v98);
        v102 = objc_msgSend_width(v99, v100, v101);
        objc_msgSend_doubleValue(v102, v103, v104);
        *(void *)&v539[4] = v105;

        v108 = objc_msgSend_brandingInformation(self, v106, v107);
        v111 = objc_msgSend_background(v108, v109, v110);
        v114 = objc_msgSend_size(v111, v112, v113);
        v117 = objc_msgSend_height(v114, v115, v116);
        objc_msgSend_doubleValue(v117, v118, v119);
        *((void *)&v539[4] + 1) = v120;

        v123 = objc_msgSend_brandingInformation(self, v121, v122);
        v126 = objc_msgSend_background(v123, v124, v125);
        v129 = objc_msgSend_size(v126, v127, v128);
        v132 = objc_msgSend_metric(v129, v130, v131);
        LOBYTE(v539[5]) = objc_msgSend_unsignedCharValue(v132, v133, v134);
      }
    }
    v135 = objc_msgSend_brandingInformation(self, v42, v43);
    v138 = objc_msgSend_logo(v135, v136, v137);

    if (v138)
    {
      BYTE8(v539[5]) = 1;
      memset(v540, 0, sizeof(v540));
      long long v541 = 0u;
      long long v542 = 0u;
      long long v543 = 0u;
      v141 = objc_msgSend_brandingInformation(self, v139, v140);
      v144 = objc_msgSend_logo(v141, v142, v143);
      v147 = objc_msgSend_imageURL(v144, v145, v146);

      if (v147)
      {
        LOBYTE(v540[0]) = 1;
        *((void *)&v540[0] + 1) = 0;
        *(void *)&v540[1] = 0;
        v150 = objc_msgSend_brandingInformation(self, v148, v149);
        v153 = objc_msgSend_logo(v150, v151, v152);
        objc_msgSend_imageURL(v153, v154, v155);
        id v156 = objc_claimAutoreleasedReturnValue();
        uint64_t v159 = objc_msgSend_UTF8String(v156, v157, v158);
        uint64_t v161 = objc_msgSend_lengthOfBytesUsingEncoding_(v156, v160, 4);
        sub_24479476C(v526, v159, v161);

        *(_OWORD *)((char *)v540 + 8) = *(_OWORD *)v526;
      }
      v162 = objc_msgSend_brandingInformation(self, v148, v149);
      v165 = objc_msgSend_logo(v162, v163, v164);
      v168 = objc_msgSend_color(v165, v166, v167);

      if (v168)
      {
        BYTE8(v540[1]) = 1;
        long long v541 = 0uLL;
        v171 = objc_msgSend_brandingInformation(self, v169, v170);
        v174 = objc_msgSend_logo(v171, v172, v173);
        objc_msgSend_color(v174, v175, v176);
        id v177 = objc_claimAutoreleasedReturnValue();
        uint64_t v180 = objc_msgSend_UTF8String(v177, v178, v179);
        uint64_t v182 = objc_msgSend_lengthOfBytesUsingEncoding_(v177, v181, 4);
        sub_24479476C(v526, v180, v182);

        long long v541 = *(_OWORD *)v526;
      }
      v183 = objc_msgSend_brandingInformation(self, v169, v170);
      v186 = objc_msgSend_logo(v183, v184, v185);
      v189 = objc_msgSend_size(v186, v187, v188);

      if (v189)
      {
        LOBYTE(v542) = 1;
        long long v543 = 0uLL;
        *((void *)&v542 + 1) = 0;
        v190 = objc_msgSend_brandingInformation(self, v139, v140);
        v193 = objc_msgSend_logo(v190, v191, v192);
        v196 = objc_msgSend_size(v193, v194, v195);
        v199 = objc_msgSend_width(v196, v197, v198);
        objc_msgSend_doubleValue(v199, v200, v201);
        *((void *)&v542 + 1) = v202;

        v205 = objc_msgSend_brandingInformation(self, v203, v204);
        v208 = objc_msgSend_logo(v205, v206, v207);
        v211 = objc_msgSend_size(v208, v209, v210);
        v214 = objc_msgSend_height(v211, v212, v213);
        objc_msgSend_doubleValue(v214, v215, v216);
        *(void *)&long long v543 = v217;

        v220 = objc_msgSend_brandingInformation(self, v218, v219);
        v223 = objc_msgSend_logo(v220, v221, v222);
        v226 = objc_msgSend_size(v223, v224, v225);
        v229 = objc_msgSend_metric(v226, v227, v228);
        BYTE8(v543) = objc_msgSend_unsignedCharValue(v229, v230, v231);
      }
    }
    v232 = objc_msgSend_brandingInformation(self, v139, v140);
    v235 = objc_msgSend_progressBar(v232, v233, v234);

    if (v235)
    {
      LOBYTE(v544[0]) = 1;
      memset((char *)v544 + 8, 0, 80);
      v238 = objc_msgSend_brandingInformation(self, v236, v237);
      v241 = objc_msgSend_progressBar(v238, v239, v240);
      v244 = objc_msgSend_imageURL(v241, v242, v243);

      if (v244)
      {
        BYTE8(v544[0]) = 1;
        v544[1] = 0uLL;
        v247 = objc_msgSend_brandingInformation(self, v245, v246);
        v250 = objc_msgSend_progressBar(v247, v248, v249);
        objc_msgSend_imageURL(v250, v251, v252);
        id v253 = objc_claimAutoreleasedReturnValue();
        uint64_t v256 = objc_msgSend_UTF8String(v253, v254, v255);
        uint64_t v258 = objc_msgSend_lengthOfBytesUsingEncoding_(v253, v257, 4);
        sub_24479476C(v526, v256, v258);

        v544[1] = *(_OWORD *)v526;
      }
      v259 = objc_msgSend_brandingInformation(self, v245, v246);
      v262 = objc_msgSend_progressBar(v259, v260, v261);
      v265 = objc_msgSend_color(v262, v263, v264);

      if (v265)
      {
        LOBYTE(v544[2]) = 1;
        *((void *)&v544[2] + 1) = 0;
        *(void *)&v544[3] = 0;
        v268 = objc_msgSend_brandingInformation(self, v266, v267);
        v271 = objc_msgSend_progressBar(v268, v269, v270);
        objc_msgSend_color(v271, v272, v273);
        id v274 = objc_claimAutoreleasedReturnValue();
        uint64_t v277 = objc_msgSend_UTF8String(v274, v275, v276);
        uint64_t v279 = objc_msgSend_lengthOfBytesUsingEncoding_(v274, v278, 4);
        sub_24479476C(v526, v277, v279);

        *(_OWORD *)((char *)&v544[2] + 8) = *(_OWORD *)v526;
      }
      v280 = objc_msgSend_brandingInformation(self, v266, v267);
      v283 = objc_msgSend_progressBar(v280, v281, v282);
      v286 = objc_msgSend_size(v283, v284, v285);

      if (v286)
      {
        BYTE8(v544[3]) = 1;
        memset(&v544[4], 0, 24);
        v287 = objc_msgSend_brandingInformation(self, v236, v237);
        v290 = objc_msgSend_progressBar(v287, v288, v289);
        v293 = objc_msgSend_size(v290, v291, v292);
        v296 = objc_msgSend_width(v293, v294, v295);
        objc_msgSend_doubleValue(v296, v297, v298);
        *(void *)&v544[4] = v299;

        v302 = objc_msgSend_brandingInformation(self, v300, v301);
        v305 = objc_msgSend_progressBar(v302, v303, v304);
        v308 = objc_msgSend_size(v305, v306, v307);
        v311 = objc_msgSend_height(v308, v309, v310);
        objc_msgSend_doubleValue(v311, v312, v313);
        *((void *)&v544[4] + 1) = v314;

        v317 = objc_msgSend_brandingInformation(self, v315, v316);
        v320 = objc_msgSend_progressBar(v317, v318, v319);
        v323 = objc_msgSend_size(v320, v321, v322);
        v326 = objc_msgSend_metric(v323, v324, v325);
        LOBYTE(v544[5]) = objc_msgSend_unsignedCharValue(v326, v327, v328);
      }
    }
    v329 = objc_msgSend_brandingInformation(self, v236, v237);
    v332 = objc_msgSend_splash(v329, v330, v331);

    if (v332)
    {
      BYTE8(v544[5]) = 1;
      memset(v545, 0, sizeof(v545));
      long long v546 = 0u;
      long long v547 = 0u;
      long long v548 = 0u;
      v335 = objc_msgSend_brandingInformation(self, v333, v334);
      v338 = objc_msgSend_splash(v335, v336, v337);
      v341 = objc_msgSend_imageURL(v338, v339, v340);

      if (v341)
      {
        LOBYTE(v545[0]) = 1;
        *((void *)&v545[0] + 1) = 0;
        *(void *)&v545[1] = 0;
        v344 = objc_msgSend_brandingInformation(self, v342, v343);
        v347 = objc_msgSend_splash(v344, v345, v346);
        objc_msgSend_imageURL(v347, v348, v349);
        id v350 = objc_claimAutoreleasedReturnValue();
        uint64_t v353 = objc_msgSend_UTF8String(v350, v351, v352);
        uint64_t v355 = objc_msgSend_lengthOfBytesUsingEncoding_(v350, v354, 4);
        sub_24479476C(v526, v353, v355);

        *(_OWORD *)((char *)v545 + 8) = *(_OWORD *)v526;
      }
      v356 = objc_msgSend_brandingInformation(self, v342, v343);
      v359 = objc_msgSend_splash(v356, v357, v358);
      v362 = objc_msgSend_color(v359, v360, v361);

      if (v362)
      {
        BYTE8(v545[1]) = 1;
        long long v546 = 0uLL;
        v365 = objc_msgSend_brandingInformation(self, v363, v364);
        v368 = objc_msgSend_splash(v365, v366, v367);
        objc_msgSend_color(v368, v369, v370);
        id v371 = objc_claimAutoreleasedReturnValue();
        uint64_t v374 = objc_msgSend_UTF8String(v371, v372, v373);
        uint64_t v376 = objc_msgSend_lengthOfBytesUsingEncoding_(v371, v375, 4);
        sub_24479476C(v526, v374, v376);

        long long v546 = *(_OWORD *)v526;
      }
      v377 = objc_msgSend_brandingInformation(self, v363, v364);
      v380 = objc_msgSend_splash(v377, v378, v379);
      v383 = objc_msgSend_size(v380, v381, v382);

      if (v383)
      {
        LOBYTE(v547) = 1;
        *((void *)&v547 + 1) = 0;
        long long v548 = 0uLL;
        v384 = objc_msgSend_brandingInformation(self, v333, v334);
        v387 = objc_msgSend_splash(v384, v385, v386);
        v390 = objc_msgSend_size(v387, v388, v389);
        v393 = objc_msgSend_width(v390, v391, v392);
        objc_msgSend_doubleValue(v393, v394, v395);
        *((void *)&v547 + 1) = v396;

        v399 = objc_msgSend_brandingInformation(self, v397, v398);
        v402 = objc_msgSend_splash(v399, v400, v401);
        v405 = objc_msgSend_size(v402, v403, v404);
        v408 = objc_msgSend_height(v405, v406, v407);
        objc_msgSend_doubleValue(v408, v409, v410);
        *(void *)&long long v548 = v411;

        v414 = objc_msgSend_brandingInformation(self, v412, v413);
        v417 = objc_msgSend_splash(v414, v415, v416);
        v420 = objc_msgSend_size(v417, v418, v419);
        v423 = objc_msgSend_metric(v420, v421, v422);
        BYTE8(v548) = objc_msgSend_unsignedCharValue(v423, v424, v425);
      }
    }
    v426 = objc_msgSend_brandingInformation(self, v333, v334);
    v429 = objc_msgSend_waterMark(v426, v427, v428);

    if (v429)
    {
      v549[0] = 1;
      memset(&v549[8], 0, 80);
      v432 = objc_msgSend_brandingInformation(self, v430, v431);
      v435 = objc_msgSend_waterMark(v432, v433, v434);
      v438 = objc_msgSend_imageURL(v435, v436, v437);

      if (v438)
      {
        v549[8] = 1;
        *(_OWORD *)&v549[16] = 0uLL;
        v441 = objc_msgSend_brandingInformation(self, v439, v440);
        v444 = objc_msgSend_waterMark(v441, v442, v443);
        objc_msgSend_imageURL(v444, v445, v446);
        id v447 = objc_claimAutoreleasedReturnValue();
        uint64_t v450 = objc_msgSend_UTF8String(v447, v448, v449);
        uint64_t v452 = objc_msgSend_lengthOfBytesUsingEncoding_(v447, v451, 4);
        sub_24479476C(v526, v450, v452);

        *(_OWORD *)&v549[16] = *(_OWORD *)v526;
      }
      v453 = objc_msgSend_brandingInformation(self, v439, v440);
      v456 = objc_msgSend_waterMark(v453, v454, v455);
      v459 = objc_msgSend_color(v456, v457, v458);

      if (v459)
      {
        v549[32] = 1;
        *(void *)&v549[40] = 0;
        *(void *)&v549[48] = 0;
        v462 = objc_msgSend_brandingInformation(self, v460, v461);
        v465 = objc_msgSend_waterMark(v462, v463, v464);
        objc_msgSend_color(v465, v466, v467);
        id v468 = objc_claimAutoreleasedReturnValue();
        uint64_t v471 = objc_msgSend_UTF8String(v468, v469, v470);
        uint64_t v473 = objc_msgSend_lengthOfBytesUsingEncoding_(v468, v472, 4);
        sub_24479476C(v526, v471, v473);

        *(_OWORD *)&v549[40] = *(_OWORD *)v526;
      }
      v474 = objc_msgSend_brandingInformation(self, v460, v461);
      v477 = objc_msgSend_waterMark(v474, v475, v476);
      v480 = objc_msgSend_size(v477, v478, v479);

      if (v480)
      {
        v549[56] = 1;
        memset(&v549[64], 0, 24);
        v483 = objc_msgSend_brandingInformation(self, v481, v482);
        v486 = objc_msgSend_waterMark(v483, v484, v485);
        v489 = objc_msgSend_size(v486, v487, v488);
        v492 = objc_msgSend_width(v489, v490, v491);
        objc_msgSend_doubleValue(v492, v493, v494);
        *(void *)&v549[64] = v495;

        v498 = objc_msgSend_brandingInformation(self, v496, v497);
        v501 = objc_msgSend_waterMark(v498, v499, v500);
        v504 = objc_msgSend_size(v501, v502, v503);
        v507 = objc_msgSend_height(v504, v505, v506);
        objc_msgSend_doubleValue(v507, v508, v509);
        *(void *)&v549[72] = v510;

        v513 = objc_msgSend_brandingInformation(self, v511, v512);
        v516 = objc_msgSend_waterMark(v513, v514, v515);
        v519 = objc_msgSend_size(v516, v517, v518);
        v522 = objc_msgSend_metric(v519, v520, v521);
        v549[80] = objc_msgSend_unsignedCharValue(v522, v523, v524);
      }
    }
  }
  sub_244CC8F5C(0x62FuLL, 0, &v531);
  if (v531)
  {
    sub_244CB62B8((uint64_t)v526);
    v528 = 0;
    v529 = 0;
    v527 = &unk_26F9536C8;
    char v530 = 0;
    sub_2447945A0((uint64_t)&v527, &v531, 0);
    sub_244CB6318((uint64_t)v526, (uint64_t)&v527, 0xFFFFFFFF, (uint64_t)v550);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2448372D4((uint64_t)&v534, v526, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v526, &v531, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v531);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v527 = &unk_26F9536C8;
    sub_244794634(&v529);
    sub_244794634(&v528);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 29727;
  }
  sub_244794634(&v531);
  return (ChipError *)sub_24479466C((uint64_t)&v532);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 29756;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end