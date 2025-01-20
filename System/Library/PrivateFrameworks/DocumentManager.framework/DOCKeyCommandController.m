@interface DOCKeyCommandController
+ (id)cancellingKeyCommandsWithAction:(SEL)a3;
+ (id)dismissingKeyCommandsWithAction:(SEL)a3;
- (id)_menuDefinition;
- (id)_menuOrder;
- (id)_menuTitleForCustomMenuWithIdentifier:(id)a3;
- (id)_unwantedMenuIdentifiers;
- (id)allKeyCommands;
- (id)allKeyCommandsWithAction:(SEL)a3;
- (void)buildWithBuilder:(id)a3;
@end

@implementation DOCKeyCommandController

+ (id)cancellingKeyCommandsWithAction:(SEL)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F82890];
  uint64_t v5 = *MEMORY[0x263F83758];
  v15 = @"com.apple.DocumentManager.keyCommands.cancel";
  v16 = &unk_26C403090;
  v6 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v7 = [v4 commandWithTitle:&stru_26C3FA950 image:0 action:a3 input:v5 modifierFlags:0 propertyList:v6];
  v17[0] = v7;
  v8 = (void *)MEMORY[0x263F82890];
  v13 = @"com.apple.DocumentManager.keyCommands.cancel";
  v14 = &unk_26C4030A8;
  v9 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v10 = [v8 commandWithTitle:&stru_26C3FA950 image:0 action:a3 input:@"." modifierFlags:0x100000 propertyList:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];

  return v11;
}

+ (id)dismissingKeyCommandsWithAction:(SEL)a3
{
  v22[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F82890];
  uint64_t v5 = *MEMORY[0x263F83758];
  v20 = @"com.apple.DocumentManager.keyCommands.dismiss";
  v21 = &unk_26C403090;
  v6 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v7 = [v4 commandWithTitle:&stru_26C3FA950 image:0 action:a3 input:v5 modifierFlags:0 propertyList:v6];
  v22[0] = v7;
  v8 = (void *)MEMORY[0x263F82890];
  v18 = @"com.apple.DocumentManager.keyCommands.dismiss";
  v19 = &unk_26C4030A8;
  v9 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v10 = [v8 commandWithTitle:&stru_26C3FA950 image:0 action:a3 input:@"." modifierFlags:0x100000 propertyList:v9];
  v22[1] = v10;
  v11 = (void *)MEMORY[0x263F82890];
  v16 = @"com.apple.DocumentManager.keyCommands.dismiss";
  v17 = &unk_26C4030C0;
  v12 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v13 = [v11 commandWithTitle:&stru_26C3FA950 image:0 action:a3 input:@"w" modifierFlags:0x100000 propertyList:v12];
  v22[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];

  return v14;
}

- (id)_menuDefinition
{
  v419[4] = *MEMORY[0x263EF8340];
  v418[0] = *MEMORY[0x263F83858];
  if (DOCDebugMenuEnabled())
  {
    v2 = [MEMORY[0x263F82890] commandWithTitle:&stru_26C3FA950 image:0 action:sel_performShowDebugMenu_ input:@"\\"" modifierFlags:0x100000 propertyList:MEMORY[0x263EFFA78]];
    [v2 setDiscoverabilityTitle:&stru_26C3FA950];
    [v2 setAttributes:4];
  }
  else
  {
    v2 = [MEMORY[0x263EFF9D0] null];
  }
  v409 = v2;
  v417[0] = v2;
  v3 = (void *)MEMORY[0x263F82890];
  v4 = _DocumentManagerBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"Create Document" value:@"Create Document" table:@"Localizable"];
  v6 = [v3 commandWithTitle:v5 image:0 action:sel_performCreateDocumentOrOpenNewWindow_ input:@"n" modifierFlags:0x100000 propertyList:0];

  v7 = _DocumentManagerBundle();
  v8 = [v7 localizedStringForKey:@"Create Document" value:@"Create Document" table:@"Localizable"];
  [v6 setDiscoverabilityTitle:v8];

  v408 = v6;
  v417[1] = v6;
  v9 = (void *)MEMORY[0x263F82890];
  v10 = _DocumentManagerBundle();
  v11 = [v10 localizedStringForKey:@"New Folder" value:@"New Folder" table:@"Localizable"];
  v12 = [v9 commandWithTitle:v11 image:0 action:sel_performCreateFolder_ input:@"n" modifierFlags:1179648 propertyList:0];

  v13 = _DocumentManagerBundle();
  v14 = [v13 localizedStringForKey:@"New Folder" value:@"New Folder" table:@"Localizable"];
  [v12 setDiscoverabilityTitle:v14];

  v407 = v12;
  v417[2] = v12;
  v15 = (void *)MEMORY[0x263F82890];
  v16 = _DocumentManagerBundle();
  v17 = [v16 localizedStringForKey:@"New Folder with Selection" value:@"New Folder with Selection" table:@"Localizable"];
  v18 = [v15 commandWithTitle:v17 image:0 action:sel_performCreateFolderWithSelection_ input:@"n" modifierFlags:1310720 propertyList:0];

  v19 = _DocumentManagerBundle();
  v20 = [v19 localizedStringForKey:@"New Folder with Selection" value:@"New Folder with Selection" table:@"Localizable"];
  [v18 setDiscoverabilityTitle:v20];

  v406 = v18;
  v417[3] = v18;
  v21 = (void *)MEMORY[0x263F82890];
  v22 = _DocumentManagerBundle();
  v23 = [v22 localizedStringForKey:@"Open" value:@"Open" table:@"Localizable"];
  uint64_t v24 = MEMORY[0x263EFFA78];
  v25 = [v21 commandWithTitle:v23 image:0 action:sel_performOpen_ input:*MEMORY[0x263F83750] modifierFlags:0x100000 propertyList:MEMORY[0x263EFFA78]];

  v26 = _DocumentManagerBundle();
  v27 = [v26 localizedStringForKey:@"Open" value:@"Open" table:@"Localizable"];
  [v25 setDiscoverabilityTitle:v27];

  [v25 setAttributes:4];
  v405 = v25;
  v417[4] = v25;
  v28 = (void *)MEMORY[0x263F82890];
  v29 = _DocumentManagerBundle();
  v30 = [v29 localizedStringForKey:@"Open" value:@"Open" table:@"Localizable"];
  v31 = [v28 commandWithTitle:v30 image:0 action:sel_performOpen_ input:@"o" modifierFlags:0x100000 propertyList:0];

  v32 = _DocumentManagerBundle();
  v33 = [v32 localizedStringForKey:@"Open" value:@"Open" table:@"Localizable"];
  [v31 setDiscoverabilityTitle:v33];

  v404 = v31;
  v417[5] = v31;
  v34 = [MEMORY[0x263F82890] commandWithTitle:&stru_26C3FA950 image:0 action:sel_performCommandReturnKey_ input:@"\r" modifierFlags:0x100000 propertyList:v24];
  [v34 setDiscoverabilityTitle:&stru_26C3FA950];
  [v34 setAttributes:4];
  id v35 = v34;
  [v35 setWantsPriorityOverSystemBehavior:1];
  v403 = v35;
  v417[6] = v35;
  v36 = (void *)MEMORY[0x263F82890];
  v37 = _DocumentManagerBundle();
  v38 = [v37 localizedStringForKey:@"Save" value:@"Save" table:@"Localizable"];
  v39 = [v36 commandWithTitle:v38 image:0 action:sel_performConfirmPickerExportOrDrillIn_ input:@"s" modifierFlags:0x100000 propertyList:0];

  v40 = _DocumentManagerBundle();
  v41 = [v40 localizedStringForKey:@"Save" value:@"Save" table:@"Localizable"];
  [v39 setDiscoverabilityTitle:v41];

  v402 = v39;
  v417[7] = v39;
  v42 = (void *)MEMORY[0x263F82890];
  v43 = _DocumentManagerBundle();
  v44 = [v43 localizedStringForKey:@"Get Info" value:@"Get Info" table:@"Localizable"];
  v45 = [v42 commandWithTitle:v44 image:0 action:sel_performGetInfo_ input:@"i" modifierFlags:0x100000 propertyList:0];

  v46 = _DocumentManagerBundle();
  v47 = [v46 localizedStringForKey:@"Get Info" value:@"Get Info" table:@"Localizable"];
  [v45 setDiscoverabilityTitle:v47];

  v401 = v45;
  v417[8] = v45;
  v48 = (void *)MEMORY[0x263F82890];
  v49 = _DocumentManagerBundle();
  v50 = [v49 localizedStringForKey:@"Rename" value:@"Rename" table:@"Localizable"];
  v51 = [v48 commandWithTitle:v50 image:0 action:sel_performRename_ input:@"\r" modifierFlags:0 propertyList:0];

  v52 = _DocumentManagerBundle();
  v53 = [v52 localizedStringForKey:@"Rename" value:@"Rename" table:@"Localizable"];
  [v51 setDiscoverabilityTitle:v53];

  id v54 = v51;
  [v54 setWantsPriorityOverSystemBehavior:1];
  v400 = v54;
  v417[9] = v54;
  v55 = (void *)MEMORY[0x263F82890];
  v56 = _DocumentManagerBundle();
  v57 = [v56 localizedStringForKey:@"Duplicate" value:@"Duplicate" table:@"Localizable"];
  v58 = [v55 commandWithTitle:v57 image:0 action:sel_performDuplicate_ input:@"d" modifierFlags:0x100000 propertyList:0];

  v59 = _DocumentManagerBundle();
  v60 = [v59 localizedStringForKey:@"Duplicate" value:@"Duplicate" table:@"Localizable"];
  [v58 setDiscoverabilityTitle:v60];

  v399 = v58;
  v417[10] = v58;
  v61 = (void *)MEMORY[0x263F82890];
  v62 = _DocumentManagerBundle();
  v63 = [v62 localizedStringForKey:@"Quick Look" value:@"Quick Look" table:@"Localizable"];
  v64 = [v61 commandWithTitle:v63 image:0 action:sel_performPreview_ input:@"y" modifierFlags:0x100000 propertyList:0];

  v65 = _DocumentManagerBundle();
  v66 = [v65 localizedStringForKey:@"Quick Look" value:@"Quick Look" table:@"Localizable"];
  [v64 setDiscoverabilityTitle:v66];

  v398 = v64;
  v417[11] = v64;
  v67 = (void *)MEMORY[0x263F82890];
  v68 = _DocumentManagerBundle();
  v69 = [v68 localizedStringForKey:@"Quick Look" value:@"Quick Look" table:@"Localizable"];
  v70 = [v67 commandWithTitle:v69 image:0 action:sel_performPreview_ input:@" " modifierFlags:0 propertyList:v24];

  v71 = _DocumentManagerBundle();
  v72 = [v71 localizedStringForKey:@"Quick Look" value:@"Quick Look" table:@"Localizable"];
  [v70 setDiscoverabilityTitle:v72];

  [v70 setAttributes:4];
  id v73 = v70;
  [v73 setWantsPriorityOverSystemBehavior:1];
  v397 = v73;
  v417[12] = v73;
  v74 = (void *)MEMORY[0x263F82890];
  v75 = _DocumentManagerBundle();
  v76 = [v75 localizedStringForKey:@"Show in Enclosing Folder" value:@"Show in Enclosing Folder" table:@"Localizable"];
  v77 = [v74 commandWithTitle:v76 image:0 action:sel_performRevealItem_ input:@"r" modifierFlags:0x100000 propertyList:0];

  v78 = _DocumentManagerBundle();
  v79 = [v78 localizedStringForKey:@"Show in Enclosing Folder" value:@"Show in Enclosing Folder" table:@"Localizable"];
  [v77 setDiscoverabilityTitle:v79];

  v396 = v77;
  v417[13] = v77;
  v80 = (void *)MEMORY[0x263F82890];
  v81 = _DocumentManagerBundle();
  v82 = [v81 localizedStringForKey:@"Show in Folder" value:@"Show in Folder" table:@"Localizable"];
  v83 = [v80 commandWithTitle:v82 image:0 action:sel_performRevealItem_ input:@"a" modifierFlags:1835008 propertyList:v24];

  v84 = _DocumentManagerBundle();
  v85 = [v84 localizedStringForKey:@"Show in Folder" value:@"Show in Folder" table:@"Localizable"];
  [v83 setDiscoverabilityTitle:v85];

  [v83 setAttributes:4];
  v395 = v83;
  v417[14] = v83;
  v86 = (void *)MEMORY[0x263F82890];
  v87 = _DocumentManagerBundle();
  v88 = [v87 localizedStringForKey:@"Favorite" value:@"Favorite" table:@"Localizable"];
  v89 = [v86 commandWithTitle:v88 image:0 action:sel_performMarkAsFavorite_ input:@"t" modifierFlags:1310720 propertyList:0];

  v90 = _DocumentManagerBundle();
  v91 = [v90 localizedStringForKey:@"Favorite" value:@"Favorite" table:@"Localizable"];
  [v89 setDiscoverabilityTitle:v91];

  v394 = v89;
  v417[15] = v89;
  v92 = (void *)MEMORY[0x263F82890];
  v93 = _DocumentManagerBundle();
  v94 = [v93 localizedStringForKey:@"Delete" value:@"Delete" table:@"Localizable"];
  v95 = (void *)MEMORY[0x263F825F0];
  v96 = _DocumentManagerBundle();
  v97 = [v96 localizedStringForKey:@"Delete Immediately…" value:@"Delete Immediately…" table:@"Localizable"];
  v98 = [v95 alternateWithTitle:v97 action:sel_performDeleteNow_ modifierFlags:1572864];
  v416 = v98;
  v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v416 count:1];
  v100 = [v92 commandWithTitle:v94 image:0 action:sel_performDelete_ input:@"\b" modifierFlags:0x100000 propertyList:0 alternates:v99];

  v101 = _DocumentManagerBundle();
  v102 = [v101 localizedStringForKey:@"Delete" value:@"Delete" table:@"Localizable"];
  [v100 setDiscoverabilityTitle:v102];

  v393 = v100;
  v417[16] = v100;
  v389 = (void *)MEMORY[0x263F82890];
  v391 = _DocumentManagerBundle();
  v103 = [v391 localizedStringForKey:@"Eject" value:@"Eject" table:@"Localizable"];
  v104 = (void *)MEMORY[0x263F825F0];
  v105 = _DocumentManagerBundle();
  v106 = [v105 localizedStringForKey:@"Eject" value:@"Eject" table:@"Localizable"];
  v107 = [v104 alternateWithTitle:v106 action:sel_performEjectMedium_ modifierFlags:1310720];
  v415[0] = v107;
  v108 = (void *)MEMORY[0x263F825F0];
  v109 = _DocumentManagerBundle();
  v110 = [v109 localizedStringForKey:@"Eject" value:@"Eject" table:@"Localizable"];
  v111 = [v108 alternateWithTitle:v110 action:sel_performEjectMedium_ modifierFlags:1572864];
  v415[1] = v111;
  v112 = [MEMORY[0x263EFF8C0] arrayWithObjects:v415 count:2];
  v113 = [v389 commandWithTitle:v103 image:0 action:sel_performEjectMedium_ input:@"e" modifierFlags:0x100000 propertyList:0 alternates:v112];

  v114 = _DocumentManagerBundle();
  v115 = [v114 localizedStringForKey:@"Eject" value:@"Eject" table:@"Localizable"];
  [v113 setDiscoverabilityTitle:v115];

  v392 = v113;
  v417[17] = v113;
  v116 = (void *)MEMORY[0x263F82890];
  v117 = _DocumentManagerBundle();
  v118 = [v117 localizedStringForKey:@"Find" value:@"Find" table:@"Localizable"];
  v119 = [v116 commandWithTitle:v118 image:0 action:sel_performFind_ input:@"f" modifierFlags:0x100000 propertyList:0];

  v120 = _DocumentManagerBundle();
  v121 = [v120 localizedStringForKey:@"Find" value:@"Find" table:@"Localizable"];
  [v119 setDiscoverabilityTitle:v121];

  v390 = v119;
  v417[18] = v119;
  v122 = (void *)MEMORY[0x263F82890];
  v123 = _DocumentManagerBundle();
  v124 = [v123 localizedStringForKey:@"Find" value:@"Find" table:@"Localizable"];
  v125 = [v122 commandWithTitle:v124 image:0 action:sel_performFind_ input:@"f" modifierFlags:1572864 propertyList:MEMORY[0x263EFFA78]];

  v126 = _DocumentManagerBundle();
  v127 = [v126 localizedStringForKey:@"Find" value:@"Find" table:@"Localizable"];
  [v125 setDiscoverabilityTitle:v127];

  [v125 setAttributes:4];
  v388 = v125;
  v417[19] = v125;
  v387 = [MEMORY[0x263EFF8C0] arrayWithObjects:v417 count:20];
  v419[0] = v387;
  v418[1] = *MEMORY[0x263F83850];
  v128 = (void *)MEMORY[0x263F82890];
  v129 = _DocumentManagerBundle();
  v130 = [v129 localizedStringForKey:@"Undo" value:@"Undo" table:@"Localizable"];
  v131 = [v128 commandWithTitle:v130 image:0 action:sel_undo_ input:@"z" modifierFlags:0x100000 propertyList:0];

  v132 = _DocumentManagerBundle();
  v133 = [v132 localizedStringForKey:@"Undo" value:@"Undo" table:@"Localizable"];
  [v131 setDiscoverabilityTitle:v133];

  v386 = v131;
  v414[0] = v131;
  v134 = (void *)MEMORY[0x263F82890];
  v135 = _DocumentManagerBundle();
  v136 = [v135 localizedStringForKey:@"Redo" value:@"Redo" table:@"Localizable"];
  v137 = [v134 commandWithTitle:v136 image:0 action:sel_redo_ input:@"z" modifierFlags:1179648 propertyList:0];

  v138 = _DocumentManagerBundle();
  v139 = [v138 localizedStringForKey:@"Redo" value:@"Redo" table:@"Localizable"];
  [v137 setDiscoverabilityTitle:v139];

  v385 = v137;
  v414[1] = v137;
  v140 = (void *)MEMORY[0x263F82890];
  v141 = _DocumentManagerBundle();
  v142 = [v141 localizedStringForKey:@"Copy" value:@"Copy" table:@"Localizable"];
  v143 = [v140 commandWithTitle:v142 image:0 action:sel_copy_ input:@"c" modifierFlags:0x100000 propertyList:0];

  v144 = _DocumentManagerBundle();
  v145 = [v144 localizedStringForKey:@"Copy" value:@"Copy" table:@"Localizable"];
  [v143 setDiscoverabilityTitle:v145];

  v384 = v143;
  v414[2] = v143;
  v146 = (void *)MEMORY[0x263F82890];
  v147 = _DocumentManagerBundle();
  v148 = [v147 localizedStringForKey:@"Paste" value:@"Paste" table:@"Localizable"];
  v149 = (void *)MEMORY[0x263F825F0];
  v150 = _DocumentManagerBundle();
  v151 = [v150 localizedStringForKey:@"Move Here" value:@"Move Here" table:@"Localizable"];
  v152 = [v149 alternateWithTitle:v151 action:sel_performMoveHere_ modifierFlags:1572864];
  v413 = v152;
  v153 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v413 count:1];
  v154 = [v146 commandWithTitle:v148 image:0 action:sel_paste_ input:@"v" modifierFlags:0x100000 propertyList:0 alternates:v153];

  v155 = _DocumentManagerBundle();
  v156 = [v155 localizedStringForKey:@"Paste" value:@"Paste" table:@"Localizable"];
  [v154 setDiscoverabilityTitle:v156];

  v383 = v154;
  v414[3] = v154;
  v157 = (void *)MEMORY[0x263F82890];
  v158 = _DocumentManagerBundle();
  v159 = [v158 localizedStringForKey:@"Select All" value:@"Select All" table:@"Localizable"];
  v160 = (void *)MEMORY[0x263F825F0];
  v161 = _DocumentManagerBundle();
  v162 = [v161 localizedStringForKey:@"Deselect All" value:@"Deselect All" table:@"Localizable"];
  v163 = [v160 alternateWithTitle:v162 action:sel_performDeselectAll_ modifierFlags:1572864];
  v412 = v163;
  v164 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v412 count:1];
  v165 = [v157 commandWithTitle:v159 image:0 action:sel_selectAll_ input:@"a" modifierFlags:0x100000 propertyList:0 alternates:v164];

  v166 = _DocumentManagerBundle();
  v167 = [v166 localizedStringForKey:@"Select All" value:@"Select All" table:@"Localizable"];
  [v165 setDiscoverabilityTitle:v167];

  v382 = v165;
  v414[4] = v165;
  v381 = [MEMORY[0x263EFF8C0] arrayWithObjects:v414 count:5];
  v419[1] = v381;
  v418[2] = *MEMORY[0x263F838D0];
  v168 = (void *)MEMORY[0x263F82890];
  v169 = _DocumentManagerBundle();
  v170 = [v169 localizedStringForKey:@"View as Icons" value:@"View as Icons" table:@"Localizable"];
  v171 = [v168 commandWithTitle:v170 image:0 action:sel_performViewAsIcons_ input:@"1" modifierFlags:0x100000 propertyList:0];

  v172 = _DocumentManagerBundle();
  v173 = [v172 localizedStringForKey:@"View as Icons" value:@"View as Icons" table:@"Localizable"];
  [v171 setDiscoverabilityTitle:v173];

  v380 = v171;
  v411[0] = v171;
  v174 = (void *)MEMORY[0x263F82890];
  v175 = _DocumentManagerBundle();
  v176 = [v175 localizedStringForKey:@"View as List" value:@"View as List" table:@"Localizable"];
  v177 = [v174 commandWithTitle:v176 image:0 action:sel_performViewAsList_ input:@"2" modifierFlags:0x100000 propertyList:0];

  v178 = _DocumentManagerBundle();
  v179 = [v178 localizedStringForKey:@"View as List" value:@"View as List" table:@"Localizable"];
  [v177 setDiscoverabilityTitle:v179];

  v379 = v177;
  v411[1] = v177;
  v180 = (void *)MEMORY[0x263F82890];
  v181 = _DocumentManagerBundle();
  v182 = [v181 localizedStringForKey:@"View as Column" value:@"View as Column" table:@"Localizable"];
  v183 = [v180 commandWithTitle:v182 image:0 action:sel_performViewAsColumns_ input:@"3" modifierFlags:0x100000 propertyList:0];

  v184 = _DocumentManagerBundle();
  v185 = [v184 localizedStringForKey:@"View as Column" value:@"View as Column" table:@"Localizable"];
  [v183 setDiscoverabilityTitle:v185];

  v378 = v183;
  v411[2] = v183;
  v186 = (void *)MEMORY[0x263F82890];
  v187 = _DocumentManagerBundle();
  v188 = [v187 localizedStringForKey:@"Use Groups" value:@"Use Groups" table:@"Localizable"];
  v189 = [v186 commandWithTitle:v188 image:0 action:sel_performUseGrouping_ input:@"0" modifierFlags:1310720 propertyList:0];

  v190 = _DocumentManagerBundle();
  v191 = [v190 localizedStringForKey:@"Use Groups" value:@"Use Groups" table:@"Localizable"];
  [v189 setDiscoverabilityTitle:v191];

  v377 = v189;
  v411[3] = v189;
  v192 = (void *)MEMORY[0x263F82890];
  v193 = _DocumentManagerBundle();
  v194 = [v193 localizedStringForKey:@"Sort by Name" value:@"Sort by Name" table:@"Localizable"];
  v195 = [v192 commandWithTitle:v194 image:0 action:sel_performSortByName_ input:@"1" modifierFlags:1835008 propertyList:0];

  v196 = _DocumentManagerBundle();
  v197 = [v196 localizedStringForKey:@"Sort by Name" value:@"Sort by Name" table:@"Localizable"];
  [v195 setDiscoverabilityTitle:v197];

  v376 = v195;
  v411[4] = v195;
  v198 = (void *)MEMORY[0x263F82890];
  v199 = _DocumentManagerBundle();
  v200 = [v199 localizedStringForKey:@"Sort by Kind" value:@"Sort by Kind" table:@"Localizable"];
  v201 = [v198 commandWithTitle:v200 image:0 action:sel_performSortByKind_ input:@"2" modifierFlags:1835008 propertyList:0];

  v202 = _DocumentManagerBundle();
  v203 = [v202 localizedStringForKey:@"Sort by Kind" value:@"Sort by Kind" table:@"Localizable"];
  [v201 setDiscoverabilityTitle:v203];

  v375 = v201;
  v411[5] = v201;
  v204 = (void *)MEMORY[0x263F82890];
  v205 = _DocumentManagerBundle();
  v206 = [v205 localizedStringForKey:@"Sort by Date" value:@"Sort by Date" table:@"Localizable"];
  v207 = [v204 commandWithTitle:v206 image:0 action:sel_performSortByDate_ input:@"5" modifierFlags:1835008 propertyList:0];

  v208 = _DocumentManagerBundle();
  v209 = [v208 localizedStringForKey:@"Sort by Date" value:@"Sort by Date" table:@"Localizable"];
  [v207 setDiscoverabilityTitle:v209];

  v374 = v207;
  v411[6] = v207;
  v210 = (void *)MEMORY[0x263F82890];
  v211 = _DocumentManagerBundle();
  v212 = [v211 localizedStringForKey:@"Sort by Date" value:@"Sort by Date" table:@"Localizable"];
  uint64_t v213 = MEMORY[0x263EFFA78];
  v214 = [v210 commandWithTitle:v212 image:0 action:sel_performSortByDate_ input:@"3" modifierFlags:1835008 propertyList:MEMORY[0x263EFFA78]];

  v215 = _DocumentManagerBundle();
  v216 = [v215 localizedStringForKey:@"Sort by Date" value:@"Sort by Date" table:@"Localizable"];
  [v214 setDiscoverabilityTitle:v216];

  [v214 setAttributes:4];
  v373 = v214;
  v411[7] = v214;
  v217 = (void *)MEMORY[0x263F82890];
  v218 = _DocumentManagerBundle();
  v219 = [v218 localizedStringForKey:@"Sort by Size" value:@"Sort by Size" table:@"Localizable"];
  v220 = [v217 commandWithTitle:v219 image:0 action:sel_performSortBySize_ input:@"6" modifierFlags:1835008 propertyList:0];

  v221 = _DocumentManagerBundle();
  v222 = [v221 localizedStringForKey:@"Sort by Size" value:@"Sort by Size" table:@"Localizable"];
  [v220 setDiscoverabilityTitle:v222];

  v372 = v220;
  v411[8] = v220;
  v223 = (void *)MEMORY[0x263F82890];
  v224 = _DocumentManagerBundle();
  v225 = [v224 localizedStringForKey:@"Sort by Tags" value:@"Sort by Tags" table:@"Localizable"];
  v226 = [v223 commandWithTitle:v225 image:0 action:sel_performSortByTags_ input:@"7" modifierFlags:1835008 propertyList:0];

  v227 = _DocumentManagerBundle();
  v228 = [v227 localizedStringForKey:@"Sort by Tags" value:@"Sort by Tags" table:@"Localizable"];
  [v226 setDiscoverabilityTitle:v228];

  v371 = v226;
  v411[9] = v226;
  v229 = (void *)MEMORY[0x263F82890];
  v230 = _DocumentManagerBundle();
  v231 = [v230 localizedStringForKey:@"Group by Kind" value:@"Group by Kind" table:@"Localizable"];
  v232 = [v229 commandWithTitle:v231 image:0 action:sel_performGroupByKind_ input:@"2" modifierFlags:1310720 propertyList:0];

  v233 = _DocumentManagerBundle();
  v234 = [v233 localizedStringForKey:@"Group by Kind" value:@"Group by Kind" table:@"Localizable"];
  [v232 setDiscoverabilityTitle:v234];

  v370 = v232;
  v411[10] = v232;
  v235 = (void *)MEMORY[0x263F82890];
  v236 = _DocumentManagerBundle();
  v237 = [v236 localizedStringForKey:@"Group by Date" value:@"Group by Date" table:@"Localizable"];
  v238 = [v235 commandWithTitle:v237 image:0 action:sel_performGroupByDate_ input:@"5" modifierFlags:1310720 propertyList:0];

  v239 = _DocumentManagerBundle();
  v240 = [v239 localizedStringForKey:@"Group by Date" value:@"Group by Date" table:@"Localizable"];
  [v238 setDiscoverabilityTitle:v240];

  v369 = v238;
  v411[11] = v238;
  v241 = (void *)MEMORY[0x263F82890];
  v242 = _DocumentManagerBundle();
  v243 = [v242 localizedStringForKey:@"Group by Date" value:@"Group by Date" table:@"Localizable"];
  v244 = [v241 commandWithTitle:v243 image:0 action:sel_performGroupByDate_ input:@"3" modifierFlags:1310720 propertyList:v213];

  v245 = _DocumentManagerBundle();
  v246 = [v245 localizedStringForKey:@"Group by Date" value:@"Group by Date" table:@"Localizable"];
  [v244 setDiscoverabilityTitle:v246];

  [v244 setAttributes:4];
  v368 = v244;
  v411[12] = v244;
  v247 = (void *)MEMORY[0x263F82890];
  v248 = _DocumentManagerBundle();
  v249 = [v248 localizedStringForKey:@"Group by Size" value:@"Group by Size" table:@"Localizable"];
  v250 = [v247 commandWithTitle:v249 image:0 action:sel_performGroupBySize_ input:@"6" modifierFlags:1310720 propertyList:0];

  v251 = _DocumentManagerBundle();
  v252 = [v251 localizedStringForKey:@"Group by Size" value:@"Group by Size" table:@"Localizable"];
  [v250 setDiscoverabilityTitle:v252];

  v367 = v250;
  v411[13] = v250;
  v253 = (void *)MEMORY[0x263F82890];
  v254 = _DocumentManagerBundle();
  v255 = [v254 localizedStringForKey:@"Group by Shared by" value:@"Group by Shared by" table:@"Localizable"];
  v256 = [v253 commandWithTitle:v255 image:0 action:sel_performGroupBySharedBy_ input:@"8" modifierFlags:1310720 propertyList:0];

  v257 = _DocumentManagerBundle();
  v258 = [v257 localizedStringForKey:@"Group by Shared by" value:@"Group by Shared by" table:@"Localizable"];
  [v256 setDiscoverabilityTitle:v258];

  v366 = v256;
  v411[14] = v256;
  v365 = [MEMORY[0x263F3AB90] viewOptionsSizeSetting];
  if ([v365 isEnabled])
  {
    v259 = (void *)MEMORY[0x263F82890];
    v260 = _DocumentManagerBundle();
    v261 = [v260 localizedStringForKey:@"Make Icons Smaller" value:@"Make Icons Smaller" table:@"Localizable"];
    v262 = [v259 commandWithTitle:v261 image:0 action:sel_performViewAsUserSizeSmaller_ input:@"-" modifierFlags:0x100000 propertyList:0];

    v263 = _DocumentManagerBundle();
    v264 = [v263 localizedStringForKey:@"Make Icons Smaller" value:@"Make Icons Smaller" table:@"Localizable"];
    [v262 setDiscoverabilityTitle:v264];

    unint64_t v265 = 0x263EFF000;
  }
  else
  {
    unint64_t v265 = 0x263EFF000uLL;
    v262 = [MEMORY[0x263EFF9D0] null];
  }
  v411[15] = v262;
  v363 = [MEMORY[0x263F3AB90] viewOptionsSizeSetting];
  if ([v363 isEnabled])
  {
    v266 = (void *)MEMORY[0x263F82890];
    v267 = _DocumentManagerBundle();
    v268 = [v267 localizedStringForKey:@"Make Icons Bigger" value:@"Make Icons Bigger" table:@"Localizable"];
    v269 = [v266 commandWithTitle:v268 image:0 action:sel_performViewAsUserSizeLarger_ input:@"+" modifierFlags:0x100000 propertyList:0];

    v270 = _DocumentManagerBundle();
    v271 = [v270 localizedStringForKey:@"Make Icons Bigger" value:@"Make Icons Bigger" table:@"Localizable"];
    [v269 setDiscoverabilityTitle:v271];
  }
  else
  {
    v269 = [*(id *)(v265 + 2512) null];
  }
  v362 = v269;
  v411[16] = v269;
  v361 = [MEMORY[0x263EFF8C0] arrayWithObjects:v411 count:17];
  v419[2] = v361;
  v418[3] = @"com.apple.DocumentManager.menu.main.go";
  v272 = (void *)MEMORY[0x263F82890];
  v273 = _DocumentManagerBundle();
  v274 = [v273 localizedStringForKey:@"Go to Enclosing Folder" value:@"Go to Enclosing Folder" table:@"Localizable"];
  v275 = [v272 commandWithTitle:v274 image:0 action:sel_performGoToEnclosingFolder_ input:*MEMORY[0x263F83770] modifierFlags:0x100000 propertyList:0];

  v276 = _DocumentManagerBundle();
  v277 = [v276 localizedStringForKey:@"Go to Enclosing Folder" value:@"Go to Enclosing Folder" table:@"Localizable"];
  [v275 setDiscoverabilityTitle:v277];

  v360 = v275;
  v410[0] = v275;
  v278 = (void *)MEMORY[0x263F82890];
  v279 = _DocumentManagerBundle();
  v280 = [v279 localizedStringForKey:@"Go Back" value:@"Go Back" table:@"Localizable"];
  v281 = [v278 commandWithTitle:v280 image:0 action:sel_performGoBackInHistory_ input:@"[" modifierFlags:0x100000 propertyList:0];

  v282 = _DocumentManagerBundle();
  v283 = [v282 localizedStringForKey:@"Go Back" value:@"Go Back" table:@"Localizable"];
  [v281 setDiscoverabilityTitle:v283];

  v359 = v281;
  v410[1] = v281;
  v284 = (void *)MEMORY[0x263F82890];
  v285 = _DocumentManagerBundle();
  v286 = [v285 localizedStringForKey:@"Go Forward" value:@"Go Forward" table:@"Localizable"];
  v287 = [v284 commandWithTitle:v286 image:0 action:sel_performGoForwardInHistory_ input:@"]" modifierFlags:0x100000 propertyList:0];

  v288 = _DocumentManagerBundle();
  v289 = [v288 localizedStringForKey:@"Go Forward" value:@"Go Forward" table:@"Localizable"];
  [v287 setDiscoverabilityTitle:v289];

  v358 = v287;
  v410[2] = v287;
  v290 = (void *)MEMORY[0x263F82890];
  v291 = _DocumentManagerBundle();
  v292 = [v291 localizedStringForKey:@"Go to Recents" value:@"Go to Recents" table:@"Localizable"];
  v293 = [v290 commandWithTitle:v292 image:0 action:sel_performGoToRecents_ input:@"f" modifierFlags:1179648 propertyList:0];

  v294 = _DocumentManagerBundle();
  v295 = [v294 localizedStringForKey:@"Go to Recents" value:@"Go to Recents" table:@"Localizable"];
  [v293 setDiscoverabilityTitle:v295];

  v357 = v293;
  v410[3] = v293;
  v296 = (void *)MEMORY[0x263F82890];
  v297 = _DocumentManagerBundle();
  v298 = [v297 localizedStringForKey:@"Go to Recents" value:@"Go to Recents" table:@"Localizable"];
  v299 = [v296 commandWithTitle:v298 image:0 action:sel_performGoToRecents_ input:@"r" modifierFlags:1179648 propertyList:MEMORY[0x263EFFA78]];

  v300 = _DocumentManagerBundle();
  v301 = [v300 localizedStringForKey:@"Go to Recents" value:@"Go to Recents" table:@"Localizable"];
  [v299 setDiscoverabilityTitle:v301];

  [v299 setAttributes:4];
  v356 = v299;
  v410[4] = v299;
  v364 = v262;
  if (DOCUsePadIdiomForTraits(0))
  {
    v302 = [*(id *)(v265 + 2512) null];
  }
  else
  {
    v303 = (void *)MEMORY[0x263F82890];
    v304 = _DocumentManagerBundle();
    v305 = [v304 localizedStringForKey:@"Go to Browse" value:@"Go to Browse" table:@"Localizable"];
    v302 = [v303 commandWithTitle:v305 image:0 action:sel_performGoToBrowse_ input:@"b" modifierFlags:1179648 propertyList:0];

    v306 = _DocumentManagerBundle();
    v307 = [v306 localizedStringForKey:@"Go to Browse" value:@"Go to Browse" table:@"Localizable"];
    [v302 setDiscoverabilityTitle:v307];
  }
  v355 = v302;
  v410[5] = v302;
  v308 = (void *)MEMORY[0x263F82890];
  v309 = _DocumentManagerBundle();
  v310 = [v309 localizedStringForKey:@"Go to Documents" value:@"Go to Documents" table:@"Localizable"];
  v311 = [v308 commandWithTitle:v310 image:0 action:sel_performGoToDocuments_ input:@"o" modifierFlags:1179648 propertyList:0];

  v312 = _DocumentManagerBundle();
  v313 = [v312 localizedStringForKey:@"Go to Documents" value:@"Go to Documents" table:@"Localizable"];
  v354 = v311;
  [v311 setDiscoverabilityTitle:v313];

  v410[6] = v311;
  v314 = (void *)MEMORY[0x263F82890];
  v315 = _DocumentManagerBundle();
  v316 = [v315 localizedStringForKey:@"Go to Desktop" value:@"Go to Desktop" table:@"Localizable"];
  v317 = [v314 commandWithTitle:v316 image:0 action:sel_performGoToDesktop_ input:@"d" modifierFlags:1179648 propertyList:0];

  v318 = _DocumentManagerBundle();
  v319 = [v318 localizedStringForKey:@"Go to Desktop" value:@"Go to Desktop" table:@"Localizable"];
  v353 = v317;
  [v317 setDiscoverabilityTitle:v319];

  v410[7] = v317;
  v320 = (void *)MEMORY[0x263F82890];
  v321 = _DocumentManagerBundle();
  v322 = [v321 localizedStringForKey:@"Go to Downloads" value:@"Go to Downloads" table:@"Localizable"];
  v323 = [v320 commandWithTitle:v322 image:0 action:sel_performGoToDownloads_ input:@"l" modifierFlags:1572864 propertyList:0];

  v324 = _DocumentManagerBundle();
  v325 = [v324 localizedStringForKey:@"Go to Downloads" value:@"Go to Downloads" table:@"Localizable"];
  [v323 setDiscoverabilityTitle:v325];

  v410[8] = v323;
  v326 = (void *)MEMORY[0x263F82890];
  v327 = _DocumentManagerBundle();
  v328 = [v327 localizedStringForKey:@"Go to Shared" value:@"Go to Shared" table:@"Localizable"];
  v329 = [v326 commandWithTitle:v328 image:0 action:sel_performGoToShared_ input:@"s" modifierFlags:1179648 propertyList:0];

  v330 = _DocumentManagerBundle();
  v331 = [v330 localizedStringForKey:@"Go to Shared" value:@"Go to Shared" table:@"Localizable"];
  [v329 setDiscoverabilityTitle:v331];

  v410[9] = v329;
  v332 = (void *)MEMORY[0x263F82890];
  v333 = _DocumentManagerBundle();
  v334 = [v333 localizedStringForKey:@"Go to iCloud Drive" value:@"Go to iCloud Drive" table:@"Localizable"];
  v335 = [v332 commandWithTitle:v334 image:0 action:sel_performGoToICloudDrive_ input:@"i" modifierFlags:1179648 propertyList:0];

  v336 = _DocumentManagerBundle();
  v337 = [v336 localizedStringForKey:@"Go to iCloud Drive" value:@"Go to iCloud Drive" table:@"Localizable"];
  [v335 setDiscoverabilityTitle:v337];

  v410[10] = v335;
  v338 = (void *)MEMORY[0x263F82890];
  v339 = _DocumentManagerBundle();
  v340 = [v339 localizedStringForKey:@"Go to Folder…" value:@"Go to Folder…" table:@"Localizable"];
  v341 = [v338 commandWithTitle:v340 image:0 action:sel_performGoToLocation_ input:@"g" modifierFlags:1179648 propertyList:0];

  v342 = _DocumentManagerBundle();
  v343 = [v342 localizedStringForKey:@"Go to Folder…" value:@"Go to Folder…" table:@"Localizable"];
  [v341 setDiscoverabilityTitle:v343];

  v410[11] = v341;
  v344 = (void *)MEMORY[0x263F82890];
  v345 = _DocumentManagerBundle();
  v346 = [v345 localizedStringForKey:@"Connect to Server…" value:@"Connect to Server…" table:@"Localizable"];
  v347 = [v344 commandWithTitle:v346 image:0 action:sel_performConnectToServer_ input:@"k" modifierFlags:0x100000 propertyList:0];

  v348 = _DocumentManagerBundle();
  v349 = [v348 localizedStringForKey:@"Connect to Server…" value:@"Connect to Server…" table:@"Localizable"];
  [v347 setDiscoverabilityTitle:v349];

  v410[12] = v347;
  v350 = [MEMORY[0x263EFF8C0] arrayWithObjects:v410 count:13];
  v419[3] = v350;
  v351 = [NSDictionary dictionaryWithObjects:v419 forKeys:v418 count:4];

  return v351;
}

- (id)_menuOrder
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F83850];
  v5[0] = *MEMORY[0x263F83858];
  v5[1] = v2;
  v5[2] = *MEMORY[0x263F838D0];
  v5[3] = @"com.apple.DocumentManager.menu.main.go";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:4];
  return v3;
}

- (id)_unwantedMenuIdentifiers
{
  v5[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F83868];
  v5[0] = *MEMORY[0x263F83880];
  v5[1] = v2;
  v5[2] = *MEMORY[0x263F83850];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  return v3;
}

- (id)_menuTitleForCustomMenuWithIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"com.apple.DocumentManager.menu.main.go"])
  {
    v6 = _DocumentManagerBundle();
    v7 = v6;
    v8 = @"Go [Menu title]";
    v9 = @"Go";
LABEL_5:
    v10 = [v6 localizedStringForKey:v8 value:v9 table:@"Localizable"];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F83850]])
  {
    v6 = _DocumentManagerBundle();
    v7 = v6;
    v8 = @"Edit [Menu title]";
    v9 = @"Edit";
    goto LABEL_5;
  }
  v7 = [MEMORY[0x263F08690] currentHandler];
  [v7 handleFailureInMethod:a2, self, @"DOCKeyCommandController.m", 287, @"Incomplete definition of menu titles, menu identifier missing: %@", v5 object file lineNumber description];
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)buildWithBuilder:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(DOCKeyCommandController *)self _menuDefinition];
  v7 = [(DOCKeyCommandController *)self _menuOrder];
  v49 = v6;
  v8 = [v6 allKeys];
  obuint64_t j = self;
  v9 = [(DOCKeyCommandController *)self _unwantedMenuIdentifiers];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(v10);
        }
        if (([v7 containsObject:*(void *)(*((void *)&v62 + 1) + 8 * i)] & 1) == 0)
        {
          [MEMORY[0x263F08690] currentHandler];
          v15 = v7;
          v17 = id v16 = v10;
          [v17 handleFailureInMethod:a2 object:obj file:@"DOCKeyCommandController.m" lineNumber:301 description:@"Menu identifier not in _menuOrder."];

          id v10 = v16;
          v7 = v15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v12);
  }
  v43 = v7;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v59 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(v5, "removeMenuForIdentifier:", *(void *)(*((void *)&v58 + 1) + 8 * j), v43);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v20);
  }
  v45 = v10;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v23 = [(DOCKeyCommandController *)obj _menuOrder];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v67 count:16];
  v44 = v18;
  if (v24)
  {
    uint64_t v25 = v24;
    id v26 = 0;
    uint64_t v27 = *(void *)v55;
    uint64_t v46 = *MEMORY[0x263F83890];
    do
    {
      uint64_t v28 = 0;
      v29 = v26;
      do
      {
        if (*(void *)v55 != v27) {
          objc_enumerationMutation(v23);
        }
        v30 = *(void **)(*((void *)&v54 + 1) + 8 * v28);
        v31 = objc_msgSend(v5, "menuForIdentifier:", v30, v43, v44, v45);
        if (!v31)
        {
          v32 = [(DOCKeyCommandController *)obj _menuTitleForCustomMenuWithIdentifier:v30];
          v33 = [MEMORY[0x263F82940] menuWithTitle:v32 image:0 identifier:v30 options:0 children:MEMORY[0x263EFFA68]];
          if (v29) {
            [v5 insertSiblingMenu:v33 afterMenuForIdentifier:v29];
          }
          else {
            [v5 insertChildMenu:v33 atStartOfMenuForIdentifier:v46];
          }
        }
        id v26 = v30;

        ++v28;
        v29 = v26;
      }
      while (v25 != v28);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v25);
  }
  else
  {
    id v26 = 0;
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obja = v43;
  uint64_t v34 = [obja countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(obja);
        }
        uint64_t v38 = *(void *)(*((void *)&v50 + 1) + 8 * k);
        v39 = objc_msgSend(v49, "objectForKeyedSubscript:", v38, v43);
        v40 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_7];
        v41 = [v39 filteredArrayUsingPredicate:v40];

        v42 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C3FA950 image:0 identifier:0 options:1 children:v41];
        [v5 insertChildMenu:v42 atEndOfMenuForIdentifier:v38];
      }
      uint64_t v35 = [obja countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v35);
  }
}

BOOL __44__DOCKeyCommandController_buildWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D0];
  id v3 = a2;
  id v4 = [v2 null];

  return v4 != v3;
}

- (id)allKeyCommands
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v18 = [(DOCKeyCommandController *)self _menuDefinition];
  id v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(DOCKeyCommandController *)self _menuOrder];
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        v7 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              uint64_t v13 = [MEMORY[0x263EFF9D0] null];

              if (v12 != v13) {
                [v3 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v9);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  v14 = (void *)[v3 copy];
  return v14;
}

- (id)allKeyCommandsWithAction:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(DOCKeyCommandController *)self allKeyCommands];
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_doc_erasedKeyCommandWithWrappedAction:", a3, (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

@end