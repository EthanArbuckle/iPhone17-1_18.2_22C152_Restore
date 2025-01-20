uint64_t sub_4628()
{
  uint64_t vars8;

  qword_193A0 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_46DC(id a1)
{
  v3[0] = &off_156B0;
  v3[1] = &off_156C8;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_156E0;
  v4[2] = NTKFaceBundleStyle3;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)qword_193C0;
  qword_193C0 = v1;
}

void sub_4944(id a1)
{
  v7[0] = &off_15F98;
  v7[1] = &off_15FB0;
  v8[0] = &off_15F80;
  uint64_t v1 = +[NSArray arrayWithObjects:v7 count:2];
  v8[1] = v1;
  v8[2] = &off_15FC8;
  v2 = +[NSArray arrayWithObjects:v8 count:3];
  v9[0] = v2;
  v6[0] = &off_15FE0;
  v6[1] = &off_15FF8;
  v3 = +[NSArray arrayWithObjects:v6 count:2];
  v9[1] = v3;
  v9[2] = &off_16010;
  v9[3] = &off_16028;
  v9[4] = &off_16040;
  uint64_t v4 = +[NSArray arrayWithObjects:v9 count:5];
  v5 = (void *)qword_193D0;
  qword_193D0 = v4;
}

void sub_4C60(id a1)
{
  uint64_t v1 = +[NTKGreyhoundFontLoader nyNumeralsBlackFontDescriptor];
  v14[0] = v1;
  v2 = +[NTKGreyhoundFontLoader nyNumeralsHeavyFontDescriptor];
  v14[1] = v2;
  v3 = +[NSArray arrayWithObjects:v14 count:2];
  v15[0] = v3;
  uint64_t v4 = +[NTKGreyhoundFontLoader sfNumeralsBlackFontDescriptor];
  v13[0] = v4;
  v5 = +[NTKGreyhoundFontLoader sfNumeralsHeavyFontDescriptor];
  v13[1] = v5;
  v6 = +[NSArray arrayWithObjects:v13 count:2];
  v15[1] = v6;
  v7 = +[NTKGreyhoundFontLoader tokyoBlackFontDescriptor];
  v8 = +[NTKGreyhoundFontLoader tokyoHeavyFontDescriptor];
  v12[1] = v8;
  v9 = +[NSArray arrayWithObjects:v12 count:2];
  v15[2] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v15 count:3];
  v11 = (void *)qword_193E0;
  qword_193E0 = v10;
}

void sub_4DEC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  objc_msgSend(v3, "scaledPoint:", 37.0, 0.0);
  qword_194E0 = v4;
  *(void *)algn_194E8 = v5;
  [v3 scaledPoint:0.5];
  qword_194F0 = v6;
  unk_194F8 = v7;
  objc_msgSend(v3, "scaledPoint:");
  qword_19500 = v8;
  unk_19508 = v9;
  [v3 scaledPoint:2.5];
  qword_19510 = v10;
  unk_19518 = v11;
  objc_msgSend(v3, "scaledPoint:", 37.0, -3.0);
  qword_19520 = v12;
  unk_19528 = v13;
  objc_msgSend(v3, "scaledPoint:", -2.0, 58.5);
  qword_19530 = v14;
  unk_19538 = v15;
  objc_msgSend(v3, "scaledPoint:", -36.0, -3.0);
  qword_19540 = v16;
  unk_19548 = v17;
  [v3 scaledPoint:0.5];
  qword_19550 = v18;
  unk_19558 = v19;
  objc_msgSend(v3, "scaledPoint:");
  qword_19560 = v20;
  unk_19568 = v21;
  [v3 scaledPoint:-7.5];
  qword_19570 = v22;
  unk_19578 = v23;
  objc_msgSend(v3, "scaledPoint:");
  qword_19580 = v24;
  unk_19588 = v25;
  objc_msgSend(v3, "scaledPoint:", -2.5, -48.5);
  qword_19590 = v26;
  unk_19598 = v27;
  [v3 scaledPoint:65.5];
  qword_195A0 = v28;
  unk_195A8 = v29;
  objc_msgSend(v3, "scaledPoint:", 61.5, -37.0);
  qword_195B0 = v30;
  unk_195B8 = v31;
  objc_msgSend(v3, "scaledPoint:", 56.5, 0.5);
  qword_195C0 = v32;
  unk_195C8 = v33;
  objc_msgSend(v3, "scaledPoint:", 52.0, 38.0);
  qword_195D0 = v34;
  unk_195D8 = v35;
  [v3 scaledPoint:58.5];
  qword_195E0 = v36;
  unk_195E8 = v37;
  objc_msgSend(v3, "scaledPoint:", 3.5, 75.0);
  qword_195F0 = v38;
  unk_195F8 = v39;
  objc_msgSend(v3, "scaledPoint:");
  qword_19600 = v40;
  unk_19608 = v41;
  objc_msgSend(v3, "scaledPoint:");
  qword_19610 = v42;
  unk_19618 = v43;
  objc_msgSend(v3, "scaledPoint:", -54.5, 0.5);
  qword_19620 = v44;
  unk_19628 = v45;
  objc_msgSend(v3, "scaledPoint:", -60.0, -37.0);
  qword_19630 = v46;
  unk_19638 = v47;
  objc_msgSend(v3, "scaledPoint:", -54.5, -74.0);
  qword_19640 = v48;
  unk_19648 = v49;
  objc_msgSend(v3, "scaledPoint:", 4.5, -74.0);
  qword_19650 = v50;
  unk_19658 = v51;
  [v3 scaledPoint:61.5];
  qword_19660 = v52;
  unk_19668 = v53;
  objc_msgSend(v3, "scaledPoint:", 65.5, -38.5);
  qword_19670 = v54;
  unk_19678 = v55;
  objc_msgSend(v3, "scaledPoint:");
  qword_19680 = v56;
  unk_19688 = v57;
  objc_msgSend(v3, "scaledPoint:");
  qword_19690 = v58;
  unk_19698 = v59;
  objc_msgSend(v3, "scaledPoint:");
  qword_196A0 = v60;
  unk_196A8 = v61;
  objc_msgSend(v3, "scaledPoint:", 4.0, 74.0);
  qword_196B0 = v62;
  unk_196B8 = v63;
  objc_msgSend(v3, "scaledPoint:", -48.0, 74.0);
  qword_196C0 = v64;
  unk_196C8 = v65;
  [v3 scaledPoint:-48.5];
  qword_196D0 = v66;
  unk_196D8 = v67;
  objc_msgSend(v3, "scaledPoint:");
  qword_196E0 = v68;
  qword_196E8 = v69;
  objc_msgSend(v3, "scaledPoint:");
  qword_196F0 = v70;
  qword_196F8 = v71;
  objc_msgSend(v3, "scaledPoint:", -53.0, -75.5);
  qword_19700 = v72;
  qword_19708 = v73;
  objc_msgSend(v3, "scaledPoint:", 4.5, -75.5);
  qword_19710 = v74;
  qword_19718 = v75;
  [v3 scaledPoint:60.0];
  qword_19720 = v76;
  qword_19728 = v77;
  [v3 scaledPoint:63.5];
  qword_19730 = v78;
  qword_19738 = v79;
  objc_msgSend(v3, "scaledPoint:", 60.0, 5.0);
  qword_19740 = v80;
  qword_19748 = v81;
  objc_msgSend(v3, "scaledPoint:", 56.5, 42.0);
  qword_19750 = v82;
  qword_19758 = v83;
  objc_msgSend(v3, "scaledPoint:", 56.5, 79.5);
  qword_19760 = v84;
  qword_19768 = v85;
  objc_msgSend(v3, "scaledPoint:", -2.5, 79.0);
  qword_19770 = v86;
  qword_19778 = v87;
  objc_msgSend(v3, "scaledPoint:", -53.0, 79.0);
  qword_19780 = v88;
  qword_19788 = v89;
  objc_msgSend(v3, "scaledPoint:", -53.5, 42.0);
  qword_19790 = v90;
  qword_19798 = v91;
  objc_msgSend(v3, "scaledPoint:", -64.5, 4.5);
  qword_197A0 = v92;
  qword_197A8 = v93;
  [v3 scaledPoint:-60.0];
  qword_197B0 = v94;
  qword_197B8 = v95;
  objc_msgSend(v3, "scaledPoint:", -52.5, -70.0);
  qword_197C0 = v96;
  qword_197C8 = v97;
  objc_msgSend(v3, "scaledPoint:", 1.0, -70.0);
  qword_197D0 = v98;
  qword_197D8 = v99;
  [v3 scaledPoint:52.5];
  qword_197E0 = v100;
  qword_197E8 = v101;
  objc_msgSend(v3, "scaledPoint:", 2.5, 52.5);
  qword_197F0 = v102;
  qword_197F8 = v103;
  objc_msgSend(v3, "scaledPoint:");
  qword_19800 = v104;
  qword_19808 = v105;
  objc_msgSend(v3, "scaledPoint:", 0.0, -53.5);
  qword_19810 = v106;
  qword_19818 = v107;
  objc_msgSend(v3, "scaledPoint:", 47.0, 4.5);
  qword_19820 = v108;
  qword_19828 = v109;
  [v3 scaledPoint:-0.5];
  qword_19830 = v110;
  qword_19838 = v111;
  objc_msgSend(v3, "scaledPoint:", -41.5, 4.0);
  qword_19840 = v112;
  qword_19848 = v113;
  [v3 scaledPoint:-4.0];
  qword_19850 = v114;
  qword_19858 = v115;
  objc_msgSend(v3, "scaledPoint:", 49.0, 12.5);
  qword_19860 = v116;
  qword_19868 = v117;
  objc_msgSend(v3, "scaledPoint:", 1.0, 72.0);
  qword_19870 = v118;
  qword_19878 = v119;
  objc_msgSend(v3, "scaledPoint:", -47.5, 12.5);
  qword_19880 = v120;
  qword_19888 = v121;
  [v3 scaledPoint:-15.0];
  qword_19890 = v122;
  qword_19898 = v123;
  objc_msgSend(v3, "scaledPoint:");
  qword_198A0 = v124;
  qword_198A8 = v125;
  objc_msgSend(v3, "scaledPoint:", 63.5, -39.5);
  qword_198B0 = v126;
  qword_198B8 = v127;
  objc_msgSend(v3, "scaledPoint:");
  qword_198C0 = v128;
  qword_198C8 = v129;
  objc_msgSend(v3, "scaledPoint:", 61.0, 37.5);
  qword_198D0 = v130;
  qword_198D8 = v131;
  [v3 scaledPoint:49.0];
  qword_198E0 = v132;
  qword_198E8 = v133;
  [v3 scaledPoint:0.5];
  qword_198F0 = v134;
  qword_198F8 = v135;
  objc_msgSend(v3, "scaledPoint:", -48.5, 75.5);
  qword_19900 = v136;
  qword_19908 = v137;
  objc_msgSend(v3, "scaledPoint:", -61.5, 37.5);
  qword_19910 = v138;
  qword_19918 = v139;
  objc_msgSend(v3, "scaledPoint:", -61.0, -1.5);
  qword_19920 = v140;
  qword_19928 = v141;
  objc_msgSend(v3, "scaledPoint:", -54.5, -39.5);
  qword_19930 = v142;
  qword_19938 = v143;
  objc_msgSend(v3, "scaledPoint:");
  qword_19940 = v144;
  qword_19948 = v145;
  objc_msgSend(v3, "scaledPoint:", 0.5, -77.5);
  qword_19950 = v146;
  qword_19958 = v147;
  objc_msgSend(v3, "scaledPoint:", 49.0, -78.5);
  qword_19960 = v148;
  qword_19968 = v149;
  [v3 scaledPoint:62.5];
  qword_19970 = v150;
  qword_19978 = v151;
  objc_msgSend(v3, "scaledPoint:", 62.5, -2.0);
  qword_19980 = v152;
  qword_19988 = v153;
  objc_msgSend(v3, "scaledPoint:", 61.0, 36.5);
  qword_19990 = v154;
  qword_19998 = v155;
  objc_msgSend(v3, "scaledPoint:");
  qword_199A0 = v156;
  qword_199A8 = v157;
  [v3 scaledPoint:0.5];
  qword_199B0 = v158;
  qword_199B8 = v159;
  objc_msgSend(v3, "scaledPoint:", -47.5, 75.0);
  qword_199C0 = v160;
  qword_199C8 = v161;
  objc_msgSend(v3, "scaledPoint:", -61.5, 36.5);
  qword_199D0 = v162;
  qword_199D8 = v163;
  objc_msgSend(v3, "scaledPoint:", -62.0, -2.0);
  qword_199E0 = v164;
  qword_199E8 = v165;
  objc_msgSend(v3, "scaledPoint:", -55.5, -40.0);
  qword_199F0 = v166;
  qword_199F8 = v167;
  objc_msgSend(v3, "scaledPoint:", -49.0, -78.5);
  qword_19A00 = v168;
  qword_19A08 = v169;
  objc_msgSend(v3, "scaledPoint:", 1.0, -78.5);
  qword_19A10 = v170;
  qword_19A18 = v171;
  objc_msgSend(v3, "scaledPoint:", 49.0, -70.0);
  qword_19A20 = v172;
  qword_19A28 = v173;
  objc_msgSend(v3, "scaledPoint:", 62.5, -33.0);
  qword_19A30 = v174;
  qword_19A38 = v175;
  objc_msgSend(v3, "scaledPoint:", 63.0, 4.5);
  qword_19A40 = v176;
  qword_19A48 = v177;
  objc_msgSend(v3, "scaledPoint:", 63.0, 42.0);
  qword_19A50 = v178;
  qword_19A58 = v179;
  objc_msgSend(v3, "scaledPoint:", 53.5, 79.0);
  qword_19A60 = v180;
  qword_19A68 = v181;
  [v3 scaledPoint:0.5];
  qword_19A70 = v182;
  qword_19A78 = v183;
  objc_msgSend(v3, "scaledPoint:");
  qword_19A80 = v184;
  qword_19A88 = v185;
  [v3 scaledPoint:-62.5];
  qword_19A90 = v186;
  qword_19A98 = v187;
  objc_msgSend(v3, "scaledPoint:", -62.5, 4.5);
  qword_19AA0 = v188;
  qword_19AA8 = v189;
  objc_msgSend(v3, "scaledPoint:", -64.5, -33.0);
  qword_19AB0 = v190;
  qword_19AB8 = v191;
  objc_msgSend(v3, "scaledPoint:", -60.5, -70.0);
  qword_19AC0 = v192;
  qword_19AC8 = v193;
  objc_msgSend(v3, "scaledPoint:", -6.0, -70.0);
  qword_19AD0 = v194;
  qword_19AD8 = v195;
  objc_msgSend(v3, "scaledPoint:", 45.0, 7.5);
  qword_19AE0 = v196;
  qword_19AE8 = v197;
  objc_msgSend(v3, "scaledPoint:", 12.5, 54.0);
  qword_19AF0 = v198;
  qword_19AF8 = v199;
  objc_msgSend(v3, "scaledPoint:", -45.5, 7.5);
  qword_19B00 = v200;
  qword_19B08 = v201;
  objc_msgSend(v3, "scaledPoint:", -5.0, -54.5);
  qword_19B10 = v202;
  qword_19B18 = v203;
  objc_msgSend(v3, "scaledPoint:", 44.0, 8.0);
  qword_19B20 = v204;
  qword_19B28 = v205;
  objc_msgSend(v3, "scaledPoint:", 1.0, 52.5);
  qword_19B30 = v206;
  qword_19B38 = v207;
  objc_msgSend(v3, "scaledPoint:", -49.5, 8.0);
  qword_19B40 = v208;
  qword_19B48 = v209;
  objc_msgSend(v3, "scaledPoint:", -5.5, -60.5);
  qword_19B50 = v210;
  qword_19B58 = v211;
  objc_msgSend(v3, "scaledPoint:", 49.0, 11.5);
  qword_19B60 = v212;
  qword_19B68 = v213;
  objc_msgSend(v3, "scaledPoint:", 0.5, 72.0);
  qword_19B70 = v214;
  qword_19B78 = v215;
  objc_msgSend(v3, "scaledPoint:", -47.5, 12.5);
  qword_19B80 = v216;
  qword_19B88 = v217;
  objc_msgSend(v3, "scaledPoint:", 0.0, -49.0);
  qword_19B90 = v218;
  qword_19B98 = v219;
  objc_msgSend(v3, "scaledPoint:", 47.5, -77.5);
  qword_19BA0 = v220;
  qword_19BA8 = v221;
  objc_msgSend(v3, "scaledPoint:", 61.5, -39.5);
  qword_19BB0 = v222;
  qword_19BB8 = v223;
  objc_msgSend(v3, "scaledPoint:", 62.0, -1.5);
  qword_19BC0 = v224;
  qword_19BC8 = v225;
  objc_msgSend(v3, "scaledPoint:", 61.0, 37.5);
  qword_19BD0 = v226;
  qword_19BD8 = v227;
  objc_msgSend(v3, "scaledPoint:", 47.5, 75.5);
  qword_19BE0 = v228;
  qword_19BE8 = v229;
  objc_msgSend(v3, "scaledPoint:", 1.0, 76.5);
  qword_19BF0 = v230;
  qword_19BF8 = v231;
  objc_msgSend(v3, "scaledPoint:", -47.5, 75.5);
  qword_19C00 = v232;
  qword_19C08 = v233;
  objc_msgSend(v3, "scaledPoint:", -61.5, 37.5);
  qword_19C10 = v234;
  qword_19C18 = v235;
  objc_msgSend(v3, "scaledPoint:", -63.0, -1.5);
  qword_19C20 = v236;
  qword_19C28 = v237;
  objc_msgSend(v3, "scaledPoint:", -59.5, -39.5);
  qword_19C30 = v238;
  qword_19C38 = v239;
  objc_msgSend(v3, "scaledPoint:", -49.5, -78.0);
  qword_19C40 = v240;
  qword_19C48 = v241;
  objc_msgSend(v3, "scaledPoint:", 0.5, -78.0);
  qword_19C50 = v242;
  qword_19C58 = v243;
  objc_msgSend(v3, "scaledPoint:", 49.5, -78.5);
  qword_19C60 = v244;
  qword_19C68 = v245;
  objc_msgSend(v3, "scaledPoint:", 62.5, -40.0);
  qword_19C70 = v246;
  qword_19C78 = v247;
  objc_msgSend(v3, "scaledPoint:", 60.5, -2.0);
  qword_19C80 = v248;
  qword_19C88 = v249;
  objc_msgSend(v3, "scaledPoint:", 62.0, 37.0);
  qword_19C90 = v250;
  qword_19C98 = v251;
  objc_msgSend(v3, "scaledPoint:", 49.5, 75.0);
  qword_19CA0 = v252;
  qword_19CA8 = v253;
  objc_msgSend(v3, "scaledPoint:", 0.5, 78.0);
  qword_19CB0 = v254;
  qword_19CB8 = v255;
  objc_msgSend(v3, "scaledPoint:");
  qword_19CC0 = v256;
  qword_19CC8 = v257;
  objc_msgSend(v3, "scaledPoint:", -61.5, 36.5);
  qword_19CD0 = v258;
  qword_19CD8 = v259;
  objc_msgSend(v3, "scaledPoint:", -63.0, -2.0);
  qword_19CE0 = v260;
  qword_19CE8 = v261;
  objc_msgSend(v3, "scaledPoint:", -60.5, -40.0);
  qword_19CF0 = v262;
  qword_19CF8 = v263;
  objc_msgSend(v3, "scaledPoint:", -51.0, -78.5);
  qword_19D00 = v264;
  qword_19D08 = v265;
  objc_msgSend(v3, "scaledPoint:", 0.5, -78.5);
  qword_19D10 = v266;
  qword_19D18 = v267;
  objc_msgSend(v3, "scaledPoint:", 55.5, -70.0);
  qword_19D20 = v268;
  qword_19D28 = v269;
  objc_msgSend(v3, "scaledPoint:", 62.5, -33.0);
  qword_19D30 = v270;
  qword_19D38 = v271;
  objc_msgSend(v3, "scaledPoint:", 62.5, 4.5);
  qword_19D40 = v272;
  qword_19D48 = v273;
  objc_msgSend(v3, "scaledPoint:", 62.0, 42.0);
  qword_19D50 = v274;
  qword_19D58 = v275;
  objc_msgSend(v3, "scaledPoint:", 53.0, 79.0);
  qword_19D60 = v276;
  qword_19D68 = v277;
  objc_msgSend(v3, "scaledPoint:", 0.0, 82.0);
  qword_19D70 = v278;
  qword_19D78 = v279;
  objc_msgSend(v3, "scaledPoint:", -50.5, 79.0);
  qword_19D80 = v280;
  qword_19D88 = v281;
  objc_msgSend(v3, "scaledPoint:", -62.5, 41.5);
  qword_19D90 = v282;
  qword_19D98 = v283;
  objc_msgSend(v3, "scaledPoint:", -63.0, 4.5);
  qword_19DA0 = v284;
  qword_19DA8 = v285;
  objc_msgSend(v3, "scaledPoint:", -68.5, -33.0);
  qword_19DB0 = v286;
  qword_19DB8 = v287;
  objc_msgSend(v3, "scaledPoint:", -60.0, -70.0);
  qword_19DC0 = v288;
  qword_19DC8 = v289;
  objc_msgSend(v3, "scaledPoint:", 0.0, -70.0);
  qword_19DD0 = v290;
  qword_19DD8 = v291;
  objc_msgSend(v3, "scaledPoint:", 44.5, 21.5);
  qword_19DE0 = v292;
  qword_19DE8 = v293;
  objc_msgSend(v3, "scaledPoint:", 4.0, 50.5);
  qword_19DF0 = v294;
  qword_19DF8 = v295;
  objc_msgSend(v3, "scaledPoint:", -46.0, 21.0);
  qword_19E00 = v296;
  qword_19E08 = v297;
  objc_msgSend(v3, "scaledPoint:", -5.0, -54.5);
  qword_19E10 = v298;
  qword_19E18 = v299;
  objc_msgSend(v3, "scaledPoint:", 50.5, 12.5);
  qword_19E20 = v300;
  qword_19E28 = v301;
  objc_msgSend(v3, "scaledPoint:", 1.0, 56.0);
  qword_19E30 = v302;
  qword_19E38 = v303;
  objc_msgSend(v3, "scaledPoint:", -50.0, 12.5);
  qword_19E40 = v304;
  qword_19E48 = v305;
  objc_msgSend(v3, "scaledPoint:", 1.5, -57.0);
  qword_19E50 = v306;
  qword_19E58 = v307;
  objc_msgSend(v3, "scaledPoint:", 49.5, 14.5);
  qword_19E60 = v308;
  qword_19E68 = v309;
  objc_msgSend(v3, "scaledPoint:", 0.5, 73.0);
  qword_19E70 = v310;
  qword_19E78 = v311;
  objc_msgSend(v3, "scaledPoint:", -47.5, 13.5);
  qword_19E80 = v312;
  qword_19E88 = v313;
  objc_msgSend(v3, "scaledPoint:", -3.0, -49.0);
  qword_19E90 = v314;
  qword_19E98 = v315;
  objc_msgSend(v3, "scaledPoint:", 47.5, -77.5);
  qword_19EA0 = v316;
  qword_19EA8 = v317;
  objc_msgSend(v3, "scaledPoint:", 61.5, -39.5);
  qword_19EB0 = v318;
  qword_19EB8 = v319;
  objc_msgSend(v3, "scaledPoint:", 62.5, -1.0);
  qword_19EC0 = v320;
  qword_19EC8 = v321;
  objc_msgSend(v3, "scaledPoint:", 62.0, 37.5);
  qword_19ED0 = v322;
  qword_19ED8 = v323;
  objc_msgSend(v3, "scaledPoint:");
  qword_19EE0 = v324;
  qword_19EE8 = v325;
  objc_msgSend(v3, "scaledPoint:", 1.0, 76.5);
  qword_19EF0 = v326;
  qword_19EF8 = v327;
  objc_msgSend(v3, "scaledPoint:", -47.0, 75.5);
  qword_19F00 = v328;
  qword_19F08 = v329;
  objc_msgSend(v3, "scaledPoint:", -62.5, 37.0);
  qword_19F10 = v330;
  qword_19F18 = v331;
  objc_msgSend(v3, "scaledPoint:", -63.0, -1.0);
  qword_19F20 = v332;
  qword_19F28 = v333;
  objc_msgSend(v3, "scaledPoint:");
  qword_19F30 = v334;
  qword_19F38 = v335;
  objc_msgSend(v3, "scaledPoint:", -46.0, -78.0);
  qword_19F40 = v336;
  qword_19F48 = v337;
  objc_msgSend(v3, "scaledPoint:", 1.0, -78.0);
  qword_19F50 = v338;
  qword_19F58 = v339;
  objc_msgSend(v3, "scaledPoint:");
  qword_19F60 = v340;
  qword_19F68 = v341;
  objc_msgSend(v3, "scaledPoint:", 62.0, -40.5);
  qword_19F70 = v342;
  qword_19F78 = v343;
  objc_msgSend(v3, "scaledPoint:", 62.5, -2.0);
  qword_19F80 = v344;
  qword_19F88 = v345;
  objc_msgSend(v3, "scaledPoint:", 62.0, 37.0);
  qword_19F90 = v346;
  qword_19F98 = v347;
  objc_msgSend(v3, "scaledPoint:", 47.5, 75.0);
  qword_19FA0 = v348;
  qword_19FA8 = v349;
  objc_msgSend(v3, "scaledPoint:", 0.5, 78.0);
  qword_19FB0 = v350;
  qword_19FB8 = v351;
  objc_msgSend(v3, "scaledPoint:", -44.5, 75.0);
  qword_19FC0 = v352;
  qword_19FC8 = v353;
  objc_msgSend(v3, "scaledPoint:", -62.5, 36.5);
  qword_19FD0 = v354;
  qword_19FD8 = v355;
  objc_msgSend(v3, "scaledPoint:", -63.0, -2.0);
  qword_19FE0 = v356;
  qword_19FE8 = v357;
  objc_msgSend(v3, "scaledPoint:", -53.5, -40.5);
  qword_19FF0 = v358;
  qword_19FF8 = v359;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A000 = v360;
  qword_1A008 = v361;
  objc_msgSend(v3, "scaledPoint:", 1.5, -79.0);
  qword_1A010 = v362;
  qword_1A018 = v363;
  objc_msgSend(v3, "scaledPoint:", 53.0, -70.0);
  qword_1A020 = v364;
  qword_1A028 = v365;
  objc_msgSend(v3, "scaledPoint:", 62.5, -32.5);
  qword_1A030 = v366;
  qword_1A038 = v367;
  objc_msgSend(v3, "scaledPoint:", 62.5, 4.5);
  qword_1A040 = v368;
  qword_1A048 = v369;
  objc_msgSend(v3, "scaledPoint:", 62.0, 41.5);
  qword_1A050 = v370;
  qword_1A058 = v371;
  objc_msgSend(v3, "scaledPoint:", 52.5, 79.0);
  qword_1A060 = v372;
  qword_1A068 = v373;
  objc_msgSend(v3, "scaledPoint:", 0.5, 82.0);
  qword_1A070 = v374;
  qword_1A078 = v375;
  objc_msgSend(v3, "scaledPoint:", -50.5, 79.0);
  qword_1A080 = v376;
  qword_1A088 = v377;
  objc_msgSend(v3, "scaledPoint:", -62.5, 41.5);
  qword_1A090 = v378;
  qword_1A098 = v379;
  objc_msgSend(v3, "scaledPoint:", -63.0, 4.5);
  qword_1A0A0 = v380;
  qword_1A0A8 = v381;
  objc_msgSend(v3, "scaledPoint:", -55.0, -32.0);
  qword_1A0B0 = v382;
  qword_1A0B8 = v383;
  objc_msgSend(v3, "scaledPoint:", -54.5, -70.0);
  qword_1A0C0 = v384;
  qword_1A0C8 = v385;
  objc_msgSend(v3, "scaledPoint:", -2.5, -70.0);
  qword_1A0D0 = v386;
  qword_1A0D8 = v387;
  objc_msgSend(v3, "scaledPoint:", 40.5, 7.5);
  qword_1A0E0 = v388;
  qword_1A0E8 = v389;
  objc_msgSend(v3, "scaledPoint:", 1.0, 66.0);
  qword_1A0F0 = v390;
  qword_1A0F8 = v391;
  objc_msgSend(v3, "scaledPoint:", -41.0, 7.0);
  qword_1A100 = v392;
  qword_1A108 = v393;
  objc_msgSend(v3, "scaledPoint:", 1.0, -61.5);
  qword_1A110 = v394;
  qword_1A118 = v395;
  objc_msgSend(v3, "scaledPoint:", 42.5, 6.0);
  qword_1A120 = v396;
  qword_1A128 = v397;
  objc_msgSend(v3, "scaledPoint:", 0.5, 61.5);
  qword_1A130 = v398;
  qword_1A138 = v399;
  objc_msgSend(v3, "scaledPoint:", -40.5, 6.0);
  qword_1A140 = v400;
  qword_1A148 = v401;
  objc_msgSend(v3, "scaledPoint:", 0.5, -65.0);
  qword_1A150 = v402;
  qword_1A158 = v403;
  objc_msgSend(v3, "scaledPoint:", 48.5, 17.5);
  qword_1A160 = v404;
  qword_1A168 = v405;
  objc_msgSend(v3, "scaledPoint:", 0.0, 74.0);
  qword_1A170 = v406;
  qword_1A178 = v407;
  objc_msgSend(v3, "scaledPoint:", -40.5, 18.0);
  qword_1A180 = v408;
  qword_1A188 = v409;
  objc_msgSend(v3, "scaledPoint:", 0.5, -49.5);
  qword_1A190 = v410;
  qword_1A198 = v411;
  objc_msgSend(v3, "scaledPoint:", 49.5, -74.0);
  qword_1A1A0 = v412;
  qword_1A1A8 = v413;
  objc_msgSend(v3, "scaledPoint:", 57.5, -40.0);
  qword_1A1B0 = v414;
  qword_1A1B8 = v415;
  objc_msgSend(v3, "scaledPoint:", 57.5, -1.5);
  qword_1A1C0 = v416;
  qword_1A1C8 = v417;
  objc_msgSend(v3, "scaledPoint:", 57.5, 37.5);
  qword_1A1D0 = v418;
  qword_1A1D8 = v419;
  objc_msgSend(v3, "scaledPoint:", 48.0, 75.5);
  qword_1A1E0 = v420;
  qword_1A1E8 = v421;
  objc_msgSend(v3, "scaledPoint:", 1.0, 75.5);
  qword_1A1F0 = v422;
  qword_1A1F8 = v423;
  objc_msgSend(v3, "scaledPoint:", -47.0, 75.5);
  qword_1A200 = v424;
  qword_1A208 = v425;
  objc_msgSend(v3, "scaledPoint:", -57.5, 37.5);
  qword_1A210 = v426;
  qword_1A218 = v427;
  objc_msgSend(v3, "scaledPoint:", -57.5, -1.5);
  qword_1A220 = v428;
  qword_1A228 = v429;
  objc_msgSend(v3, "scaledPoint:", -57.5, -36.5);
  qword_1A230 = v430;
  qword_1A238 = v431;
  objc_msgSend(v3, "scaledPoint:", -47.5, -75.5);
  qword_1A240 = v432;
  qword_1A248 = v433;
  objc_msgSend(v3, "scaledPoint:", 0.5, -74.5);
  qword_1A250 = v434;
  qword_1A258 = v435;
  objc_msgSend(v3, "scaledPoint:", 45.5, -74.5);
  qword_1A260 = v436;
  qword_1A268 = v437;
  objc_msgSend(v3, "scaledPoint:", 58.0, -37.0);
  qword_1A270 = v438;
  qword_1A278 = v439;
  objc_msgSend(v3, "scaledPoint:", 59.0, -2.0);
  qword_1A280 = v440;
  qword_1A288 = v441;
  objc_msgSend(v3, "scaledPoint:", 58.0, 37.5);
  qword_1A290 = v442;
  qword_1A298 = v443;
  objc_msgSend(v3, "scaledPoint:", 45.5, 74.5);
  qword_1A2A0 = v444;
  qword_1A2A8 = v445;
  objc_msgSend(v3, "scaledPoint:", -0.5, 74.5);
  qword_1A2B0 = v446;
  qword_1A2B8 = v447;
  objc_msgSend(v3, "scaledPoint:", -45.5, 74.5);
  qword_1A2C0 = v448;
  qword_1A2C8 = v449;
  objc_msgSend(v3, "scaledPoint:", -59.0, 37.5);
  qword_1A2D0 = v450;
  qword_1A2D8 = v451;
  objc_msgSend(v3, "scaledPoint:", -59.0, -2.0);
  qword_1A2E0 = v452;
  qword_1A2E8 = v453;
  objc_msgSend(v3, "scaledPoint:", -59.0, -37.5);
  qword_1A2F0 = v454;
  qword_1A2F8 = v455;
  objc_msgSend(v3, "scaledPoint:", -45.5, -79.0);
  qword_1A300 = v456;
  qword_1A308 = v457;
  objc_msgSend(v3, "scaledPoint:", 0.0, -78.5);
  qword_1A310 = v458;
  qword_1A318 = v459;
  objc_msgSend(v3, "scaledPoint:", 46.5, -71.5);
  qword_1A320 = v460;
  qword_1A328 = v461;
  objc_msgSend(v3, "scaledPoint:", 57.0, -32.5);
  qword_1A330 = v462;
  qword_1A338 = v463;
  objc_msgSend(v3, "scaledPoint:", 57.0, 2.5);
  qword_1A340 = v464;
  qword_1A348 = v465;
  objc_msgSend(v3, "scaledPoint:", 57.0, 41.5);
  qword_1A350 = v466;
  qword_1A358 = v467;
  objc_msgSend(v3, "scaledPoint:", 46.0, 79.0);
  qword_1A360 = v468;
  qword_1A368 = v469;
  objc_msgSend(v3, "scaledPoint:", 0.0, 79.0);
  qword_1A370 = v470;
  qword_1A378 = v471;
  objc_msgSend(v3, "scaledPoint:", -46.5, 79.0);
  qword_1A380 = v472;
  qword_1A388 = v473;
  objc_msgSend(v3, "scaledPoint:", -59.0, 41.5);
  qword_1A390 = v474;
  qword_1A398 = v475;
  objc_msgSend(v3, "scaledPoint:", -59.0, 2.5);
  qword_1A3A0 = v476;
  qword_1A3A8 = v477;
  objc_msgSend(v3, "scaledPoint:", -59.0, -33.0);
  qword_1A3B0 = v478;
  qword_1A3B8 = v479;
  objc_msgSend(v3, "scaledPoint:", -46.5, -71.5);
  qword_1A3C0 = v480;
  qword_1A3C8 = v481;
  objc_msgSend(v3, "scaledPoint:", 0.0, -71.5);
  qword_1A3D0 = v482;
  qword_1A3D8 = v483;
  v638 = v2;
  [v2 screenBounds];
  CLKRectGetCenter();
  for (uint64_t i = 0; i != 8; i += 2)
  {
    v485 = &qword_193F0[i];
    CLKAddPoints();
    v485[30] = v486;
    v485[31] = v487;
    CLKAddPoints();
    v485[38] = v488;
    v485[39] = v489;
    CLKAddPoints();
    v485[46] = v490;
    v485[47] = v491;
    CLKAddPoints();
    v485[126] = v492;
    v485[127] = v493;
    CLKAddPoints();
    v485[134] = v494;
    v485[135] = v495;
    CLKAddPoints();
    v485[142] = v496;
    v485[143] = v497;
    CLKAddPoints();
    v485[222] = v498;
    v485[223] = v499;
    CLKAddPoints();
    v485[230] = v500;
    v485[231] = v501;
    CLKAddPoints();
    v485[238] = v502;
    v485[239] = v503;
    CLKAddPoints();
    v485[318] = v504;
    v485[319] = v505;
    CLKAddPoints();
    v485[326] = v506;
    v485[327] = v507;
    CLKAddPoints();
    v485[334] = v508;
    v485[335] = v509;
    CLKAddPoints();
    v485[414] = v510;
    v485[415] = v511;
    CLKAddPoints();
    v485[422] = v512;
    v485[423] = v513;
    CLKAddPoints();
    v485[430] = v514;
    v485[431] = v515;
  }
  for (uint64_t j = 0; j != 24; j += 2)
  {
    v517 = &qword_193F0[j];
    CLKAddPoints();
    v517[54] = v518;
    v517[55] = v519;
    CLKAddPoints();
    v517[78] = v520;
    v517[79] = v521;
    CLKAddPoints();
    v517[102] = v522;
    v517[103] = v523;
    CLKAddPoints();
    v517[150] = v524;
    v517[151] = v525;
    CLKAddPoints();
    v517[174] = v526;
    v517[175] = v527;
    CLKAddPoints();
    v517[198] = v528;
    v517[199] = v529;
    CLKAddPoints();
    v517[246] = v530;
    v517[247] = v531;
    CLKAddPoints();
    v517[270] = v532;
    v517[271] = v533;
    CLKAddPoints();
    v517[294] = v534;
    v517[295] = v535;
    CLKAddPoints();
    v517[342] = v536;
    v517[343] = v537;
    CLKAddPoints();
    v517[366] = v538;
    v517[367] = v539;
    CLKAddPoints();
    v517[390] = v540;
    v517[391] = v541;
    CLKAddPoints();
    v517[438] = v542;
    v517[439] = v543;
    CLKAddPoints();
    v517[462] = v544;
    v517[463] = v545;
    CLKAddPoints();
    v517[486] = v546;
    v517[487] = v547;
  }
  qword_193F0[0] = (uint64_t)&qword_194E0;
  *(void *)algn_193F8 = &qword_197E0;
  qword_19400 = (uint64_t)&qword_19AE0;
  unk_19408 = &qword_19DE0;
  qword_19410 = (uint64_t)&qword_1A0E0;
  unk_19418 = &qword_19520;
  qword_19420 = (uint64_t)&qword_19820;
  unk_19428 = &qword_19B20;
  qword_19430 = (uint64_t)&qword_19E20;
  unk_19438 = &qword_1A120;
  qword_19440 = (uint64_t)&qword_19560;
  unk_19448 = &qword_19860;
  qword_19450 = (uint64_t)&qword_19B60;
  unk_19458 = &qword_19E60;
  qword_19460 = (uint64_t)&qword_1A160;
  unk_19468 = &qword_195A0;
  qword_19470 = (uint64_t)&qword_198A0;
  unk_19478 = &qword_19BA0;
  qword_19480 = (uint64_t)&qword_19EA0;
  unk_19488 = &qword_1A1A0;
  qword_19490 = (uint64_t)&qword_19660;
  unk_19498 = &qword_19960;
  qword_194A0 = (uint64_t)&qword_19C60;
  unk_194A8 = &qword_19F60;
  qword_194B0 = (uint64_t)&qword_1A260;
  unk_194B8 = &qword_19720;
  qword_194C0 = (uint64_t)&qword_19A20;
  unk_194C8 = &qword_19D20;
  qword_194D0 = (uint64_t)&qword_1A020;
  unk_194D8 = &qword_1A320;
  [v3 scaledValue:74.5];
  uint64_t v635 = v548;
  [v3 scaledValue:95.0];
  uint64_t v633 = v549;
  [v3 scaledValue:94.0];
  uint64_t v631 = v550;
  [v3 scaledValue:92.5];
  uint64_t v629 = v551;
  [v3 scaledValue:63.0];
  uint64_t v627 = v552;
  [v3 scaledValue:87.5];
  uint64_t v554 = v553;
  [v3 scaledValue:95.0];
  uint64_t v556 = v555;
  [v3 scaledValue:91.5];
  uint64_t v558 = v557;
  [v3 scaledValue:68.0];
  uint64_t v560 = v559;
  [v3 scaledValue:82.0];
  uint64_t v562 = v561;
  [v3 scaledValue:81.0];
  uint64_t v564 = v563;
  [v3 scaledValue:36.0];
  uint64_t v566 = v565;
  [v3 scaledValue:32.5];
  uint64_t v568 = v567;
  [v3 scaledValue:34.0];
  qword_1A3E0 = v635;
  qword_1A3E8 = v633;
  qword_1A3F0 = v631;
  qword_1A3F8 = v629;
  qword_1A400 = v627;
  qword_1A408 = v554;
  qword_1A410 = v556;
  qword_1A418 = v556;
  qword_1A420 = v558;
  qword_1A428 = v560;
  qword_1A430 = v562;
  qword_1A438 = v562;
  qword_1A440 = v562;
  qword_1A448 = v562;
  qword_1A450 = v564;
  qword_1A458 = v568;
  qword_1A460 = v569;
  qword_1A468 = v569;
  qword_1A470 = v569;
  qword_1A478 = v568;
  qword_1A480 = v568;
  qword_1A488 = v569;
  qword_1A490 = v569;
  qword_1A498 = v569;
  qword_1A4A0 = v568;
  qword_1A4A8 = v568;
  qword_1A4B0 = v568;
  qword_1A4B8 = v568;
  qword_1A4C0 = v568;
  qword_1A4C8 = v566;
  v696[0] = &off_156F8;
  v694[0] = &off_15710;
  v692 = &off_156F8;
  v690[0] = &off_15728;
  [v3 scaledValue:21.0];
  v637 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v691[0] = v637;
  v690[1] = &off_15740;
  [v3 scaledValue:-3.0];
  v636 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v691[1] = v636;
  v690[2] = &off_15758;
  [v3 scaledValue:-3.0];
  v634 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v691[2] = v634;
  v690[3] = &off_15770;
  [v3 scaledValue:-3.0];
  v632 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v689[0] = v632;
  [v3 scaledValue:-7.0];
  v630 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v689[1] = v630;
  v628 = +[NSArray arrayWithObjects:v689 count:2];
  v691[3] = v628;
  v626 = +[NSDictionary dictionaryWithObjects:v691 forKeys:v690 count:4];
  v693 = v626;
  v625 = +[NSDictionary dictionaryWithObjects:&v693 forKeys:&v692 count:1];
  v694[1] = &off_15788;
  v695[0] = v625;
  v687[0] = &off_156F8;
  v685[0] = &off_15740;
  [v3 scaledValue:-22.0];
  v624 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v686[0] = v624;
  v685[1] = &off_15758;
  [v3 scaledValue:-22.0];
  v623 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v686[1] = v623;
  v685[2] = &off_15770;
  [v3 scaledValue:-13.0];
  v622 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v686[2] = v622;
  v621 = +[NSDictionary dictionaryWithObjects:v686 forKeys:v685 count:3];
  v688[0] = v621;
  v687[1] = &off_15710;
  v683[0] = &off_15740;
  [v3 scaledValue:-8.0];
  v620 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[0] = v620;
  v683[1] = &off_157A0;
  [v3 scaledValue:-5.0];
  v619 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[1] = v619;
  v683[2] = &off_157B8;
  [v3 scaledValue:-2.0];
  v618 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[2] = v618;
  v683[3] = &off_15758;
  [v3 scaledValue:-8.0];
  v617 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[3] = v617;
  v683[4] = &off_157D0;
  [v3 scaledValue:-8.0];
  v616 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[4] = v616;
  v683[5] = &off_15770;
  [v3 scaledValue:-4.0];
  v615 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[5] = v615;
  v614 = +[NSDictionary dictionaryWithObjects:v684 forKeys:v683 count:6];
  v688[1] = v614;
  v613 = +[NSDictionary dictionaryWithObjects:v688 forKeys:v687 count:2];
  v695[1] = v613;
  v612 = +[NSDictionary dictionaryWithObjects:v695 forKeys:v694 count:2];
  v697[0] = v612;
  v696[1] = &off_15710;
  v681[0] = &off_156F8;
  v679[0] = &off_156F8;
  v677 = &off_15770;
  [v3 scaledValue:-6.0];
  v611 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v678 = v611;
  v610 = +[NSDictionary dictionaryWithObjects:&v678 forKeys:&v677 count:1];
  v680[0] = v610;
  v679[1] = &off_15710;
  v675[0] = &off_157E8;
  [v3 scaledValue:-1.0];
  v609 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v676[0] = v609;
  v675[1] = &off_157D0;
  [v3 scaledValue:-2.0];
  v608 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v676[1] = v608;
  v607 = +[NSDictionary dictionaryWithObjects:v676 forKeys:v675 count:2];
  v680[1] = v607;
  v606 = +[NSDictionary dictionaryWithObjects:v680 forKeys:v679 count:2];
  v682[0] = v606;
  v681[1] = &off_15710;
  v673[0] = &off_156F8;
  v671 = &off_15770;
  [v3 scaledValue:-7.0];
  v605 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v672 = v605;
  v604 = +[NSDictionary dictionaryWithObjects:&v672 forKeys:&v671 count:1];
  v674[0] = v604;
  v673[1] = &off_15710;
  v669[0] = &off_157E8;
  [v3 scaledValue:-1.0];
  v603 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v670[0] = v603;
  v669[1] = &off_157D0;
  [v3 scaledValue:-2.0];
  v602 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v670[1] = v602;
  v601 = +[NSDictionary dictionaryWithObjects:v670 forKeys:v669 count:2];
  v674[1] = v601;
  v600 = +[NSDictionary dictionaryWithObjects:v674 forKeys:v673 count:2];
  v682[1] = v600;
  v681[2] = &off_15788;
  v667[0] = &off_156F8;
  v665 = &off_15770;
  [v3 scaledValue:-2.0];
  v599 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v666 = v599;
  v598 = +[NSDictionary dictionaryWithObjects:&v666 forKeys:&v665 count:1];
  v668[0] = v598;
  v667[1] = &off_15710;
  v663 = &off_157D0;
  [v3 scaledValue:-14.0];
  v597 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v664 = v597;
  v596 = +[NSDictionary dictionaryWithObjects:&v664 forKeys:&v663 count:1];
  v668[1] = v596;
  v595 = +[NSDictionary dictionaryWithObjects:v668 forKeys:v667 count:2];
  v682[2] = v595;
  v594 = +[NSDictionary dictionaryWithObjects:v682 forKeys:v681 count:3];
  v697[1] = v594;
  v696[2] = &off_15788;
  v661[0] = &off_156F8;
  v659 = &off_156F8;
  v657 = &off_15770;
  [v3 scaledValue:-4.0];
  v593 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v658 = v593;
  v592 = +[NSDictionary dictionaryWithObjects:&v658 forKeys:&v657 count:1];
  v660 = v592;
  v591 = +[NSDictionary dictionaryWithObjects:&v660 forKeys:&v659 count:1];
  v662[0] = v591;
  v661[1] = &off_15710;
  v655 = &off_156F8;
  v653 = &off_15770;
  [v3 scaledValue:-7.0];
  v590 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v654 = v590;
  v589 = +[NSDictionary dictionaryWithObjects:&v654 forKeys:&v653 count:1];
  v656 = v589;
  v588 = +[NSDictionary dictionaryWithObjects:&v656 forKeys:&v655 count:1];
  v662[1] = v588;
  v661[2] = &off_15788;
  v651[0] = &off_156F8;
  v649 = &off_15770;
  [v3 scaledValue:-18.0];
  v587 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v650 = v587;
  v586 = +[NSDictionary dictionaryWithObjects:&v650 forKeys:&v649 count:1];
  v652[0] = v586;
  v651[1] = &off_15710;
  v647[0] = &off_157E8;
  [v3 scaledValue:-14.0];
  v585 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v648[0] = v585;
  v647[1] = &off_157D0;
  [v3 scaledValue:-14.0];
  v584 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v648[1] = v584;
  v647[2] = &off_15770;
  [v3 scaledValue:-6.0];
  v583 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v648[2] = v583;
  v582 = +[NSDictionary dictionaryWithObjects:v648 forKeys:v647 count:3];
  v652[1] = v582;
  v581 = +[NSDictionary dictionaryWithObjects:v652 forKeys:v651 count:2];
  v662[2] = v581;
  v580 = +[NSDictionary dictionaryWithObjects:v662 forKeys:v661 count:3];
  v697[2] = v580;
  v696[3] = &off_15800;
  v645 = &off_15788;
  v643[0] = &off_156F8;
  v641 = &off_15770;
  [v3 scaledValue:-9.0];
  v579 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v642 = v579;
  v570 = +[NSDictionary dictionaryWithObjects:&v642 forKeys:&v641 count:1];
  v644[0] = v570;
  v643[1] = &off_15710;
  v639[0] = &off_157E8;
  [v3 scaledValue:-3.0];
  v571 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v640[0] = v571;
  v639[1] = &off_157D0;
  [v3 scaledValue:-3.0];
  v572 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v640[1] = v572;
  v639[2] = &off_15770;
  [v3 scaledValue:-4.0];
  v573 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v640[2] = v573;
  v574 = +[NSDictionary dictionaryWithObjects:v640 forKeys:v639 count:3];
  v644[1] = v574;
  v575 = +[NSDictionary dictionaryWithObjects:v644 forKeys:v643 count:2];
  v646 = v575;
  v576 = +[NSDictionary dictionaryWithObjects:&v646 forKeys:&v645 count:1];
  v697[3] = v576;
  uint64_t v577 = +[NSDictionary dictionaryWithObjects:v697 forKeys:v696 count:4];
  v578 = (void *)qword_1A4D0;
  qword_1A4D0 = v577;
}

void sub_88D8(id a1)
{
  qword_1A4F0 = +[NTKFontLoader fontDescriptorForSectName:@"__NYNumeralsBL" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_897C(id a1)
{
  qword_1A500 = +[NTKFontLoader fontDescriptorForSectName:@"__NYNumeralsH" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_8A20(id a1)
{
  qword_1A510 = +[NTKFontLoader fontDescriptorForSectName:@"__SFNumeralsBL" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_8AC4(id a1)
{
  qword_1A520 = +[NTKFontLoader fontDescriptorForSectName:@"__SFNumeralsH" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_8B68(id a1)
{
  qword_1A530 = +[NTKFontLoader fontDescriptorForSectName:@"__TokyoBL" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_8C0C(id a1)
{
  qword_1A540 = +[NTKFontLoader fontDescriptorForSectName:@"__TokyoH" fromMachO:&dword_0];

  _objc_release_x1();
}

uint64_t sub_8D4C()
{
  qword_1A550 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_8E04(id a1)
{
  v3[0] = &off_15908;
  v3[1] = &off_15920;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  id v2 = (void *)qword_1A570;
  qword_1A570 = v1;
}

void sub_904C(uint64_t a1, uint64_t a2)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___NTKGreyhoundColorEditOption;
  id v2 = objc_msgSendSuper2(&v5, "_orderedValuesForDevice:", a2);
  id v3 = [v2 mutableCopy];

  [v3 removeObject:&off_15938];
  uint64_t v4 = (void *)qword_1A580;
  qword_1A580 = (uint64_t)v3;
}

void sub_922C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _EnumValueRange();
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned int v5 = [v2 supportsCapability:v4];

  if (v5)
  {
    uint64_t v6 = [v3 arrayByAddingObject:&off_15950];

    id v3 = (void *)v6;
  }
  uint64_t v7 = (void *)qword_1A5A0;
  qword_1A5A0 = (uint64_t)v3;
}

void sub_9354(id a1)
{
  v3[0] = &off_15968;
  v3[1] = &off_15980;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  void v3[2] = &off_15998;
  void v3[3] = &off_159B0;
  void v4[2] = NTKFaceBundleStyle3;
  void v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_15950;
  v4[4] = NTKFaceBundleStyle5;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_1A5C0;
  qword_1A5C0 = v1;
}

void sub_9804(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 text];

  if (v4)
  {
    [v3 setTextColor:*(void *)(a1 + 32)];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unsigned int v5 = objc_msgSend(v3, "subviews", 0);
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 setTextColor:*(void *)(a1 + 32)];
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

void sub_9AA4(id a1, UILabel *a2, unint64_t a3, BOOL *a4)
{
}

void sub_9AAC(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v7 = a2;
  sub_9B8C(v5, v8);
  uint64_t v6 = v8[15 * *(void *)(*(void *)(a1 + 32) + 40)
        + 5 * *(void *)(*(void *)(a1 + 32) + 48)
        + *(void *)(*(void *)(a1 + 32) + 32)];

  objc_msgSend(v7, "setCenter:", *(double *)(v6 + 16 * a3), *(double *)(v6 + 16 * a3 + 8));
  [*(id *)(a1 + 32) addSubview:v7];
}

void sub_9B8C(void *a1@<X0>, void *a2@<X8>)
{
  obuint64_t j = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1B6B8);
  id WeakRetained = objc_loadWeakRetained(&qword_1B6C0);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_1B6C0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_1B6C8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_1B6C0, obj);
  qword_1B6C8 = (uint64_t)[obj version];

  sub_A6C0(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1B6B8);
  memcpy(a2, qword_1A5D0, 0x10E0uLL);
  a2[540] = (id)qword_1B6B0;
}

void sub_A540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A6C0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  objc_msgSend(v3, "scaledPoint:", 37.0, 0.0);
  qword_1A6C0 = v4;
  *(void *)algn_1A6C8 = v5;
  [v3 scaledPoint:0.5];
  qword_1A6D0 = v6;
  unk_1A6D8 = v7;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A6E0 = v8;
  unk_1A6E8 = v9;
  [v3 scaledPoint:2.5];
  qword_1A6F0 = v10;
  unk_1A6F8 = v11;
  objc_msgSend(v3, "scaledPoint:", 37.0, -3.0);
  qword_1A700 = v12;
  unk_1A708 = v13;
  objc_msgSend(v3, "scaledPoint:", -2.0, 58.5);
  qword_1A710 = v14;
  unk_1A718 = v15;
  objc_msgSend(v3, "scaledPoint:", -36.0, -3.0);
  qword_1A720 = v16;
  unk_1A728 = v17;
  [v3 scaledPoint:0.5];
  qword_1A730 = v18;
  unk_1A738 = v19;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A740 = v20;
  unk_1A748 = v21;
  [v3 scaledPoint:-7.5];
  qword_1A750 = v22;
  unk_1A758 = v23;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A760 = v24;
  unk_1A768 = v25;
  objc_msgSend(v3, "scaledPoint:", -2.5, -48.5);
  qword_1A770 = v26;
  unk_1A778 = v27;
  [v3 scaledPoint:65.5];
  qword_1A780 = v28;
  unk_1A788 = v29;
  objc_msgSend(v3, "scaledPoint:", 61.5, -37.0);
  qword_1A790 = v30;
  unk_1A798 = v31;
  objc_msgSend(v3, "scaledPoint:", 56.5, 0.5);
  qword_1A7A0 = v32;
  unk_1A7A8 = v33;
  objc_msgSend(v3, "scaledPoint:", 52.0, 38.0);
  qword_1A7B0 = v34;
  unk_1A7B8 = v35;
  [v3 scaledPoint:58.5];
  qword_1A7C0 = v36;
  unk_1A7C8 = v37;
  objc_msgSend(v3, "scaledPoint:", 3.5, 75.0);
  qword_1A7D0 = v38;
  unk_1A7D8 = v39;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A7E0 = v40;
  unk_1A7E8 = v41;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A7F0 = v42;
  unk_1A7F8 = v43;
  objc_msgSend(v3, "scaledPoint:", -54.5, 0.5);
  qword_1A800 = v44;
  unk_1A808 = v45;
  objc_msgSend(v3, "scaledPoint:", -60.0, -37.0);
  qword_1A810 = v46;
  unk_1A818 = v47;
  objc_msgSend(v3, "scaledPoint:", -54.5, -74.0);
  qword_1A820 = v48;
  unk_1A828 = v49;
  objc_msgSend(v3, "scaledPoint:", 4.5, -74.0);
  qword_1A830 = v50;
  unk_1A838 = v51;
  [v3 scaledPoint:61.5];
  qword_1A840 = v52;
  unk_1A848 = v53;
  objc_msgSend(v3, "scaledPoint:", 65.5, -38.5);
  qword_1A850 = v54;
  unk_1A858 = v55;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A860 = v56;
  unk_1A868 = v57;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A870 = v58;
  unk_1A878 = v59;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A880 = v60;
  unk_1A888 = v61;
  objc_msgSend(v3, "scaledPoint:", 4.0, 74.0);
  qword_1A890 = v62;
  unk_1A898 = v63;
  objc_msgSend(v3, "scaledPoint:", -48.0, 74.0);
  qword_1A8A0 = v64;
  unk_1A8A8 = v65;
  [v3 scaledPoint:-48.5];
  qword_1A8B0 = v66;
  unk_1A8B8 = v67;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A8C0 = v68;
  qword_1A8C8 = v69;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A8D0 = v70;
  qword_1A8D8 = v71;
  objc_msgSend(v3, "scaledPoint:", -53.0, -75.5);
  qword_1A8E0 = v72;
  qword_1A8E8 = v73;
  objc_msgSend(v3, "scaledPoint:", 4.5, -75.5);
  qword_1A8F0 = v74;
  qword_1A8F8 = v75;
  [v3 scaledPoint:60.0];
  qword_1A900 = v76;
  qword_1A908 = v77;
  [v3 scaledPoint:63.5];
  qword_1A910 = v78;
  qword_1A918 = v79;
  objc_msgSend(v3, "scaledPoint:", 60.0, 5.0);
  qword_1A920 = v80;
  qword_1A928 = v81;
  objc_msgSend(v3, "scaledPoint:", 56.5, 42.0);
  qword_1A930 = v82;
  qword_1A938 = v83;
  objc_msgSend(v3, "scaledPoint:", 56.5, 79.5);
  qword_1A940 = v84;
  qword_1A948 = v85;
  objc_msgSend(v3, "scaledPoint:", -2.5, 79.0);
  qword_1A950 = v86;
  qword_1A958 = v87;
  objc_msgSend(v3, "scaledPoint:", -53.0, 79.0);
  qword_1A960 = v88;
  qword_1A968 = v89;
  objc_msgSend(v3, "scaledPoint:", -53.5, 42.0);
  qword_1A970 = v90;
  qword_1A978 = v91;
  objc_msgSend(v3, "scaledPoint:", -64.5, 4.5);
  qword_1A980 = v92;
  qword_1A988 = v93;
  [v3 scaledPoint:-60.0];
  qword_1A990 = v94;
  qword_1A998 = v95;
  objc_msgSend(v3, "scaledPoint:", -52.5, -70.0);
  qword_1A9A0 = v96;
  qword_1A9A8 = v97;
  objc_msgSend(v3, "scaledPoint:", 1.0, -70.0);
  qword_1A9B0 = v98;
  qword_1A9B8 = v99;
  [v3 scaledPoint:52.5];
  qword_1A9C0 = v100;
  qword_1A9C8 = v101;
  objc_msgSend(v3, "scaledPoint:", 2.5, 52.5);
  qword_1A9D0 = v102;
  qword_1A9D8 = v103;
  objc_msgSend(v3, "scaledPoint:");
  qword_1A9E0 = v104;
  qword_1A9E8 = v105;
  objc_msgSend(v3, "scaledPoint:", 0.0, -53.5);
  qword_1A9F0 = v106;
  qword_1A9F8 = v107;
  objc_msgSend(v3, "scaledPoint:", 47.0, 4.5);
  qword_1AA00 = v108;
  qword_1AA08 = v109;
  [v3 scaledPoint:-0.5];
  qword_1AA10 = v110;
  qword_1AA18 = v111;
  objc_msgSend(v3, "scaledPoint:", -41.5, 4.0);
  qword_1AA20 = v112;
  qword_1AA28 = v113;
  [v3 scaledPoint:-4.0];
  qword_1AA30 = v114;
  qword_1AA38 = v115;
  objc_msgSend(v3, "scaledPoint:", 49.0, 12.5);
  qword_1AA40 = v116;
  qword_1AA48 = v117;
  objc_msgSend(v3, "scaledPoint:", 1.0, 72.0);
  qword_1AA50 = v118;
  qword_1AA58 = v119;
  objc_msgSend(v3, "scaledPoint:", -47.5, 12.5);
  qword_1AA60 = v120;
  qword_1AA68 = v121;
  [v3 scaledPoint:-15.0];
  qword_1AA70 = v122;
  qword_1AA78 = v123;
  objc_msgSend(v3, "scaledPoint:");
  qword_1AA80 = v124;
  qword_1AA88 = v125;
  objc_msgSend(v3, "scaledPoint:", 63.5, -39.5);
  qword_1AA90 = v126;
  qword_1AA98 = v127;
  objc_msgSend(v3, "scaledPoint:");
  qword_1AAA0 = v128;
  qword_1AAA8 = v129;
  objc_msgSend(v3, "scaledPoint:", 61.0, 37.5);
  qword_1AAB0 = v130;
  qword_1AAB8 = v131;
  [v3 scaledPoint:49.0];
  qword_1AAC0 = v132;
  qword_1AAC8 = v133;
  [v3 scaledPoint:0.5];
  qword_1AAD0 = v134;
  qword_1AAD8 = v135;
  objc_msgSend(v3, "scaledPoint:", -48.5, 75.5);
  qword_1AAE0 = v136;
  qword_1AAE8 = v137;
  objc_msgSend(v3, "scaledPoint:", -61.5, 37.5);
  qword_1AAF0 = v138;
  qword_1AAF8 = v139;
  objc_msgSend(v3, "scaledPoint:", -61.0, -1.5);
  qword_1AB00 = v140;
  qword_1AB08 = v141;
  objc_msgSend(v3, "scaledPoint:", -54.5, -39.5);
  qword_1AB10 = v142;
  qword_1AB18 = v143;
  objc_msgSend(v3, "scaledPoint:");
  qword_1AB20 = v144;
  qword_1AB28 = v145;
  objc_msgSend(v3, "scaledPoint:", 0.5, -77.5);
  qword_1AB30 = v146;
  qword_1AB38 = v147;
  objc_msgSend(v3, "scaledPoint:", 49.0, -78.5);
  qword_1AB40 = v148;
  qword_1AB48 = v149;
  [v3 scaledPoint:62.5];
  qword_1AB50 = v150;
  qword_1AB58 = v151;
  objc_msgSend(v3, "scaledPoint:", 62.5, -2.0);
  qword_1AB60 = v152;
  qword_1AB68 = v153;
  objc_msgSend(v3, "scaledPoint:", 61.0, 36.5);
  qword_1AB70 = v154;
  qword_1AB78 = v155;
  objc_msgSend(v3, "scaledPoint:");
  qword_1AB80 = v156;
  qword_1AB88 = v157;
  [v3 scaledPoint:0.5];
  qword_1AB90 = v158;
  qword_1AB98 = v159;
  objc_msgSend(v3, "scaledPoint:", -47.5, 75.0);
  qword_1ABA0 = v160;
  qword_1ABA8 = v161;
  objc_msgSend(v3, "scaledPoint:", -61.5, 36.5);
  qword_1ABB0 = v162;
  qword_1ABB8 = v163;
  objc_msgSend(v3, "scaledPoint:", -62.0, -2.0);
  qword_1ABC0 = v164;
  qword_1ABC8 = v165;
  objc_msgSend(v3, "scaledPoint:", -55.5, -40.0);
  qword_1ABD0 = v166;
  qword_1ABD8 = v167;
  objc_msgSend(v3, "scaledPoint:", -49.0, -78.5);
  qword_1ABE0 = v168;
  qword_1ABE8 = v169;
  objc_msgSend(v3, "scaledPoint:", 1.0, -78.5);
  qword_1ABF0 = v170;
  qword_1ABF8 = v171;
  objc_msgSend(v3, "scaledPoint:", 49.0, -70.0);
  qword_1AC00 = v172;
  qword_1AC08 = v173;
  objc_msgSend(v3, "scaledPoint:", 62.5, -33.0);
  qword_1AC10 = v174;
  qword_1AC18 = v175;
  objc_msgSend(v3, "scaledPoint:", 63.0, 4.5);
  qword_1AC20 = v176;
  qword_1AC28 = v177;
  objc_msgSend(v3, "scaledPoint:", 63.0, 42.0);
  qword_1AC30 = v178;
  qword_1AC38 = v179;
  objc_msgSend(v3, "scaledPoint:", 53.5, 79.0);
  qword_1AC40 = v180;
  qword_1AC48 = v181;
  [v3 scaledPoint:0.5];
  qword_1AC50 = v182;
  qword_1AC58 = v183;
  objc_msgSend(v3, "scaledPoint:");
  qword_1AC60 = v184;
  qword_1AC68 = v185;
  [v3 scaledPoint:-62.5];
  qword_1AC70 = v186;
  qword_1AC78 = v187;
  objc_msgSend(v3, "scaledPoint:", -62.5, 4.5);
  qword_1AC80 = v188;
  qword_1AC88 = v189;
  objc_msgSend(v3, "scaledPoint:", -64.5, -33.0);
  qword_1AC90 = v190;
  qword_1AC98 = v191;
  objc_msgSend(v3, "scaledPoint:", -60.5, -70.0);
  qword_1ACA0 = v192;
  qword_1ACA8 = v193;
  objc_msgSend(v3, "scaledPoint:", -6.0, -70.0);
  qword_1ACB0 = v194;
  qword_1ACB8 = v195;
  objc_msgSend(v3, "scaledPoint:", 45.0, 7.5);
  qword_1ACC0 = v196;
  qword_1ACC8 = v197;
  objc_msgSend(v3, "scaledPoint:", 12.5, 54.0);
  qword_1ACD0 = v198;
  qword_1ACD8 = v199;
  objc_msgSend(v3, "scaledPoint:", -45.5, 7.5);
  qword_1ACE0 = v200;
  qword_1ACE8 = v201;
  objc_msgSend(v3, "scaledPoint:", -5.0, -54.5);
  qword_1ACF0 = v202;
  qword_1ACF8 = v203;
  objc_msgSend(v3, "scaledPoint:", 44.0, 8.0);
  qword_1AD00 = v204;
  qword_1AD08 = v205;
  objc_msgSend(v3, "scaledPoint:", 1.0, 52.5);
  qword_1AD10 = v206;
  qword_1AD18 = v207;
  objc_msgSend(v3, "scaledPoint:", -49.5, 8.0);
  qword_1AD20 = v208;
  qword_1AD28 = v209;
  objc_msgSend(v3, "scaledPoint:", -5.5, -60.5);
  qword_1AD30 = v210;
  qword_1AD38 = v211;
  objc_msgSend(v3, "scaledPoint:", 49.0, 11.5);
  qword_1AD40 = v212;
  qword_1AD48 = v213;
  objc_msgSend(v3, "scaledPoint:", 0.5, 72.0);
  qword_1AD50 = v214;
  qword_1AD58 = v215;
  objc_msgSend(v3, "scaledPoint:", -47.5, 12.5);
  qword_1AD60 = v216;
  qword_1AD68 = v217;
  objc_msgSend(v3, "scaledPoint:", 0.0, -49.0);
  qword_1AD70 = v218;
  qword_1AD78 = v219;
  objc_msgSend(v3, "scaledPoint:", 47.5, -77.5);
  qword_1AD80 = v220;
  qword_1AD88 = v221;
  objc_msgSend(v3, "scaledPoint:", 61.5, -39.5);
  qword_1AD90 = v222;
  qword_1AD98 = v223;
  objc_msgSend(v3, "scaledPoint:", 62.0, -1.5);
  qword_1ADA0 = v224;
  qword_1ADA8 = v225;
  objc_msgSend(v3, "scaledPoint:", 61.0, 37.5);
  qword_1ADB0 = v226;
  qword_1ADB8 = v227;
  objc_msgSend(v3, "scaledPoint:", 47.5, 75.5);
  qword_1ADC0 = v228;
  qword_1ADC8 = v229;
  objc_msgSend(v3, "scaledPoint:", 1.0, 76.5);
  qword_1ADD0 = v230;
  qword_1ADD8 = v231;
  objc_msgSend(v3, "scaledPoint:", -47.5, 75.5);
  qword_1ADE0 = v232;
  qword_1ADE8 = v233;
  objc_msgSend(v3, "scaledPoint:", -61.5, 37.5);
  qword_1ADF0 = v234;
  qword_1ADF8 = v235;
  objc_msgSend(v3, "scaledPoint:", -63.0, -1.5);
  qword_1AE00 = v236;
  qword_1AE08 = v237;
  objc_msgSend(v3, "scaledPoint:", -59.5, -39.5);
  qword_1AE10 = v238;
  qword_1AE18 = v239;
  objc_msgSend(v3, "scaledPoint:", -49.5, -78.0);
  qword_1AE20 = v240;
  qword_1AE28 = v241;
  objc_msgSend(v3, "scaledPoint:", 0.5, -78.0);
  qword_1AE30 = v242;
  qword_1AE38 = v243;
  objc_msgSend(v3, "scaledPoint:", 49.5, -78.5);
  qword_1AE40 = v244;
  qword_1AE48 = v245;
  objc_msgSend(v3, "scaledPoint:", 62.5, -40.0);
  qword_1AE50 = v246;
  qword_1AE58 = v247;
  objc_msgSend(v3, "scaledPoint:", 60.5, -2.0);
  qword_1AE60 = v248;
  qword_1AE68 = v249;
  objc_msgSend(v3, "scaledPoint:", 62.0, 37.0);
  qword_1AE70 = v250;
  qword_1AE78 = v251;
  objc_msgSend(v3, "scaledPoint:", 49.5, 75.0);
  qword_1AE80 = v252;
  qword_1AE88 = v253;
  objc_msgSend(v3, "scaledPoint:", 0.5, 78.0);
  qword_1AE90 = v254;
  qword_1AE98 = v255;
  objc_msgSend(v3, "scaledPoint:");
  qword_1AEA0 = v256;
  qword_1AEA8 = v257;
  objc_msgSend(v3, "scaledPoint:", -61.5, 36.5);
  qword_1AEB0 = v258;
  qword_1AEB8 = v259;
  objc_msgSend(v3, "scaledPoint:", -63.0, -2.0);
  qword_1AEC0 = v260;
  qword_1AEC8 = v261;
  objc_msgSend(v3, "scaledPoint:", -60.5, -40.0);
  qword_1AED0 = v262;
  qword_1AED8 = v263;
  objc_msgSend(v3, "scaledPoint:", -51.0, -78.5);
  qword_1AEE0 = v264;
  qword_1AEE8 = v265;
  objc_msgSend(v3, "scaledPoint:", 0.5, -78.5);
  qword_1AEF0 = v266;
  qword_1AEF8 = v267;
  objc_msgSend(v3, "scaledPoint:", 55.5, -70.0);
  qword_1AF00 = v268;
  qword_1AF08 = v269;
  objc_msgSend(v3, "scaledPoint:", 62.5, -33.0);
  qword_1AF10 = v270;
  qword_1AF18 = v271;
  objc_msgSend(v3, "scaledPoint:", 62.5, 4.5);
  qword_1AF20 = v272;
  qword_1AF28 = v273;
  objc_msgSend(v3, "scaledPoint:", 62.0, 42.0);
  qword_1AF30 = v274;
  qword_1AF38 = v275;
  objc_msgSend(v3, "scaledPoint:", 53.0, 79.0);
  qword_1AF40 = v276;
  qword_1AF48 = v277;
  objc_msgSend(v3, "scaledPoint:", 0.0, 82.0);
  qword_1AF50 = v278;
  qword_1AF58 = v279;
  objc_msgSend(v3, "scaledPoint:", -50.5, 79.0);
  qword_1AF60 = v280;
  qword_1AF68 = v281;
  objc_msgSend(v3, "scaledPoint:", -62.5, 41.5);
  qword_1AF70 = v282;
  qword_1AF78 = v283;
  objc_msgSend(v3, "scaledPoint:", -63.0, 4.5);
  qword_1AF80 = v284;
  qword_1AF88 = v285;
  objc_msgSend(v3, "scaledPoint:", -68.5, -33.0);
  qword_1AF90 = v286;
  qword_1AF98 = v287;
  objc_msgSend(v3, "scaledPoint:", -60.0, -70.0);
  qword_1AFA0 = v288;
  qword_1AFA8 = v289;
  objc_msgSend(v3, "scaledPoint:", 0.0, -70.0);
  qword_1AFB0 = v290;
  qword_1AFB8 = v291;
  objc_msgSend(v3, "scaledPoint:", 44.5, 21.5);
  qword_1AFC0 = v292;
  qword_1AFC8 = v293;
  objc_msgSend(v3, "scaledPoint:", 4.0, 50.5);
  qword_1AFD0 = v294;
  qword_1AFD8 = v295;
  objc_msgSend(v3, "scaledPoint:", -46.0, 21.0);
  qword_1AFE0 = v296;
  qword_1AFE8 = v297;
  objc_msgSend(v3, "scaledPoint:", -5.0, -54.5);
  qword_1AFF0 = v298;
  qword_1AFF8 = v299;
  objc_msgSend(v3, "scaledPoint:", 50.5, 12.5);
  qword_1B000 = v300;
  qword_1B008 = v301;
  objc_msgSend(v3, "scaledPoint:", 1.0, 56.0);
  qword_1B010 = v302;
  qword_1B018 = v303;
  objc_msgSend(v3, "scaledPoint:", -50.0, 12.5);
  qword_1B020 = v304;
  qword_1B028 = v305;
  objc_msgSend(v3, "scaledPoint:", 1.5, -57.0);
  qword_1B030 = v306;
  qword_1B038 = v307;
  objc_msgSend(v3, "scaledPoint:", 49.5, 14.5);
  qword_1B040 = v308;
  qword_1B048 = v309;
  objc_msgSend(v3, "scaledPoint:", 0.5, 73.0);
  qword_1B050 = v310;
  qword_1B058 = v311;
  objc_msgSend(v3, "scaledPoint:", -47.5, 13.5);
  qword_1B060 = v312;
  qword_1B068 = v313;
  objc_msgSend(v3, "scaledPoint:", -3.0, -49.0);
  qword_1B070 = v314;
  qword_1B078 = v315;
  objc_msgSend(v3, "scaledPoint:", 47.5, -77.5);
  qword_1B080 = v316;
  qword_1B088 = v317;
  objc_msgSend(v3, "scaledPoint:", 61.5, -39.5);
  qword_1B090 = v318;
  qword_1B098 = v319;
  objc_msgSend(v3, "scaledPoint:", 62.5, -1.0);
  qword_1B0A0 = v320;
  qword_1B0A8 = v321;
  objc_msgSend(v3, "scaledPoint:", 62.0, 37.5);
  qword_1B0B0 = v322;
  qword_1B0B8 = v323;
  objc_msgSend(v3, "scaledPoint:");
  qword_1B0C0 = v324;
  qword_1B0C8 = v325;
  objc_msgSend(v3, "scaledPoint:", 1.0, 76.5);
  qword_1B0D0 = v326;
  qword_1B0D8 = v327;
  objc_msgSend(v3, "scaledPoint:", -47.0, 75.5);
  qword_1B0E0 = v328;
  qword_1B0E8 = v329;
  objc_msgSend(v3, "scaledPoint:", -62.5, 37.0);
  qword_1B0F0 = v330;
  qword_1B0F8 = v331;
  objc_msgSend(v3, "scaledPoint:", -63.0, -1.0);
  qword_1B100 = v332;
  qword_1B108 = v333;
  objc_msgSend(v3, "scaledPoint:");
  qword_1B110 = v334;
  qword_1B118 = v335;
  objc_msgSend(v3, "scaledPoint:", -46.0, -78.0);
  qword_1B120 = v336;
  qword_1B128 = v337;
  objc_msgSend(v3, "scaledPoint:", 1.0, -78.0);
  qword_1B130 = v338;
  qword_1B138 = v339;
  objc_msgSend(v3, "scaledPoint:");
  qword_1B140 = v340;
  qword_1B148 = v341;
  objc_msgSend(v3, "scaledPoint:", 62.0, -40.5);
  qword_1B150 = v342;
  qword_1B158 = v343;
  objc_msgSend(v3, "scaledPoint:", 62.5, -2.0);
  qword_1B160 = v344;
  qword_1B168 = v345;
  objc_msgSend(v3, "scaledPoint:", 62.0, 37.0);
  qword_1B170 = v346;
  qword_1B178 = v347;
  objc_msgSend(v3, "scaledPoint:", 47.5, 75.0);
  qword_1B180 = v348;
  qword_1B188 = v349;
  objc_msgSend(v3, "scaledPoint:", 0.5, 78.0);
  qword_1B190 = v350;
  qword_1B198 = v351;
  objc_msgSend(v3, "scaledPoint:", -44.5, 75.0);
  qword_1B1A0 = v352;
  qword_1B1A8 = v353;
  objc_msgSend(v3, "scaledPoint:", -62.5, 36.5);
  qword_1B1B0 = v354;
  qword_1B1B8 = v355;
  objc_msgSend(v3, "scaledPoint:", -63.0, -2.0);
  qword_1B1C0 = v356;
  qword_1B1C8 = v357;
  objc_msgSend(v3, "scaledPoint:", -53.5, -40.5);
  qword_1B1D0 = v358;
  qword_1B1D8 = v359;
  objc_msgSend(v3, "scaledPoint:");
  qword_1B1E0 = v360;
  qword_1B1E8 = v361;
  objc_msgSend(v3, "scaledPoint:", 1.5, -79.0);
  qword_1B1F0 = v362;
  qword_1B1F8 = v363;
  objc_msgSend(v3, "scaledPoint:", 53.0, -70.0);
  qword_1B200 = v364;
  qword_1B208 = v365;
  objc_msgSend(v3, "scaledPoint:", 62.5, -32.5);
  qword_1B210 = v366;
  qword_1B218 = v367;
  objc_msgSend(v3, "scaledPoint:", 62.5, 4.5);
  qword_1B220 = v368;
  qword_1B228 = v369;
  objc_msgSend(v3, "scaledPoint:", 62.0, 41.5);
  qword_1B230 = v370;
  qword_1B238 = v371;
  objc_msgSend(v3, "scaledPoint:", 52.5, 79.0);
  qword_1B240 = v372;
  qword_1B248 = v373;
  objc_msgSend(v3, "scaledPoint:", 0.5, 82.0);
  qword_1B250 = v374;
  qword_1B258 = v375;
  objc_msgSend(v3, "scaledPoint:", -50.5, 79.0);
  qword_1B260 = v376;
  qword_1B268 = v377;
  objc_msgSend(v3, "scaledPoint:", -62.5, 41.5);
  qword_1B270 = v378;
  qword_1B278 = v379;
  objc_msgSend(v3, "scaledPoint:", -63.0, 4.5);
  qword_1B280 = v380;
  qword_1B288 = v381;
  objc_msgSend(v3, "scaledPoint:", -55.0, -32.0);
  qword_1B290 = v382;
  qword_1B298 = v383;
  objc_msgSend(v3, "scaledPoint:", -54.5, -70.0);
  qword_1B2A0 = v384;
  qword_1B2A8 = v385;
  objc_msgSend(v3, "scaledPoint:", -2.5, -70.0);
  qword_1B2B0 = v386;
  qword_1B2B8 = v387;
  objc_msgSend(v3, "scaledPoint:", 40.5, 7.5);
  qword_1B2C0 = v388;
  qword_1B2C8 = v389;
  objc_msgSend(v3, "scaledPoint:", 1.0, 66.0);
  qword_1B2D0 = v390;
  qword_1B2D8 = v391;
  objc_msgSend(v3, "scaledPoint:", -41.0, 7.0);
  qword_1B2E0 = v392;
  qword_1B2E8 = v393;
  objc_msgSend(v3, "scaledPoint:", 1.0, -61.5);
  qword_1B2F0 = v394;
  qword_1B2F8 = v395;
  objc_msgSend(v3, "scaledPoint:", 42.5, 6.0);
  qword_1B300 = v396;
  qword_1B308 = v397;
  objc_msgSend(v3, "scaledPoint:", 0.5, 61.5);
  qword_1B310 = v398;
  qword_1B318 = v399;
  objc_msgSend(v3, "scaledPoint:", -40.5, 6.0);
  qword_1B320 = v400;
  qword_1B328 = v401;
  objc_msgSend(v3, "scaledPoint:", 0.5, -65.0);
  qword_1B330 = v402;
  qword_1B338 = v403;
  objc_msgSend(v3, "scaledPoint:", 48.5, 17.5);
  qword_1B340 = v404;
  qword_1B348 = v405;
  objc_msgSend(v3, "scaledPoint:", 0.0, 74.0);
  qword_1B350 = v406;
  qword_1B358 = v407;
  objc_msgSend(v3, "scaledPoint:", -40.5, 18.0);
  qword_1B360 = v408;
  qword_1B368 = v409;
  objc_msgSend(v3, "scaledPoint:", 0.5, -49.5);
  qword_1B370 = v410;
  qword_1B378 = v411;
  objc_msgSend(v3, "scaledPoint:", 49.5, -74.0);
  qword_1B380 = v412;
  qword_1B388 = v413;
  objc_msgSend(v3, "scaledPoint:", 57.5, -40.0);
  qword_1B390 = v414;
  qword_1B398 = v415;
  objc_msgSend(v3, "scaledPoint:", 57.5, -1.5);
  qword_1B3A0 = v416;
  qword_1B3A8 = v417;
  objc_msgSend(v3, "scaledPoint:", 57.5, 37.5);
  qword_1B3B0 = v418;
  qword_1B3B8 = v419;
  objc_msgSend(v3, "scaledPoint:", 48.0, 75.5);
  qword_1B3C0 = v420;
  qword_1B3C8 = v421;
  objc_msgSend(v3, "scaledPoint:", 1.0, 75.5);
  qword_1B3D0 = v422;
  qword_1B3D8 = v423;
  objc_msgSend(v3, "scaledPoint:", -47.0, 75.5);
  qword_1B3E0 = v424;
  qword_1B3E8 = v425;
  objc_msgSend(v3, "scaledPoint:", -57.5, 37.5);
  qword_1B3F0 = v426;
  qword_1B3F8 = v427;
  objc_msgSend(v3, "scaledPoint:", -57.5, -1.5);
  qword_1B400 = v428;
  qword_1B408 = v429;
  objc_msgSend(v3, "scaledPoint:", -57.5, -36.5);
  qword_1B410 = v430;
  qword_1B418 = v431;
  objc_msgSend(v3, "scaledPoint:", -47.5, -75.5);
  qword_1B420 = v432;
  qword_1B428 = v433;
  objc_msgSend(v3, "scaledPoint:", 0.5, -74.5);
  qword_1B430 = v434;
  qword_1B438 = v435;
  objc_msgSend(v3, "scaledPoint:", 45.5, -74.5);
  qword_1B440 = v436;
  qword_1B448 = v437;
  objc_msgSend(v3, "scaledPoint:", 58.0, -37.0);
  qword_1B450 = v438;
  qword_1B458 = v439;
  objc_msgSend(v3, "scaledPoint:", 59.0, -2.0);
  qword_1B460 = v440;
  qword_1B468 = v441;
  objc_msgSend(v3, "scaledPoint:", 58.0, 37.5);
  qword_1B470 = v442;
  qword_1B478 = v443;
  objc_msgSend(v3, "scaledPoint:", 45.5, 74.5);
  qword_1B480 = v444;
  qword_1B488 = v445;
  objc_msgSend(v3, "scaledPoint:", -0.5, 74.5);
  qword_1B490 = v446;
  qword_1B498 = v447;
  objc_msgSend(v3, "scaledPoint:", -45.5, 74.5);
  qword_1B4A0 = v448;
  qword_1B4A8 = v449;
  objc_msgSend(v3, "scaledPoint:", -59.0, 37.5);
  qword_1B4B0 = v450;
  qword_1B4B8 = v451;
  objc_msgSend(v3, "scaledPoint:", -59.0, -2.0);
  qword_1B4C0 = v452;
  qword_1B4C8 = v453;
  objc_msgSend(v3, "scaledPoint:", -59.0, -37.5);
  qword_1B4D0 = v454;
  qword_1B4D8 = v455;
  objc_msgSend(v3, "scaledPoint:", -45.5, -79.0);
  qword_1B4E0 = v456;
  qword_1B4E8 = v457;
  objc_msgSend(v3, "scaledPoint:", 0.0, -78.5);
  qword_1B4F0 = v458;
  qword_1B4F8 = v459;
  objc_msgSend(v3, "scaledPoint:", 46.5, -71.5);
  qword_1B500 = v460;
  qword_1B508 = v461;
  objc_msgSend(v3, "scaledPoint:", 57.0, -32.5);
  qword_1B510 = v462;
  qword_1B518 = v463;
  objc_msgSend(v3, "scaledPoint:", 57.0, 2.5);
  qword_1B520 = v464;
  qword_1B528 = v465;
  objc_msgSend(v3, "scaledPoint:", 57.0, 41.5);
  qword_1B530 = v466;
  qword_1B538 = v467;
  objc_msgSend(v3, "scaledPoint:", 46.0, 79.0);
  qword_1B540 = v468;
  qword_1B548 = v469;
  objc_msgSend(v3, "scaledPoint:", 0.0, 79.0);
  qword_1B550 = v470;
  qword_1B558 = v471;
  objc_msgSend(v3, "scaledPoint:", -46.5, 79.0);
  qword_1B560 = v472;
  qword_1B568 = v473;
  objc_msgSend(v3, "scaledPoint:", -59.0, 41.5);
  qword_1B570 = v474;
  qword_1B578 = v475;
  objc_msgSend(v3, "scaledPoint:", -59.0, 2.5);
  qword_1B580 = v476;
  qword_1B588 = v477;
  objc_msgSend(v3, "scaledPoint:", -59.0, -33.0);
  qword_1B590 = v478;
  qword_1B598 = v479;
  objc_msgSend(v3, "scaledPoint:", -46.5, -71.5);
  qword_1B5A0 = v480;
  qword_1B5A8 = v481;
  objc_msgSend(v3, "scaledPoint:", 0.0, -71.5);
  qword_1B5B0 = v482;
  qword_1B5B8 = v483;
  v638 = v2;
  [v2 screenBounds];
  CLKRectGetCenter();
  for (uint64_t i = 0; i != 8; i += 2)
  {
    v485 = &qword_1A5D0[i];
    CLKAddPoints();
    v485[30] = v486;
    v485[31] = v487;
    CLKAddPoints();
    v485[38] = v488;
    v485[39] = v489;
    CLKAddPoints();
    v485[46] = v490;
    v485[47] = v491;
    CLKAddPoints();
    v485[126] = v492;
    v485[127] = v493;
    CLKAddPoints();
    v485[134] = v494;
    v485[135] = v495;
    CLKAddPoints();
    v485[142] = v496;
    v485[143] = v497;
    CLKAddPoints();
    v485[222] = v498;
    v485[223] = v499;
    CLKAddPoints();
    v485[230] = v500;
    v485[231] = v501;
    CLKAddPoints();
    v485[238] = v502;
    v485[239] = v503;
    CLKAddPoints();
    v485[318] = v504;
    v485[319] = v505;
    CLKAddPoints();
    v485[326] = v506;
    v485[327] = v507;
    CLKAddPoints();
    v485[334] = v508;
    v485[335] = v509;
    CLKAddPoints();
    v485[414] = v510;
    v485[415] = v511;
    CLKAddPoints();
    v485[422] = v512;
    v485[423] = v513;
    CLKAddPoints();
    v485[430] = v514;
    v485[431] = v515;
  }
  for (uint64_t j = 0; j != 24; j += 2)
  {
    v517 = &qword_1A5D0[j];
    CLKAddPoints();
    v517[54] = v518;
    v517[55] = v519;
    CLKAddPoints();
    v517[78] = v520;
    v517[79] = v521;
    CLKAddPoints();
    v517[102] = v522;
    v517[103] = v523;
    CLKAddPoints();
    v517[150] = v524;
    v517[151] = v525;
    CLKAddPoints();
    v517[174] = v526;
    v517[175] = v527;
    CLKAddPoints();
    v517[198] = v528;
    v517[199] = v529;
    CLKAddPoints();
    v517[246] = v530;
    v517[247] = v531;
    CLKAddPoints();
    v517[270] = v532;
    v517[271] = v533;
    CLKAddPoints();
    v517[294] = v534;
    v517[295] = v535;
    CLKAddPoints();
    v517[342] = v536;
    v517[343] = v537;
    CLKAddPoints();
    v517[366] = v538;
    v517[367] = v539;
    CLKAddPoints();
    v517[390] = v540;
    v517[391] = v541;
    CLKAddPoints();
    v517[438] = v542;
    v517[439] = v543;
    CLKAddPoints();
    v517[462] = v544;
    v517[463] = v545;
    CLKAddPoints();
    v517[486] = v546;
    v517[487] = v547;
  }
  qword_1A5D0[0] = (uint64_t)&qword_1A6C0;
  *(void *)algn_1A5D8 = &qword_1A9C0;
  qword_1A5E0 = (uint64_t)&qword_1ACC0;
  unk_1A5E8 = &qword_1AFC0;
  qword_1A5F0 = (uint64_t)&qword_1B2C0;
  unk_1A5F8 = &qword_1A700;
  qword_1A600 = (uint64_t)&qword_1AA00;
  unk_1A608 = &qword_1AD00;
  qword_1A610 = (uint64_t)&qword_1B000;
  unk_1A618 = &qword_1B300;
  qword_1A620 = (uint64_t)&qword_1A740;
  unk_1A628 = &qword_1AA40;
  qword_1A630 = (uint64_t)&qword_1AD40;
  unk_1A638 = &qword_1B040;
  qword_1A640 = (uint64_t)&qword_1B340;
  unk_1A648 = &qword_1A780;
  qword_1A650 = (uint64_t)&qword_1AA80;
  unk_1A658 = &qword_1AD80;
  qword_1A660 = (uint64_t)&qword_1B080;
  unk_1A668 = &qword_1B380;
  qword_1A670 = (uint64_t)&qword_1A840;
  unk_1A678 = &qword_1AB40;
  qword_1A680 = (uint64_t)&qword_1AE40;
  unk_1A688 = &qword_1B140;
  qword_1A690 = (uint64_t)&qword_1B440;
  unk_1A698 = &qword_1A900;
  qword_1A6A0 = (uint64_t)&qword_1AC00;
  unk_1A6A8 = &qword_1AF00;
  qword_1A6B0 = (uint64_t)&qword_1B200;
  unk_1A6B8 = &qword_1B500;
  [v3 scaledValue:74.5];
  uint64_t v635 = v548;
  [v3 scaledValue:95.0];
  uint64_t v633 = v549;
  [v3 scaledValue:94.0];
  uint64_t v631 = v550;
  [v3 scaledValue:92.5];
  uint64_t v629 = v551;
  [v3 scaledValue:63.0];
  uint64_t v627 = v552;
  [v3 scaledValue:87.5];
  uint64_t v554 = v553;
  [v3 scaledValue:95.0];
  uint64_t v556 = v555;
  [v3 scaledValue:91.5];
  uint64_t v558 = v557;
  [v3 scaledValue:68.0];
  uint64_t v560 = v559;
  [v3 scaledValue:82.0];
  uint64_t v562 = v561;
  [v3 scaledValue:81.0];
  uint64_t v564 = v563;
  [v3 scaledValue:36.0];
  uint64_t v566 = v565;
  [v3 scaledValue:32.5];
  uint64_t v568 = v567;
  [v3 scaledValue:34.0];
  qword_1B5C0 = v635;
  qword_1B5C8 = v633;
  qword_1B5D0 = v631;
  qword_1B5D8 = v629;
  qword_1B5E0 = v627;
  qword_1B5E8 = v554;
  qword_1B5F0 = v556;
  qword_1B5F8 = v556;
  qword_1B600 = v558;
  qword_1B608 = v560;
  qword_1B610 = v562;
  qword_1B618 = v562;
  qword_1B620 = v562;
  qword_1B628 = v562;
  qword_1B630 = v564;
  qword_1B638 = v568;
  qword_1B640 = v569;
  qword_1B648 = v569;
  qword_1B650 = v569;
  qword_1B658 = v568;
  qword_1B660 = v568;
  qword_1B668 = v569;
  qword_1B670 = v569;
  qword_1B678 = v569;
  qword_1B680 = v568;
  qword_1B688 = v568;
  qword_1B690 = v568;
  qword_1B698 = v568;
  qword_1B6A0 = v568;
  qword_1B6A8 = v566;
  v696[0] = &off_159C8;
  v694[0] = &off_159E0;
  v692 = &off_159C8;
  v690[0] = &off_159F8;
  [v3 scaledValue:21.0];
  v637 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v691[0] = v637;
  v690[1] = &off_15A10;
  [v3 scaledValue:-3.0];
  v636 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v691[1] = v636;
  v690[2] = &off_15A28;
  [v3 scaledValue:-3.0];
  v634 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v691[2] = v634;
  v690[3] = &off_15A40;
  [v3 scaledValue:-3.0];
  v632 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v689[0] = v632;
  [v3 scaledValue:-7.0];
  v630 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v689[1] = v630;
  v628 = +[NSArray arrayWithObjects:v689 count:2];
  v691[3] = v628;
  v626 = +[NSDictionary dictionaryWithObjects:v691 forKeys:v690 count:4];
  v693 = v626;
  v625 = +[NSDictionary dictionaryWithObjects:&v693 forKeys:&v692 count:1];
  v694[1] = &off_15A58;
  v695[0] = v625;
  v687[0] = &off_159C8;
  v685[0] = &off_15A10;
  [v3 scaledValue:-22.0];
  v624 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v686[0] = v624;
  v685[1] = &off_15A28;
  [v3 scaledValue:-22.0];
  v623 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v686[1] = v623;
  v685[2] = &off_15A40;
  [v3 scaledValue:-13.0];
  v622 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v686[2] = v622;
  v621 = +[NSDictionary dictionaryWithObjects:v686 forKeys:v685 count:3];
  v688[0] = v621;
  v687[1] = &off_159E0;
  v683[0] = &off_15A10;
  [v3 scaledValue:-8.0];
  v620 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[0] = v620;
  v683[1] = &off_15A70;
  [v3 scaledValue:-5.0];
  v619 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[1] = v619;
  v683[2] = &off_15A88;
  [v3 scaledValue:-2.0];
  v618 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[2] = v618;
  v683[3] = &off_15A28;
  [v3 scaledValue:-8.0];
  v617 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[3] = v617;
  v683[4] = &off_15AA0;
  [v3 scaledValue:-8.0];
  v616 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[4] = v616;
  v683[5] = &off_15A40;
  [v3 scaledValue:-4.0];
  v615 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v684[5] = v615;
  v614 = +[NSDictionary dictionaryWithObjects:v684 forKeys:v683 count:6];
  v688[1] = v614;
  v613 = +[NSDictionary dictionaryWithObjects:v688 forKeys:v687 count:2];
  v695[1] = v613;
  v612 = +[NSDictionary dictionaryWithObjects:v695 forKeys:v694 count:2];
  v697[0] = v612;
  v696[1] = &off_159E0;
  v681[0] = &off_159C8;
  v679[0] = &off_159C8;
  v677 = &off_15A40;
  [v3 scaledValue:-6.0];
  v611 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v678 = v611;
  v610 = +[NSDictionary dictionaryWithObjects:&v678 forKeys:&v677 count:1];
  v680[0] = v610;
  v679[1] = &off_159E0;
  v675[0] = &off_15AB8;
  [v3 scaledValue:-1.0];
  v609 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v676[0] = v609;
  v675[1] = &off_15AA0;
  [v3 scaledValue:-2.0];
  v608 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v676[1] = v608;
  v607 = +[NSDictionary dictionaryWithObjects:v676 forKeys:v675 count:2];
  v680[1] = v607;
  v606 = +[NSDictionary dictionaryWithObjects:v680 forKeys:v679 count:2];
  v682[0] = v606;
  v681[1] = &off_159E0;
  v673[0] = &off_159C8;
  v671 = &off_15A40;
  [v3 scaledValue:-7.0];
  v605 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v672 = v605;
  v604 = +[NSDictionary dictionaryWithObjects:&v672 forKeys:&v671 count:1];
  v674[0] = v604;
  v673[1] = &off_159E0;
  v669[0] = &off_15AB8;
  [v3 scaledValue:-1.0];
  v603 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v670[0] = v603;
  v669[1] = &off_15AA0;
  [v3 scaledValue:-2.0];
  v602 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v670[1] = v602;
  v601 = +[NSDictionary dictionaryWithObjects:v670 forKeys:v669 count:2];
  v674[1] = v601;
  v600 = +[NSDictionary dictionaryWithObjects:v674 forKeys:v673 count:2];
  v682[1] = v600;
  v681[2] = &off_15A58;
  v667[0] = &off_159C8;
  v665 = &off_15A40;
  [v3 scaledValue:-2.0];
  v599 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v666 = v599;
  v598 = +[NSDictionary dictionaryWithObjects:&v666 forKeys:&v665 count:1];
  v668[0] = v598;
  v667[1] = &off_159E0;
  v663 = &off_15AA0;
  [v3 scaledValue:-14.0];
  v597 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v664 = v597;
  v596 = +[NSDictionary dictionaryWithObjects:&v664 forKeys:&v663 count:1];
  v668[1] = v596;
  v595 = +[NSDictionary dictionaryWithObjects:v668 forKeys:v667 count:2];
  v682[2] = v595;
  v594 = +[NSDictionary dictionaryWithObjects:v682 forKeys:v681 count:3];
  v697[1] = v594;
  v696[2] = &off_15A58;
  v661[0] = &off_159C8;
  v659 = &off_159C8;
  v657 = &off_15A40;
  [v3 scaledValue:-4.0];
  v593 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v658 = v593;
  v592 = +[NSDictionary dictionaryWithObjects:&v658 forKeys:&v657 count:1];
  v660 = v592;
  v591 = +[NSDictionary dictionaryWithObjects:&v660 forKeys:&v659 count:1];
  v662[0] = v591;
  v661[1] = &off_159E0;
  v655 = &off_159C8;
  v653 = &off_15A40;
  [v3 scaledValue:-7.0];
  v590 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v654 = v590;
  v589 = +[NSDictionary dictionaryWithObjects:&v654 forKeys:&v653 count:1];
  v656 = v589;
  v588 = +[NSDictionary dictionaryWithObjects:&v656 forKeys:&v655 count:1];
  v662[1] = v588;
  v661[2] = &off_15A58;
  v651[0] = &off_159C8;
  v649 = &off_15A40;
  [v3 scaledValue:-18.0];
  v587 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v650 = v587;
  v586 = +[NSDictionary dictionaryWithObjects:&v650 forKeys:&v649 count:1];
  v652[0] = v586;
  v651[1] = &off_159E0;
  v647[0] = &off_15AB8;
  [v3 scaledValue:-14.0];
  v585 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v648[0] = v585;
  v647[1] = &off_15AA0;
  [v3 scaledValue:-14.0];
  v584 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v648[1] = v584;
  v647[2] = &off_15A40;
  [v3 scaledValue:-6.0];
  v583 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v648[2] = v583;
  v582 = +[NSDictionary dictionaryWithObjects:v648 forKeys:v647 count:3];
  v652[1] = v582;
  v581 = +[NSDictionary dictionaryWithObjects:v652 forKeys:v651 count:2];
  v662[2] = v581;
  v580 = +[NSDictionary dictionaryWithObjects:v662 forKeys:v661 count:3];
  v697[2] = v580;
  v696[3] = &off_15AD0;
  v645 = &off_15A58;
  v643[0] = &off_159C8;
  v641 = &off_15A40;
  [v3 scaledValue:-9.0];
  v579 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v642 = v579;
  v570 = +[NSDictionary dictionaryWithObjects:&v642 forKeys:&v641 count:1];
  v644[0] = v570;
  v643[1] = &off_159E0;
  v639[0] = &off_15AB8;
  [v3 scaledValue:-3.0];
  v571 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v640[0] = v571;
  v639[1] = &off_15AA0;
  [v3 scaledValue:-3.0];
  v572 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v640[1] = v572;
  v639[2] = &off_15A40;
  [v3 scaledValue:-4.0];
  v573 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v640[2] = v573;
  v574 = +[NSDictionary dictionaryWithObjects:v640 forKeys:v639 count:3];
  v644[1] = v574;
  v575 = +[NSDictionary dictionaryWithObjects:v644 forKeys:v643 count:2];
  v646 = v575;
  v576 = +[NSDictionary dictionaryWithObjects:&v646 forKeys:&v645 count:1];
  v697[3] = v576;
  uint64_t v577 = +[NSDictionary dictionaryWithObjects:v697 forKeys:v696 count:4];
  v578 = (void *)qword_1B6B0;
  qword_1B6B0 = v577;
}

void sub_D850(void *a1@<X0>, uint64_t a2@<X8>)
{
  obuint64_t j = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1B730);
  id WeakRetained = objc_loadWeakRetained(&qword_1B738);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_1B738);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_1B740;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_1B738, obj);
  qword_1B740 = (uint64_t)[obj version];

  sub_F854(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1B730);
  long long v10 = *(_OWORD *)&qword_1B718;
  *(_OWORD *)(a2 + 32) = xmmword_1B708;
  *(_OWORD *)(a2 + 48) = v10;
  *(void *)(a2 + 64) = qword_1B728;
  long long v11 = *(_OWORD *)&qword_1B6F8;
  *(_OWORD *)a2 = xmmword_1B6E8;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_E294(id a1)
{
  qword_1B6D8 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_E508(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 56);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v2;
  v10[2] = *(_OWORD *)(a1 + 72);
  id v3 = [*(id *)(a1 + 32) greyhoundContentView];
  [v3 setTransform:v10];

  long long v4 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 72);
  id v5 = [*(id *)(a1 + 32) dialComplicationContainerView];
  v6[0] = v7;
  v6[1] = v8;
  void v6[2] = v9;
  [v5 setTransform:v6];
}

void sub_F854(uint64_t a1, uint64_t a2)
{
  long long v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:15.0];
  *(double *)&xmmword_1B6E8 = v3;
  *((double *)&xmmword_1B6E8 + 1) = v3 + -2.5;
  qword_1B6F8 = *(void *)&UIFontWeightBlack;
  unk_1B700 = *(void *)&UIFontWeightHeavy;
  qword_1B718 = 0x3FED70A3D70A3D71;
  [v2 constantValue:2 withOverride:0.92 forSizeClass:0.89];
  qword_1B720 = v4;
  [v2 scaledValue:3 withOverride:-62.0 forSizeClass:-69.0];
  *(double *)&xmmword_1B708 = v5;
  *((double *)&xmmword_1B708 + 1) = v5 + 5.0;
  v8[0] = &off_15B48;
  v8[1] = &off_15B60;
  v9[0] = &off_16100;
  v9[1] = &off_16110;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v2 constantValue:v6 withOverrides:1.0];
  qword_1B728 = v7;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKAddPoints()
{
  return _CLKAddPoints();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t NTKAllSimpleTextComplicationTypes()
{
  return _NTKAllSimpleTextComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__applyBreathingAndRubberbandingScale(void *a1, const char *a2, ...)
{
  return [a1 _applyBreathingAndRubberbandingScale];
}

id objc_msgSend__applyRubberbandingAlpha(void *a1, const char *a2, ...)
{
  return [a1 _applyRubberbandingAlpha];
}

id objc_msgSend__cleanupComplicationTransition(void *a1, const char *a2, ...)
{
  return [a1 _cleanupComplicationTransition];
}

id objc_msgSend__createHourLabels(void *a1, const char *a2, ...)
{
  return [a1 _createHourLabels];
}

id objc_msgSend__defaultColorForDevice(void *a1, const char *a2, ...)
{
  return [a1 _defaultColorForDevice];
}

id objc_msgSend__dialComplicationView(void *a1, const char *a2, ...)
{
  return [a1 _dialComplicationView];
}

id objc_msgSend__font(void *a1, const char *a2, ...)
{
  return [a1 _font];
}

id objc_msgSend__loadContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadContentViews];
}

id objc_msgSend__loadCurrentComplicationFont(void *a1, const char *a2, ...)
{
  return [a1 _loadCurrentComplicationFont];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__unloadContentViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadContentViews];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clockHands(void *a1, const char *a2, ...)
{
  return [a1 clockHands];
}

id objc_msgSend_clockHandsInlay(void *a1, const char *a2, ...)
{
  return [a1 clockHandsInlay];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_density(void *a1, const char *a2, ...)
{
  return [a1 density];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_deviceSupportsPigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsPigmentEditOption];
}

id objc_msgSend_dialComplicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 dialComplicationContainerView];
}

id objc_msgSend_digit(void *a1, const char *a2, ...)
{
  return [a1 digit];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_greyhoundContentView(void *a1, const char *a2, ...)
{
  return [a1 greyhoundContentView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_isBlackBackground(void *a1, const char *a2, ...)
{
  return [a1 isBlackBackground];
}

id objc_msgSend_isTinker(void *a1, const char *a2, ...)
{
  return [a1 isTinker];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutComplicationViews(void *a1, const char *a2, ...)
{
  return [a1 layoutComplicationViews];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nyNumeralsBlackFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 nyNumeralsBlackFontDescriptor];
}

id objc_msgSend_nyNumeralsHeavyFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 nyNumeralsHeavyFontDescriptor];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_sfNumeralsBlackFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 sfNumeralsBlackFontDescriptor];
}

id objc_msgSend_sfNumeralsHeavyFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 sfNumeralsHeavyFontDescriptor];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_tokyoBlackFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 tokyoBlackFontDescriptor];
}

id objc_msgSend_tokyoHeavyFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 tokyoHeavyFontDescriptor];
}

id objc_msgSend_typeface(void *a1, const char *a2, ...)
{
  return [a1 typeface];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_verticalCenterOffset(void *a1, const char *a2, ...)
{
  return [a1 verticalCenterOffset];
}