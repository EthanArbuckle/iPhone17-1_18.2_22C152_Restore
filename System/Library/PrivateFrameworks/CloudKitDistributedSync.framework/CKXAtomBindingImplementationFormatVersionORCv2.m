@interface CKXAtomBindingImplementationFormatVersionORCv2
- (CKXAtomBindingImplementationFormatVersionORCv2)init;
- (id)orcHelpers;
@end

@implementation CKXAtomBindingImplementationFormatVersionORCv2

- (CKXAtomBindingImplementationFormatVersionORCv2)init
{
  v76.receiver = self;
  v76.super_class = (Class)CKXAtomBindingImplementationFormatVersionORCv2;
  v2 = [(CKXAtomBindingImplementation *)&v76 init];
  v5 = v2;
  if (v2)
  {
    v6 = objc_msgSend_schema(v2, v3, v4);
    v5->super.tokens.location = sub_1DD2FD560(v6, v7, v8);

    v11 = objc_msgSend_schema(v5, v9, v10);
    v5->super.tokens.location_identifier = sub_1DD2FDDE0(v11, (const char *)2, v5->super.tokens.location);

    v14 = objc_msgSend_schema(v5, v12, v13);
    v5->super.tokens.siteIdentifier = sub_1DD2FD560(v14, v15, v16);

    v19 = objc_msgSend_schema(v5, v17, v18);
    v5->super.tokens.siteIdentifier_identifier = sub_1DD2FDDE0(v19, (const char *)2, v5->super.tokens.siteIdentifier);

    v22 = objc_msgSend_schema(v5, v20, v21);
    v5->super.tokens.siteIdentifier_modifier = sub_1DD2FDDE0(v22, (const char *)1, v5->super.tokens.siteIdentifier);

    v25 = objc_msgSend_schema(v5, v23, v24);
    v5->super.tokens.timestamp = sub_1DD2FD560(v25, v26, v27);

    v30 = objc_msgSend_schema(v5, v28, v29);
    v5->super.tokens.timestamp_siteIdentifier = sub_1DD2FDBC4((uint64_t)v30, (const char *)v5->super.tokens.siteIdentifier, v5->super.tokens.timestamp);

    v33 = objc_msgSend_schema(v5, v31, v32);
    v5->super.tokens.timestamp_clock = sub_1DD2FDA38(v33, v5->super.tokens.timestamp, (uint64_t)"Q", 0);

    v36 = objc_msgSend_schema(v5, v34, v35);
    v5->super.tokens.reference = sub_1DD2FD560(v36, v37, v38);

    v41 = objc_msgSend_schema(v5, v39, v40);
    v5->super.tokens.reference_timestamp = sub_1DD2FDBC4((uint64_t)v41, (const char *)v5->super.tokens.timestamp, v5->super.tokens.reference);

    v44 = objc_msgSend_schema(v5, v42, v43);
    v5->super.tokens.reference_location = sub_1DD2FDBC4((uint64_t)v44, (const char *)v5->super.tokens.location, v5->super.tokens.reference);

    v47 = objc_msgSend_schema(v5, v45, v46);
    v5->super.tokens.atom = sub_1DD2FD560(v47, v48, v49);

    v52 = objc_msgSend_schema(v5, v50, v51);
    v5->super.tokens.atom_version = sub_1DD2FDA38(v52, v5->super.tokens.atom, (uint64_t)"Q", 0);

    v55 = objc_msgSend_schema(v5, v53, v54);
    v5->super.tokens.atom_timestamp = sub_1DD2FDBC4((uint64_t)v55, (const char *)v5->super.tokens.timestamp, v5->super.tokens.atom);

    v58 = objc_msgSend_schema(v5, v56, v57);
    v5->super.tokens.atom_references = sub_1DD2FDCE4((uint64_t)v58, (const char *)v5->super.tokens.reference, v5->super.tokens.atom);

    v61 = objc_msgSend_schema(v5, v59, v60);
    v5->super.tokens.atom_atom_type = sub_1DD2FDA38(v61, v5->super.tokens.atom, (uint64_t)"Q", 0);

    v64 = objc_msgSend_schema(v5, v62, v63);
    v5->super.tokens.atom_value = sub_1DD2FDDE0(v64, (const char *)2, v5->super.tokens.atom);

    v67 = objc_msgSend_schema(v5, v65, v66);
    v70 = v67;
    if (v67)
    {
      uint64_t v71 = sub_1DD2FD560(v67, v68, v69);
      *(unsigned char *)(v70[4] + 2 * v71 + 1) = 1;
    }
    else
    {
      uint64_t v71 = 0;
    }
    v5->super.tokens.topLevelContainer = v71;

    v74 = objc_msgSend_schema(v5, v72, v73);
    v5->super.tokens.topLevelContainer_atoms = sub_1DD2FDCE4((uint64_t)v74, (const char *)v5->super.tokens.atom, v5->super.tokens.topLevelContainer);
  }
  return v5;
}

- (id)orcHelpers
{
  v3 = [CKXAtomORCSchema alloc];
  v5 = objc_msgSend_initWithBinding_formatVersion_(v3, v4, (uint64_t)self, 3);
  return v5;
}

@end