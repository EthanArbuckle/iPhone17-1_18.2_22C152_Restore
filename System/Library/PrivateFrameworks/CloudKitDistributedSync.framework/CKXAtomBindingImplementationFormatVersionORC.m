@interface CKXAtomBindingImplementationFormatVersionORC
- (CKXAtomBindingImplementationFormatVersionORC)init;
- (id)orcHelpers;
@end

@implementation CKXAtomBindingImplementationFormatVersionORC

- (CKXAtomBindingImplementationFormatVersionORC)init
{
  v86.receiver = self;
  v86.super_class = (Class)CKXAtomBindingImplementationFormatVersionORC;
  v2 = [(CKXAtomBindingImplementation *)&v86 init];
  v5 = v2;
  if (v2)
  {
    v6 = objc_msgSend_schema(v2, v3, v4);
    v5->super.tokens.timestamp = sub_1DD2FD560(v6, v7, v8);

    v11 = objc_msgSend_schema(v5, v9, v10);
    v5->super.tokens.timestamp_identifier = sub_1DD2FDDE0(v11, (const char *)2, v5->super.tokens.timestamp);

    v14 = objc_msgSend_schema(v5, v12, v13);
    v5->super.tokens.timestamp_modifier = sub_1DD2FDA38(v14, v5->super.tokens.timestamp, (uint64_t)"C", 0);

    v17 = objc_msgSend_schema(v5, v15, v16);
    v5->super.tokens.timestamp_clock = sub_1DD2FDA38(v17, v5->super.tokens.timestamp, (uint64_t)"Q", 0);

    v20 = objc_msgSend_schema(v5, v18, v19);
    v5->super.tokens.timestamp_unordered = sub_1DD2FDA38(v20, v5->super.tokens.timestamp, (uint64_t)"C", 0);

    v23 = objc_msgSend_schema(v5, v21, v22);
    v5->super.tokens.location = sub_1DD2FD560(v23, v24, v25);

    v28 = objc_msgSend_schema(v5, v26, v27);
    v5->super.tokens.location_identifier = sub_1DD2FDDE0(v28, (const char *)2, v5->super.tokens.location);

    v31 = objc_msgSend_schema(v5, v29, v30);
    v5->super.tokens.location_zone_name = sub_1DD2FDDE0(v31, (const char *)1, v5->super.tokens.location);

    v34 = objc_msgSend_schema(v5, v32, v33);
    v5->super.tokens.location_zone_owner_name = sub_1DD2FDDE0(v34, (const char *)1, v5->super.tokens.location);

    v37 = objc_msgSend_schema(v5, v35, v36);
    v5->super.tokens.reference = sub_1DD2FD560(v37, v38, v39);

    v42 = objc_msgSend_schema(v5, v40, v41);
    v5->super.tokens.reference_type = sub_1DD2FDA38(v42, v5->super.tokens.reference, (uint64_t)"C", 0);

    v45 = objc_msgSend_schema(v5, v43, v44);
    v5->super.tokens.reference_location = sub_1DD2FDBC4((uint64_t)v45, (const char *)v5->super.tokens.location, v5->super.tokens.reference);

    v48 = objc_msgSend_schema(v5, v46, v47);
    v5->super.tokens.reference_timestamp = sub_1DD2FDBC4((uint64_t)v48, (const char *)v5->super.tokens.timestamp, v5->super.tokens.reference);

    v51 = objc_msgSend_schema(v5, v49, v50);
    v5->super.tokens.atom = sub_1DD2FD560(v51, v52, v53);

    v56 = objc_msgSend_schema(v5, v54, v55);
    v5->super.tokens.atom_version = sub_1DD2FDA38(v56, v5->super.tokens.atom, (uint64_t)"Q", 0);

    v59 = objc_msgSend_schema(v5, v57, v58);
    v5->super.tokens.atom_location = sub_1DD2FDBC4((uint64_t)v59, (const char *)v5->super.tokens.location, v5->super.tokens.atom);

    v62 = objc_msgSend_schema(v5, v60, v61);
    v5->super.tokens.atom_timestamp = sub_1DD2FDBC4((uint64_t)v62, (const char *)v5->super.tokens.timestamp, v5->super.tokens.atom);

    v65 = objc_msgSend_schema(v5, v63, v64);
    v5->super.tokens.atom_references = sub_1DD2FDCE4((uint64_t)v65, (const char *)v5->super.tokens.reference, v5->super.tokens.atom);

    v68 = objc_msgSend_schema(v5, v66, v67);
    v5->super.tokens.atom_atom_behavior = sub_1DD2FDA38(v68, v5->super.tokens.atom, (uint64_t)"C", 0);

    v71 = objc_msgSend_schema(v5, v69, v70);
    v5->super.tokens.atom_atom_type = sub_1DD2FDA38(v71, v5->super.tokens.atom, (uint64_t)"Q", 0);

    v74 = objc_msgSend_schema(v5, v72, v73);
    v5->super.tokens.atom_value = sub_1DD2FDDE0(v74, (const char *)2, v5->super.tokens.atom);

    v77 = objc_msgSend_schema(v5, v75, v76);
    v80 = v77;
    if (v77)
    {
      uint64_t v81 = sub_1DD2FD560(v77, v78, v79);
      *(unsigned char *)(v80[4] + 2 * v81 + 1) = 1;
    }
    else
    {
      uint64_t v81 = 0;
    }
    v5->super.tokens.topLevelContainer = v81;

    v84 = objc_msgSend_schema(v5, v82, v83);
    v5->super.tokens.topLevelContainer_atoms = sub_1DD2FDCE4((uint64_t)v84, (const char *)v5->super.tokens.atom, v5->super.tokens.topLevelContainer);
  }
  return v5;
}

- (id)orcHelpers
{
  v3 = [CKXAtomORCSchema alloc];
  v5 = objc_msgSend_initWithBinding_formatVersion_(v3, v4, (uint64_t)self, 2);
  return v5;
}

@end