@interface CKMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)walrusEnabled;
- (CKMetric)initWithCoder:(id)a3;
- (CKMetric)initWithStartDate:(id)a3 duration:(double)a4 queueing:(double)a5 executing:(double)a6 bytesUploaded:(unint64_t)a7 bytesDownloaded:(unint64_t)a8 connections:(unint64_t)a9 connectionsCreated:(unint64_t)a10 bytesFulfilledByPeers:(unint64_t)a11 bytesFulfilledLocally:(unint64_t)a12 bytesResumed:(unint64_t)a13 totalBytesByChunkProfile:(id)a14 chunkCountByChunkProfile:(id)a15 fileCountByChunkProfile:(id)a16 walrusEnabled:(BOOL)a17 zoneishKeysRolled:(unint64_t)a18 perRecordKeysRolled:(unint64_t)a19 zoneKeysRolled:(unint64_t)a20 shareKeysRolled:(unint64_t)a21 keyRollsSkippedBySizeCheck:(unint64_t)a22 zoneKeysRemoved:(unint64_t)a23 zoneishKeysRemoved:(unint64_t)a24 recordKeysRemoved:(unint64_t)a25 keysNotRemoved:(unint64_t)a26;
- (NSDate)startDate;
- (NSDictionary)chunkCountByChunkProfile;
- (NSDictionary)fileCountByChunkProfile;
- (NSDictionary)totalBytesByChunkProfile;
- (double)duration;
- (double)executing;
- (double)queueing;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)bytesDownloaded;
- (unint64_t)bytesFulfilledByPeers;
- (unint64_t)bytesFulfilledLocally;
- (unint64_t)bytesResumed;
- (unint64_t)bytesUploaded;
- (unint64_t)connections;
- (unint64_t)connectionsCreated;
- (unint64_t)keyRollsSkippedBySizeCheck;
- (unint64_t)keysNotRemoved;
- (unint64_t)perRecordKeysRolled;
- (unint64_t)recordKeysRemoved;
- (unint64_t)shareKeysRolled;
- (unint64_t)zoneKeysRemoved;
- (unint64_t)zoneKeysRolled;
- (unint64_t)zoneishKeysRemoved;
- (unint64_t)zoneishKeysRolled;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKMetric

- (CKMetric)initWithStartDate:(id)a3 duration:(double)a4 queueing:(double)a5 executing:(double)a6 bytesUploaded:(unint64_t)a7 bytesDownloaded:(unint64_t)a8 connections:(unint64_t)a9 connectionsCreated:(unint64_t)a10 bytesFulfilledByPeers:(unint64_t)a11 bytesFulfilledLocally:(unint64_t)a12 bytesResumed:(unint64_t)a13 totalBytesByChunkProfile:(id)a14 chunkCountByChunkProfile:(id)a15 fileCountByChunkProfile:(id)a16 walrusEnabled:(BOOL)a17 zoneishKeysRolled:(unint64_t)a18 perRecordKeysRolled:(unint64_t)a19 zoneKeysRolled:(unint64_t)a20 shareKeysRolled:(unint64_t)a21 keyRollsSkippedBySizeCheck:(unint64_t)a22 zoneKeysRemoved:(unint64_t)a23 zoneishKeysRemoved:(unint64_t)a24 recordKeysRemoved:(unint64_t)a25 keysNotRemoved:(unint64_t)a26
{
  id v60 = a3;
  id v35 = a14;
  id v36 = a15;
  id v37 = a16;
  v61.receiver = self;
  v61.super_class = (Class)CKMetric;
  v41 = [(CKMetric *)&v61 init];
  if (v41)
  {
    uint64_t v42 = objc_msgSend_copy(v60, v38, v39, v40);
    startDate = v41->_startDate;
    v41->_startDate = (NSDate *)v42;

    v41->_duration = a4;
    v41->_queueing = a5;
    v41->_executing = a6;
    v41->_bytesUploaded = a7;
    v41->_bytesDownloaded = a8;
    v41->_connections = a9;
    v41->_connectionsCreated = a10;
    v41->_bytesFulfilledByPeers = a11;
    v41->_bytesFulfilledLocally = a12;
    v41->_bytesResumed = a13;
    uint64_t v47 = objc_msgSend_copy(v35, v44, v45, v46);
    totalBytesByChunkProfile = v41->_totalBytesByChunkProfile;
    v41->_totalBytesByChunkProfile = (NSDictionary *)v47;

    uint64_t v52 = objc_msgSend_copy(v36, v49, v50, v51);
    chunkCountByChunkProfile = v41->_chunkCountByChunkProfile;
    v41->_chunkCountByChunkProfile = (NSDictionary *)v52;

    uint64_t v57 = objc_msgSend_copy(v37, v54, v55, v56);
    fileCountByChunkProfile = v41->_fileCountByChunkProfile;
    v41->_fileCountByChunkProfile = (NSDictionary *)v57;

    v41->_walrusEnabled = a17;
    v41->_zoneishKeysRolled = a18;
    v41->_perRecordKeysRolled = a19;
    v41->_zoneKeysRolled = a20;
    v41->_shareKeysRolled = a21;
    v41->_keyRollsSkippedBySizeCheck = a22;
    v41->_zoneKeysRemoved = a23;
    v41->_zoneishKeysRemoved = a24;
    v41->_recordKeysRemoved = a25;
    v41->_keysNotRemoved = a26;
  }

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v124 = a3;
  v7 = objc_msgSend_startDate(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v124, v8, (uint64_t)v7, @"StartDate");

  objc_msgSend_duration(self, v9, v10, v11);
  objc_msgSend_encodeDouble_forKey_(v124, v12, @"Duration", v13);
  objc_msgSend_queueing(self, v14, v15, v16);
  objc_msgSend_encodeDouble_forKey_(v124, v17, @"Queuing", v18);
  objc_msgSend_executing(self, v19, v20, v21);
  objc_msgSend_encodeDouble_forKey_(v124, v22, @"Executing", v23);
  uint64_t v27 = objc_msgSend_bytesUploaded(self, v24, v25, v26);
  objc_msgSend_encodeInteger_forKey_(v124, v28, v27, @"BytesUploaded");
  uint64_t v32 = objc_msgSend_bytesDownloaded(self, v29, v30, v31);
  objc_msgSend_encodeInteger_forKey_(v124, v33, v32, @"BytesDownloaded");
  uint64_t v37 = objc_msgSend_connections(self, v34, v35, v36);
  objc_msgSend_encodeInteger_forKey_(v124, v38, v37, @"Connections");
  uint64_t v42 = objc_msgSend_connectionsCreated(self, v39, v40, v41);
  objc_msgSend_encodeInteger_forKey_(v124, v43, v42, @"ConnectionsCreated");
  uint64_t v47 = objc_msgSend_bytesFulfilledByPeers(self, v44, v45, v46);
  objc_msgSend_encodeInt64_forKey_(v124, v48, v47, @"BytesFulfilledByPeers");
  uint64_t v52 = objc_msgSend_bytesFulfilledLocally(self, v49, v50, v51);
  objc_msgSend_encodeInt64_forKey_(v124, v53, v52, @"BytesFulfilledLocally");
  uint64_t v57 = objc_msgSend_bytesResumed(self, v54, v55, v56);
  objc_msgSend_encodeInt64_forKey_(v124, v58, v57, @"BytesResumed");
  v62 = objc_msgSend_totalBytesByChunkProfile(self, v59, v60, v61);
  objc_msgSend_encodeObject_forKey_(v124, v63, (uint64_t)v62, @"TotalBytesByChunkProfile");

  v67 = objc_msgSend_chunkCountByChunkProfile(self, v64, v65, v66);
  objc_msgSend_encodeObject_forKey_(v124, v68, (uint64_t)v67, @"ChunkCountByChunkProfile");

  v72 = objc_msgSend_fileCountByChunkProfile(self, v69, v70, v71);
  objc_msgSend_encodeObject_forKey_(v124, v73, (uint64_t)v72, @"FileCountByChunkProfile");

  uint64_t v77 = objc_msgSend_zoneishKeysRolled(self, v74, v75, v76);
  objc_msgSend_encodeInt64_forKey_(v124, v78, v77, @"ZoneishKeysRolled");
  uint64_t v82 = objc_msgSend_perRecordKeysRolled(self, v79, v80, v81);
  objc_msgSend_encodeInt64_forKey_(v124, v83, v82, @"PerRecordKeysRolled");
  uint64_t v87 = objc_msgSend_zoneKeysRolled(self, v84, v85, v86);
  objc_msgSend_encodeInt64_forKey_(v124, v88, v87, @"ZoneKeysRolled");
  uint64_t v92 = objc_msgSend_shareKeysRolled(self, v89, v90, v91);
  objc_msgSend_encodeInt64_forKey_(v124, v93, v92, @"ShareKeysRolled");
  uint64_t v97 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v94, v95, v96);
  objc_msgSend_encodeInt64_forKey_(v124, v98, v97, @"KeyRollsSkippedBySizeCheck");
  uint64_t v102 = objc_msgSend_zoneKeysRemoved(self, v99, v100, v101);
  objc_msgSend_encodeInt64_forKey_(v124, v103, v102, @"ZoneKeysRemoved");
  uint64_t v107 = objc_msgSend_zoneishKeysRemoved(self, v104, v105, v106);
  objc_msgSend_encodeInt64_forKey_(v124, v108, v107, @"ZoneishKeysRemoved");
  uint64_t v112 = objc_msgSend_recordKeysRemoved(self, v109, v110, v111);
  objc_msgSend_encodeInt64_forKey_(v124, v113, v112, @"RecordKeysRemoved");
  uint64_t v117 = objc_msgSend_keysNotRemoved(self, v114, v115, v116);
  objc_msgSend_encodeInt64_forKey_(v124, v118, v117, @"KeysNotRemoved");
  uint64_t v122 = objc_msgSend_walrusEnabled(self, v119, v120, v121);
  objc_msgSend_encodeBool_forKey_(v124, v123, v122, @"WalrusEnabled");
}

- (CKMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)CKMetric;
  uint64_t v5 = [(CKMetric *)&v96 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"StartDate");
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend_decodeDoubleForKey_(v4, v10, @"Duration", v11);
    v5->_duration = v12;
    objc_msgSend_decodeDoubleForKey_(v4, v13, @"Queuing", v14);
    v5->_queueing = v15;
    objc_msgSend_decodeDoubleForKey_(v4, v16, @"Executing", v17);
    v5->_executing = v18;
    v5->_bytesUploaded = objc_msgSend_decodeIntegerForKey_(v4, v19, @"BytesUploaded", v20);
    v5->_bytesDownloaded = objc_msgSend_decodeIntegerForKey_(v4, v21, @"BytesDownloaded", v22);
    v5->_connections = objc_msgSend_decodeIntegerForKey_(v4, v23, @"Connections", v24);
    v5->_connectionsCreated = objc_msgSend_decodeIntegerForKey_(v4, v25, @"ConnectionsCreated", v26);
    v5->_bytesFulfilledByPeers = objc_msgSend_decodeInt64ForKey_(v4, v27, @"BytesFulfilledByPeers", v28);
    v5->_bytesFulfilledLocally = objc_msgSend_decodeInt64ForKey_(v4, v29, @"BytesFulfilledLocally", v30);
    v5->_bytesResumed = objc_msgSend_decodeInt64ForKey_(v4, v31, @"BytesResumed", v32);
    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v39 = objc_msgSend_setWithObjects_(v33, v37, v34, v38, v35, v36, 0);
    uint64_t v41 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v39, @"TotalBytesByChunkProfile");
    uint64_t v45 = objc_msgSend_mutableCopy(v41, v42, v43, v44);
    totalBytesByChunkProfile = v5->_totalBytesByChunkProfile;
    v5->_totalBytesByChunkProfile = (NSDictionary *)v45;

    uint64_t v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    v53 = objc_msgSend_setWithObjects_(v47, v51, v48, v52, v49, v50, 0);
    uint64_t v55 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v53, @"ChunkCountByChunkProfile");
    uint64_t v59 = objc_msgSend_mutableCopy(v55, v56, v57, v58);
    chunkCountByChunkProfile = v5->_chunkCountByChunkProfile;
    v5->_chunkCountByChunkProfile = (NSDictionary *)v59;

    uint64_t v61 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    v67 = objc_msgSend_setWithObjects_(v61, v65, v62, v66, v63, v64, 0);
    v69 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v67, @"FileCountByChunkProfile");
    uint64_t v73 = objc_msgSend_mutableCopy(v69, v70, v71, v72);
    fileCountByChunkProfile = v5->_fileCountByChunkProfile;
    v5->_fileCountByChunkProfile = (NSDictionary *)v73;

    v5->_zoneishKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v75, @"ZoneishKeysRolled", v76);
    v5->_perRecordKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v77, @"PerRecordKeysRolled", v78);
    v5->_zoneKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v79, @"ZoneKeysRolled", v80);
    v5->_shareKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v81, @"ShareKeysRolled", v82);
    v5->_keyRollsSkippedBySizeCheck = objc_msgSend_decodeInt64ForKey_(v4, v83, @"KeyRollsSkippedBySizeCheck", v84);
    v5->_zoneKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v85, @"ZoneKeysRemoved", v86);
    v5->_zoneishKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v87, @"ZoneishKeysRemoved", v88);
    v5->_recordKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v89, @"RecordKeysRemoved", v90);
    v5->_keysNotRemoved = objc_msgSend_decodeInt64ForKey_(v4, v91, @"KeysNotRemoved", v92);
    v5->_walrusEnabled = objc_msgSend_decodeBoolForKey_(v4, v93, @"WalrusEnabled", v94);
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  uint64_t v56 = NSString;
  uint64_t v55 = objc_msgSend_startDate(self, a2, v2, v3);
  objc_msgSend_duration(self, v5, v6, v7);
  uint64_t v9 = v8;
  objc_msgSend_queueing(self, v10, v11, v12);
  uint64_t v14 = v13;
  objc_msgSend_executing(self, v15, v16, v17);
  uint64_t v19 = v18;
  uint64_t v23 = objc_msgSend_bytesUploaded(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_bytesDownloaded(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_connections(self, v28, v29, v30);
  uint64_t v35 = objc_msgSend_connectionsCreated(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_totalBytesByChunkProfile(self, v36, v37, v38);
  uint64_t v40 = sub_18B1056FC(self, v39);
  uint64_t v44 = objc_msgSend_chunkCountByChunkProfile(self, v41, v42, v43);
  uint64_t v45 = sub_18B1056FC(self, v44);
  uint64_t v49 = objc_msgSend_fileCountByChunkProfile(self, v46, v47, v48);
  uint64_t v50 = sub_18B1056FC(self, v49);
  v53 = objc_msgSend_stringWithFormat_(v56, v51, @"startDate=%@, duration=%0.3f, queueing=%0.3f, executing=%0.3f, bytesUploaded=%lu, bytesDownloaded=%lu, connections=%lu, connectionsCreated=%lu, totalBytesByChunkProfile=%@, chunkCountByChunkProfile=%@, fileCountByChunkProfile=%@", v52, v55, v9, v14, v19, v23, v27, v31, v35, v40, v45, v50);

  return v53;
}

- (id)description
{
  return (id)((uint64_t (*)(CKMetric *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)duration
{
  return self->_duration;
}

- (double)queueing
{
  return self->_queueing;
}

- (double)executing
{
  return self->_executing;
}

- (unint64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (unint64_t)connections
{
  return self->_connections;
}

- (unint64_t)connectionsCreated
{
  return self->_connectionsCreated;
}

- (unint64_t)bytesFulfilledByPeers
{
  return self->_bytesFulfilledByPeers;
}

- (unint64_t)bytesFulfilledLocally
{
  return self->_bytesFulfilledLocally;
}

- (unint64_t)bytesResumed
{
  return self->_bytesResumed;
}

- (NSDictionary)totalBytesByChunkProfile
{
  return self->_totalBytesByChunkProfile;
}

- (NSDictionary)chunkCountByChunkProfile
{
  return self->_chunkCountByChunkProfile;
}

- (NSDictionary)fileCountByChunkProfile
{
  return self->_fileCountByChunkProfile;
}

- (BOOL)walrusEnabled
{
  return self->_walrusEnabled;
}

- (unint64_t)zoneishKeysRolled
{
  return self->_zoneishKeysRolled;
}

- (unint64_t)perRecordKeysRolled
{
  return self->_perRecordKeysRolled;
}

- (unint64_t)zoneKeysRolled
{
  return self->_zoneKeysRolled;
}

- (unint64_t)shareKeysRolled
{
  return self->_shareKeysRolled;
}

- (unint64_t)keyRollsSkippedBySizeCheck
{
  return self->_keyRollsSkippedBySizeCheck;
}

- (unint64_t)zoneKeysRemoved
{
  return self->_zoneKeysRemoved;
}

- (unint64_t)zoneishKeysRemoved
{
  return self->_zoneishKeysRemoved;
}

- (unint64_t)recordKeysRemoved
{
  return self->_recordKeysRemoved;
}

- (unint64_t)keysNotRemoved
{
  return self->_keysNotRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end