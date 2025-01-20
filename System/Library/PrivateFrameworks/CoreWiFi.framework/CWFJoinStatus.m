@interface CWFJoinStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutoJoin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToJoinStatus:(id)a3;
- (CWFJoinStatus)init;
- (CWFJoinStatus)initWithCoder:(id)a3;
- (CWFNetworkProfile)knownNetworkProfile;
- (CWFScanResult)scanResult;
- (NSDate)IPv4AssignedAt;
- (NSDate)IPv4PrimaryAt;
- (NSDate)IPv6AssignedAt;
- (NSDate)IPv6PrimaryAt;
- (NSDate)associationEndedAt;
- (NSDate)authenticationEndedAt;
- (NSDate)endedAt;
- (NSDate)linkUpAt;
- (NSDate)startedAt;
- (NSError)error;
- (NSString)description;
- (NSString)interfaceName;
- (NSUUID)UUID;
- (double)duration;
- (double)durationUntilAssociationEnded;
- (double)durationUntilAuthenticationEnded;
- (double)durationUntilIPv4Assigned;
- (double)durationUntilIPv4Primary;
- (double)durationUntilIPv6Assigned;
- (double)durationUntilIPv6Primary;
- (double)durationUntilLinkUp;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionForEAP8021XControlState;
- (id)descriptionForEAPOLClientStatus;
- (id)descriptionForEAPOLControlMode;
- (int)EAP8021XClientStatus;
- (unint64_t)hash;
- (unsigned)EAP8021XControlMode;
- (unsigned)EAP8021XControlState;
- (unsigned)EAP8021XSupplicantState;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociationEndedAt:(id)a3;
- (void)setAuthenticationEndedAt:(id)a3;
- (void)setAutoJoin:(BOOL)a3;
- (void)setEAP8021XClientStatus:(int)a3;
- (void)setEAP8021XControlMode:(unsigned int)a3;
- (void)setEAP8021XControlState:(unsigned int)a3;
- (void)setEAP8021XSupplicantState:(unsigned int)a3;
- (void)setEndedAt:(id)a3;
- (void)setError:(id)a3;
- (void)setIPv4AssignedAt:(id)a3;
- (void)setIPv4PrimaryAt:(id)a3;
- (void)setIPv6AssignedAt:(id)a3;
- (void)setIPv6PrimaryAt:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setKnownNetworkProfile:(id)a3;
- (void)setLinkUpAt:(id)a3;
- (void)setScanResult:(id)a3;
- (void)setStartedAt:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFJoinStatus

- (CWFJoinStatus)init
{
  v10.receiver = self;
  v10.super_class = (Class)CWFJoinStatus;
  v6 = [(CWFJoinStatus *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }
  return v6;
}

- (double)duration
{
  objc_super v10 = objc_msgSend_endedAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_endedAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_endedAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilAssociationEnded
{
  objc_super v10 = objc_msgSend_associationEndedAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_associationEndedAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_associationEndedAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilAuthenticationEnded
{
  objc_super v10 = objc_msgSend_authenticationEndedAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_authenticationEndedAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_authenticationEndedAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv4Assigned
{
  objc_super v10 = objc_msgSend_IPv4AssignedAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_IPv4AssignedAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_IPv4AssignedAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv6Assigned
{
  objc_super v10 = objc_msgSend_IPv6AssignedAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_IPv6AssignedAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_IPv6AssignedAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv4Primary
{
  objc_super v10 = objc_msgSend_IPv4PrimaryAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_IPv4PrimaryAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_IPv4PrimaryAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilIPv6Primary
{
  objc_super v10 = objc_msgSend_IPv6PrimaryAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_IPv6PrimaryAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_IPv6PrimaryAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (double)durationUntilLinkUp
{
  objc_super v10 = objc_msgSend_linkUpAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_linkUpAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_linkUpAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (NSString)description
{
  v6 = objc_msgSend_SSID(self->_scanResult, a2, v2, v3, v4);
  uint64_t v15 = objc_msgSend_networkName(self->_scanResult, v7, v8, v9, v10);
  if (!v6)
  {
    v6 = objc_msgSend_SSID(self->_knownNetworkProfile, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_networkName(self->_knownNetworkProfile, v16, v17, v18, v19);

    uint64_t v15 = (void *)v20;
  }
  v100 = v6;
  v105 = v15;
  v114 = NSString;
  v117 = objc_msgSend_UUIDString(self->_UUID, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_substringToIndex_(v117, v21, 5, v22, v23);
  interfaceName = self->_interfaceName;
  v113 = (void *)v24;
  v111 = objc_msgSend_redactedForWiFi(v15, v25, v26, v27, v28);
  v116 = CWFHexadecimalStringFromData(v6, v29, v30, v31, v32);
  v110 = objc_msgSend_redactedForWiFi(v116, v33, v34, v35, v36);
  uint64_t v109 = objc_msgSend_code(self->_error, v37, v38, v39, v40);
  uint64_t EAP8021XSupplicantState = self->_EAP8021XSupplicantState;
  uint64_t EAP8021XControlMode = self->_EAP8021XControlMode;
  uint64_t EAP8021XControlState = self->_EAP8021XControlState;
  uint64_t EAP8021XClientStatus = self->_EAP8021XClientStatus;
  v103 = sub_1B4F3D76C(self->_startedAt);
  v102 = sub_1B4F3D76C(self->_associationEndedAt);
  objc_msgSend_durationUntilAssociationEnded(self, v41, v42, v43, v44);
  unint64_t v101 = (unint64_t)(v45 * 1000.0);
  v46 = sub_1B4F3D76C(self->_authenticationEndedAt);
  objc_msgSend_durationUntilAuthenticationEnded(self, v47, v48, v49, v50);
  unint64_t v99 = (unint64_t)(v51 * 1000.0);
  v98 = sub_1B4F3D76C(self->_linkUpAt);
  objc_msgSend_durationUntilLinkUp(self, v52, v53, v54, v55);
  unint64_t v97 = (unint64_t)(v56 * 1000.0);
  v57 = sub_1B4F3D76C(self->_endedAt);
  objc_msgSend_duration(self, v58, v59, v60, v61);
  unint64_t v96 = (unint64_t)(v62 * 1000.0);
  v63 = sub_1B4F3D76C(self->_IPv4AssignedAt);
  objc_msgSend_durationUntilIPv4Assigned(self, v64, v65, v66, v67);
  unint64_t v69 = (unint64_t)(v68 * 1000.0);
  v70 = sub_1B4F3D76C(self->_IPv4PrimaryAt);
  objc_msgSend_durationUntilIPv4Primary(self, v71, v72, v73, v74);
  unint64_t v76 = (unint64_t)(v75 * 1000.0);
  v77 = sub_1B4F3D76C(self->_IPv6AssignedAt);
  objc_msgSend_durationUntilIPv6Assigned(self, v78, v79, v80, v81);
  unint64_t v83 = (unint64_t)(v82 * 1000.0);
  v84 = sub_1B4F3D76C(self->_IPv6PrimaryAt);
  objc_msgSend_durationUntilIPv6Primary(self, v85, v86, v87, v88);
  double v93 = v92 * 1000.0;
  if (self->_autoJoin) {
    v94 = "yes";
  }
  else {
    v94 = "no";
  }
  objc_msgSend_stringWithFormat_(v114, v89, @"uuid=%@, intf=%@, ssid='%@' (%@), error=%ld, eap=[sup=%d mode=%d state=%d client=%d], start=%@, assoc=%@ (%lums), auth=%@ (%lums), linkup=%@ (%lums), end=%@ (%lums), ipv4=%@ (%lums), ipv4Primary=%@ (%lums), ipv6=%@ (%lums), ipv6Primary=%@ (%lums), auto=%s", v90, v91, v113, interfaceName, v111, v110, v109, EAP8021XSupplicantState, EAP8021XControlMode, EAP8021XControlState, EAP8021XClientStatus, v103, v102, v101, v46, v99,
    v98,
    v97,
    v57,
    v96,
    v63,
    v69,
    v70,
    v76,
    v77,
    v83,
    v84,
    (unint64_t)v93,
  v115 = v94);

  return (NSString *)v115;
}

- (BOOL)isEqualToJoinStatus:(id)a3
{
  id v4 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v4, v6, v7, v8, v9);
  uint64_t v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = UUID != v10;
  v346 = v10;
  if (UUID != v10)
  {
    uint64_t v17 = self->_UUID;
    if (!v17)
    {
      *(void *)v345 = 0;
      LODWORD(v27) = 0;
      int v28 = 0;
      memset(v347, 0, 52);
      LODWORD(v29) = 0;
      int v30 = 0;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      v345[8] = 0;
      goto LABEL_116;
    }
    uint64_t v18 = objc_msgSend_UUID(v4, v11, v12, v13, v14);
    if (!v18)
    {
      v334 = 0;
      *(void *)v345 = 0;
      LODWORD(v27) = 0;
      int v28 = 0;
      LODWORD(v29) = 0;
      memset(v347, 0, 20);
      int v30 = 0;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset((char *)&v347[3] + 4, 0, 24);
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      v345[8] = 0;
      *(void *)((char *)&v347[2] + 4) = 1;
      goto LABEL_116;
    }
    v334 = (void *)v18;
    uint64_t v23 = self->_UUID;
    v332 = objc_msgSend_UUID(v4, v19, v20, v21, v22);
    if (!objc_msgSend_isEqual_(v23, v24, (uint64_t)v332, v25, v26))
    {
      *(_DWORD *)&v345[4] = 0;
      LODWORD(v27) = 0;
      int v28 = 0;
      LODWORD(v29) = 0;
      memset(v347, 0, 20);
      int v30 = 0;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      v345[8] = 0;
      HIDWORD(v347[2]) = 1;
      memset(&v347[3], 0, 28);
      int v37 = 1;
LABEL_19:
      *(_DWORD *)v345 = v37;
      goto LABEL_116;
    }
  }
  interfaceName = self->_interfaceName;
  uint64_t v39 = objc_msgSend_interfaceName(v4, v11, v12, v13, v14);
  BOOL v27 = interfaceName != (NSString *)v39;
  HIDWORD(v347[2]) = v16;
  v335 = (void *)v39;
  if (interfaceName != (NSString *)v39)
  {
    uint64_t v17 = self->_interfaceName;
    if (!v17)
    {
      LODWORD(v27) = 0;
      LODWORD(v29) = 0;
      memset(v347, 0, 20);
      int v37 = v16;
      int v28 = 0;
      int v30 = 0;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      uint64_t v15 = 1;
      *(void *)&v345[4] = 1;
      goto LABEL_19;
    }
    uint64_t v44 = objc_msgSend_interfaceName(v4, v40, v41, v42, v43);
    if (!v44)
    {
      v331 = 0;
      LODWORD(v27) = 0;
      v347[1] = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      BOOL v86 = v16;
      int v28 = 0;
      int v30 = 0;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      uint64_t v15 = 1;
      *(void *)&v345[4] = 1;
      *(_DWORD *)v345 = v86;
      LODWORD(v347[2]) = 1;
      goto LABEL_116;
    }
    v331 = (void *)v44;
    uint64_t v49 = self->_interfaceName;
    v329 = objc_msgSend_interfaceName(v4, v45, v46, v47, v48);
    if (!objc_msgSend_isEqual_(v49, v50, (uint64_t)v329, v51, v52))
    {
      v347[1] = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      BOOL v53 = v16;
      int v28 = 0;
      int v30 = 0;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      uint64_t v15 = 1;
      *(void *)&v345[4] = 1;
      *(_DWORD *)v345 = v53;
      LODWORD(v347[2]) = 1;
      LODWORD(v27) = 1;
      goto LABEL_116;
    }
  }
  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v4, v40, v41, v42, v43);
  v333 = (NSDate *)objc_claimAutoreleasedReturnValue();
  BOOL v59 = startedAt != v333;
  LODWORD(v347[2]) = v27;
  if (startedAt != v333)
  {
    uint64_t v17 = self->_startedAt;
    if (!v17)
    {
      v347[1] = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      int v30 = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      goto LABEL_116;
    }
    uint64_t v60 = objc_msgSend_startedAt(v4, v55, v56, v57, v58);
    if (!v60)
    {
      v328 = 0;
      *(void *)((char *)v347 + 4) = 0;
      LODWORD(v29) = 0;
      LODWORD(v347[0]) = 0;
      int v30 = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      memset(v344, 0, sizeof(v344));
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      HIDWORD(v347[1]) = 1;
      goto LABEL_116;
    }
    v328 = (void *)v60;
    uint64_t v65 = self->_startedAt;
    v327 = objc_msgSend_startedAt(v4, v61, v62, v63, v64);
    if (!objc_msgSend_isEqual_(v65, v66, (uint64_t)v327, v67, v68))
    {
      *(void *)((char *)v347 + 4) = 0;
      LODWORD(v29) = 0;
      LODWORD(v347[0]) = 0;
      memset(v344, 0, 32);
      int v30 = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      uint64_t v342 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      HIDWORD(v347[1]) = 1;
      *(_DWORD *)&v344[32] = 1;
      goto LABEL_116;
    }
  }
  endedAt = self->_endedAt;
  uint64_t v70 = objc_msgSend_endedAt(v4, v55, v56, v57, v58);
  BOOL v75 = endedAt != (NSDate *)v70;
  HIDWORD(v347[1]) = v59;
  v330 = (void *)v70;
  if (endedAt != (NSDate *)v70)
  {
    uint64_t v17 = self->_endedAt;
    if (!v17)
    {
      *(void *)((char *)v347 + 4) = 0;
      LODWORD(v29) = 0;
      LODWORD(v347[0]) = 0;
      int v30 = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v104 = v59;
      uint64_t v342 = 0;
      memset(v344, 0, 28);
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v104;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[28] = 1;
      goto LABEL_116;
    }
    uint64_t v76 = objc_msgSend_endedAt(v4, v71, v72, v73, v74);
    if (!v76)
    {
      v340 = 0;
      v347[0] = 0;
      LODWORD(v29) = 0;
      int v30 = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v123 = v59;
      uint64_t v342 = 0;
      memset(v344, 0, 28);
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v123;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[28] = 1;
      LODWORD(v347[1]) = 1;
      goto LABEL_116;
    }
    v340 = (void *)v76;
    uint64_t v81 = self->_endedAt;
    v326 = objc_msgSend_endedAt(v4, v77, v78, v79, v80);
    if (!objc_msgSend_isEqual_(v81, v82, (uint64_t)v326, v83, v84))
    {
      v347[0] = 0;
      LODWORD(v29) = 0;
      int v30 = 0;
      uint64_t v15 = v27;
      memset(v344, 0, 24);
      BOOL v85 = v59;
      uint64_t v342 = 0;
      long long v343 = 0uLL;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v85;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[28] = 1;
      LODWORD(v347[1]) = 1;
      *(_DWORD *)&v344[24] = 1;
      goto LABEL_116;
    }
  }
  associationEndedAt = self->_associationEndedAt;
  uint64_t v88 = objc_msgSend_associationEndedAt(v4, v71, v72, v73, v74);
  BOOL v29 = associationEndedAt != (NSDate *)v88;
  LODWORD(v347[1]) = v75;
  v341 = (void *)v88;
  if (associationEndedAt != (NSDate *)v88)
  {
    uint64_t v17 = self->_associationEndedAt;
    if (!v17)
    {
      v347[0] = 0;
      LODWORD(v29) = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v124 = v59;
      BOOL v125 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      memset(v344, 0, 20);
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v124;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v125;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      goto LABEL_116;
    }
    uint64_t v93 = objc_msgSend_associationEndedAt(v4, v89, v90, v91, v92);
    if (!v93)
    {
      v338 = 0;
      LODWORD(v29) = 0;
      v347[0] = 0x100000000;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v141 = v59;
      BOOL v142 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      memset(v344, 0, 20);
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v141;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v142;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      goto LABEL_116;
    }
    v338 = (void *)v93;
    v98 = self->_associationEndedAt;
    v324 = objc_msgSend_associationEndedAt(v4, v94, v95, v96, v97);
    if (!objc_msgSend_isEqual_(v98, v99, (uint64_t)v324, v100, v101))
    {
      v347[0] = 0x100000000;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v102 = v59;
      BOOL v103 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      memset(v344, 0, 20);
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v102;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v103;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      LODWORD(v29) = 1;
      goto LABEL_116;
    }
  }
  authenticationEndedAt = self->_authenticationEndedAt;
  uint64_t v106 = objc_msgSend_authenticationEndedAt(v4, v89, v90, v91, v92);
  BOOL v111 = authenticationEndedAt != (NSDate *)v106;
  HIDWORD(v347[0]) = v29;
  v339 = (void *)v106;
  if (authenticationEndedAt != (NSDate *)v106)
  {
    uint64_t v17 = self->_authenticationEndedAt;
    if (!v17)
    {
      LODWORD(v347[0]) = 0;
      *(void *)v344 = 0;
      *(void *)&v344[8] = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v143 = v59;
      BOOL v144 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v143;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v144;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[16] = 1;
      goto LABEL_116;
    }
    uint64_t v112 = objc_msgSend_authenticationEndedAt(v4, v107, v108, v109, v110);
    if (!v112)
    {
      v323 = 0;
      *(void *)v344 = 0;
      *(void *)&v344[8] = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v161 = v59;
      BOOL v162 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v161;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v162;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      LODWORD(v347[0]) = 1;
      goto LABEL_116;
    }
    v323 = (void *)v112;
    v117 = self->_authenticationEndedAt;
    v321 = objc_msgSend_authenticationEndedAt(v4, v113, v114, v115, v116);
    if (!objc_msgSend_isEqual_(v117, v118, (uint64_t)v321, v119, v120))
    {
      *(void *)&v344[4] = 0;
      uint64_t v15 = v27;
      long long v343 = 0uLL;
      BOOL v121 = v59;
      BOOL v122 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      *(_DWORD *)v344 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v121;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v122;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      LODWORD(v347[0]) = 1;
      *(_DWORD *)&v344[12] = 1;
      goto LABEL_116;
    }
  }
  linkUpAt = self->_linkUpAt;
  objc_msgSend_linkUpAt(v4, v107, v108, v109, v110);
  v325 = (NSDate *)objc_claimAutoreleasedReturnValue();
  LODWORD(v347[6]) = linkUpAt != v325;
  LODWORD(v347[0]) = v111;
  if (linkUpAt != v325)
  {
    uint64_t v17 = self->_linkUpAt;
    if (!v17)
    {
      uint64_t v15 = v27;
      *(void *)v344 = 0;
      BOOL v163 = v59;
      BOOL v164 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      long long v343 = 0uLL;
      BOOL v165 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 28);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v163;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v164;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v165;
      goto LABEL_116;
    }
    uint64_t v131 = objc_msgSend_linkUpAt(v4, v127, v128, v129, v130);
    if (!v131)
    {
      v320 = 0;
      uint64_t v15 = v27;
      *(void *)v344 = 0;
      BOOL v182 = v59;
      BOOL v183 = v75;
      int v30 = 0;
      uint64_t v342 = 0;
      long long v343 = 0uLL;
      memset(&v347[3], 0, 24);
      BOOL v184 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v182;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v183;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v184;
      LODWORD(v347[6]) = 1;
      goto LABEL_116;
    }
    v320 = (void *)v131;
    v136 = self->_linkUpAt;
    v318 = objc_msgSend_linkUpAt(v4, v132, v133, v134, v135);
    if (!objc_msgSend_isEqual_(v136, v137, (uint64_t)v318, v138, v139))
    {
      *(void *)v344 = 0;
      uint64_t v15 = v59;
      uint64_t v342 = 0;
      long long v343 = 0uLL;
      memset(&v347[3], 0, 24);
      BOOL v140 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v15;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v140;
      LODWORD(v347[6]) = 1;
      int v30 = 1;
      goto LABEL_116;
    }
  }
  IPv4AssignedAt = self->_IPv4AssignedAt;
  objc_msgSend_IPv4AssignedAt(v4, v127, v128, v129, v130);
  v322 = (NSDate *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v347[5]) = IPv4AssignedAt != v322;
  if (IPv4AssignedAt != v322)
  {
    uint64_t v17 = self->_IPv4AssignedAt;
    if (!v17)
    {
      long long v343 = 0uLL;
      BOOL v185 = v59;
      uint64_t v15 = v75;
      uint64_t v342 = 0;
      memset(&v347[3], 0, 24);
      BOOL v186 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v185;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v186;
      int v30 = v347[6];
      *(void *)v344 = 0x100000000;
      goto LABEL_116;
    }
    uint64_t v150 = objc_msgSend_IPv4AssignedAt(v4, v146, v147, v148, v149);
    if (!v150)
    {
      v317 = 0;
      long long v343 = 0uLL;
      BOOL v204 = v59;
      uint64_t v15 = v75;
      uint64_t v342 = 0;
      BOOL v205 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 20);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v204;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v205;
      int v30 = v347[6];
      *(void *)v344 = 0x100000000;
      HIDWORD(v347[5]) = 1;
      goto LABEL_116;
    }
    v317 = (void *)v150;
    v155 = self->_IPv4AssignedAt;
    v315 = objc_msgSend_IPv4AssignedAt(v4, v151, v152, v153, v154);
    if (!objc_msgSend_isEqual_(v155, v156, (uint64_t)v315, v157, v158))
    {
      BOOL v159 = v59;
      *(void *)((char *)&v343 + 4) = 0;
      uint64_t v15 = v75;
      uint64_t v342 = 0;
      LODWORD(v343) = 0;
      BOOL v160 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 20);
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v159;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v160;
      int v30 = v347[6];
      *(void *)v344 = 0x100000000;
      HIDWORD(v347[5]) = 1;
      HIDWORD(v343) = 1;
      goto LABEL_116;
    }
  }
  IPv6AssignedAt = self->_IPv6AssignedAt;
  objc_msgSend_IPv6AssignedAt(v4, v146, v147, v148, v149);
  v319 = (NSDate *)objc_claimAutoreleasedReturnValue();
  int v171 = IPv6AssignedAt != v319;
  if (IPv6AssignedAt != v319)
  {
    uint64_t v17 = self->_IPv6AssignedAt;
    if (!v17)
    {
      uint64_t v342 = 0;
      *(void *)&long long v343 = 0;
      uint64_t v15 = v29;
      BOOL v206 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      memset(&v347[3], 0, 20);
      int v35 = 0;
      int v36 = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v206;
      *(void *)v344 = 0x100000000;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      goto LABEL_116;
    }
    uint64_t v172 = objc_msgSend_IPv6AssignedAt(v4, v167, v168, v169, v170);
    if (!v172)
    {
      v314 = 0;
      uint64_t v342 = 0;
      *(void *)&long long v343 = 0;
      v347[4] = 0;
      uint64_t v15 = v29;
      v347[3] = 0;
      BOOL v222 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v222;
      *(void *)v344 = 0x100000000;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v347[5]) = 1;
      goto LABEL_116;
    }
    v314 = (void *)v172;
    BOOL v177 = IPv6AssignedAt != v319;
    v178 = self->_IPv6AssignedAt;
    v312 = objc_msgSend_IPv6AssignedAt(v4, v173, v174, v175, v176);
    if (!objc_msgSend_isEqual_(v178, v179, (uint64_t)v312, v180, v181))
    {
      uint64_t v342 = 0x100000000;
      v347[4] = 0;
      *(void *)&long long v343 = 0;
      v347[3] = 0;
      uint64_t v15 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(void *)v344 = 0x100000000;
      int v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v347[5]) = 1;
      goto LABEL_116;
    }
    int v171 = v177;
  }
  IPv4PrimaryAt = self->_IPv4PrimaryAt;
  uint64_t v188 = objc_msgSend_IPv4PrimaryAt(v4, v167, v168, v169, v170);
  BOOL v193 = IPv4PrimaryAt == (NSDate *)v188;
  BOOL v194 = IPv4PrimaryAt != (NSDate *)v188;
  LODWORD(v347[5]) = v171;
  v316 = (void *)v188;
  if (v193)
  {
    HIDWORD(v347[4]) = v194;
  }
  else
  {
    uint64_t v17 = self->_IPv4PrimaryAt;
    if (!v17)
    {
      v347[4] = 0;
      *(void *)&long long v343 = 0;
      v347[3] = 0;
      uint64_t v15 = v111;
      int v31 = 0;
      int v32 = 0;
      int v35 = 0;
      int v36 = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(void *)v344 = 0x100000000;
      int v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      HIDWORD(v342) = v171;
      int v33 = 0;
      LODWORD(v342) = 1;
      goto LABEL_116;
    }
    uint64_t v195 = objc_msgSend_IPv4PrimaryAt(v4, v189, v190, v191, v192);
    if (!v195)
    {
      v311 = 0;
      *(void *)&long long v343 = 0;
      *(void *)((char *)&v347[3] + 4) = 0;
      uint64_t v15 = v111;
      int v31 = 0;
      int v32 = 0;
      LODWORD(v347[3]) = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(void *)v344 = 0x100000000;
      int v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      int v33 = 0;
      HIDWORD(v347[4]) = 1;
      goto LABEL_116;
    }
    v311 = (void *)v195;
    v200 = self->_IPv4PrimaryAt;
    v309 = objc_msgSend_IPv4PrimaryAt(v4, v196, v197, v198, v199);
    if (!objc_msgSend_isEqual_(v200, v201, (uint64_t)v309, v202, v203))
    {
      *(void *)((char *)&v343 + 4) = 0x100000000;
      *(void *)((char *)&v347[3] + 4) = 0;
      uint64_t v15 = v111;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      LODWORD(v347[3]) = 0;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v15;
      *(void *)v344 = 0x100000000;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v347[5];
      HIDWORD(v347[4]) = 1;
      LODWORD(v343) = 1;
      goto LABEL_116;
    }
    HIDWORD(v347[4]) = v194;
    int v171 = v347[5];
  }
  IPv6PrimaryAt = self->_IPv6PrimaryAt;
  objc_msgSend_IPv6PrimaryAt(v4, v189, v190, v191, v192);
  v313 = (NSDate *)objc_claimAutoreleasedReturnValue();
  BOOL v193 = IPv6PrimaryAt == v313;
  BOOL v212 = IPv6PrimaryAt != v313;
  if (v193)
  {
    HIDWORD(v347[3]) = v212;
  }
  else
  {
    uint64_t v17 = self->_IPv6PrimaryAt;
    if (!v17)
    {
      *(void *)((char *)&v347[3] + 4) = 0;
      BOOL v237 = v111;
      int v31 = 0;
      int v32 = 0;
      LODWORD(v347[3]) = 0;
      int v35 = 0;
      int v36 = 0;
      uint64_t v15 = 1;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[12] = v237;
      *(_DWORD *)&v344[8] = 1;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      *(void *)v344 = 0x100000000;
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      int v33 = 0;
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      goto LABEL_116;
    }
    uint64_t v213 = objc_msgSend_IPv6PrimaryAt(v4, v208, v209, v210, v211);
    if (!v213)
    {
      v308 = 0;
      BOOL v251 = v111;
      *(void *)v344 = 0x100000000;
      int v31 = 0;
      LODWORD(v347[4]) = 0;
      int v32 = 0;
      v347[3] = 0x100000000;
      int v35 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      uint64_t v15 = 1;
      *(void *)&v345[4] = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[12] = v251;
      *(_DWORD *)&v344[8] = 1;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      int v33 = 0;
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      goto LABEL_116;
    }
    v308 = (void *)v213;
    v218 = self->_IPv6PrimaryAt;
    v306 = objc_msgSend_IPv6PrimaryAt(v4, v214, v215, v216, v217);
    if (!objc_msgSend_isEqual_(v218, v219, (uint64_t)v306, v220, v221))
    {
      int v31 = 0;
      LODWORD(v347[4]) = 0;
      int v32 = 0;
      int v33 = 0;
      v347[3] = 0x100000000;
      uint64_t v15 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      int v35 = 0;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      HIDWORD(v342) = v347[5];
      LODWORD(v342) = 1;
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      *(void *)v344 = 0x100000001;
      goto LABEL_116;
    }
    HIDWORD(v347[3]) = v212;
    int v171 = v347[5];
  }
  scanResult = self->_scanResult;
  objc_msgSend_scanResult(v4, v208, v209, v210, v211);
  v310 = (CWFScanResult *)objc_claimAutoreleasedReturnValue();
  LODWORD(v347[4]) = scanResult != v310;
  if (scanResult != v310)
  {
    uint64_t v17 = self->_scanResult;
    if (!v17)
    {
      LODWORD(v347[4]) = 0;
      int v32 = 0;
      LODWORD(v347[3]) = 0;
      uint64_t v15 = 0;
      int v36 = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      int v35 = 0;
      *(_DWORD *)&v344[4] = 1;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      int v33 = 0;
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      int v31 = 1;
      goto LABEL_116;
    }
    uint64_t v228 = objc_msgSend_scanResult(v4, v224, v225, v226, v227);
    if (!v228)
    {
      v305 = 0;
      int v32 = 0;
      LODWORD(v347[3]) = 0;
      uint64_t v15 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      int v35 = 0;
      *(_DWORD *)&v344[4] = 1;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      LODWORD(v342) = 1;
      HIDWORD(v342) = v171;
      int v33 = 0;
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      int v31 = 1;
      LODWORD(v347[4]) = 1;
      goto LABEL_116;
    }
    v305 = (void *)v228;
    v233 = self->_scanResult;
    v302 = objc_msgSend_scanResult(v4, v229, v230, v231, v232);
    if (!objc_msgSend_isEqual_(v233, v234, (uint64_t)v302, v235, v236))
    {
      int v33 = 0;
      LODWORD(v347[3]) = 0;
      uint64_t v15 = 0;
      int v36 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = v16;
      int v28 = 1;
      int v34 = 0;
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      int v35 = 0;
      *(_DWORD *)&v344[4] = 1;
      int v30 = v347[6];
      HIDWORD(v343) = HIDWORD(v347[5]);
      DWORD2(v343) = 1;
      HIDWORD(v342) = v347[5];
      LODWORD(v342) = 1;
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      int v31 = 1;
      LODWORD(v347[4]) = 1;
      int v32 = 1;
      goto LABEL_116;
    }
    int v171 = v347[5];
  }
  knownNetworkProfile = self->_knownNetworkProfile;
  objc_msgSend_knownNetworkProfile(v4, v224, v225, v226, v227);
  v307 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  LODWORD(v347[3]) = knownNetworkProfile != v307;
  if (knownNetworkProfile == v307) {
    goto LABEL_95;
  }
  uint64_t v17 = self->_knownNetworkProfile;
  if (!v17)
  {
    LODWORD(v347[3]) = 0;
    uint64_t v15 = 0;
    int v36 = 0;
    *(_DWORD *)&v345[4] = 1;
    v345[8] = 0;
    *(_DWORD *)&v344[32] = v59;
    *(_DWORD *)v345 = v16;
    int v28 = 1;
    int v34 = 0;
    *(_DWORD *)&v344[24] = v75;
    *(_DWORD *)&v344[28] = 1;
    *(_DWORD *)&v344[16] = 1;
    *(_DWORD *)&v344[20] = 1;
    *(_DWORD *)&v344[8] = 1;
    *(_DWORD *)&v344[12] = v111;
    int v35 = 0;
    *(_DWORD *)&v344[4] = 1;
    int v30 = v347[6];
    HIDWORD(v343) = HIDWORD(v347[5]);
    DWORD2(v343) = 1;
    LODWORD(v342) = 1;
    HIDWORD(v342) = v171;
    int v32 = v347[4];
    *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
    *(_DWORD *)v344 = HIDWORD(v347[3]);
    int v31 = 1;
    int v33 = 1;
    goto LABEL_116;
  }
  v304 = objc_msgSend_knownNetworkProfile(v4, v239, v240, v241, v242);
  if (!v304)
  {
    v304 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    LODWORD(v17) = 0;
    *(_DWORD *)&v345[4] = 1;
    v345[8] = 0;
    int v28 = 1;
    *(_DWORD *)&v344[32] = HIDWORD(v347[1]);
    *(_DWORD *)v345 = HIDWORD(v347[2]);
    *(_DWORD *)&v344[24] = v75;
    *(_DWORD *)&v344[28] = 1;
    *(_DWORD *)&v344[16] = 1;
    *(_DWORD *)&v344[20] = 1;
    *(_DWORD *)&v344[8] = 1;
    *(_DWORD *)&v344[12] = v347[0];
    int v30 = v347[6];
    DWORD2(v343) = 1;
    HIDWORD(v343) = HIDWORD(v347[5]);
    LODWORD(v342) = 1;
    HIDWORD(v342) = v347[5];
    int v32 = v347[4];
    uint64_t v15 = HIDWORD(v347[4]);
    *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
    *(_DWORD *)v344 = HIDWORD(v347[3]);
    *(_DWORD *)&v344[4] = 1;
    int v31 = 1;
    int v33 = 1;
    LODWORD(v347[3]) = 1;
    goto LABEL_116;
  }
  v247 = self->_knownNetworkProfile;
  v336 = v4;
  v300 = objc_msgSend_knownNetworkProfile(v4, v243, v244, v245, v246);
  if (objc_msgSend_isEqual_(v247, v248, (uint64_t)v300, v249, v250))
  {
LABEL_95:
    error = self->_error;
    v336 = v4;
    objc_msgSend_error(v4, v239, v240, v241, v242);
    v303 = (NSError *)objc_claimAutoreleasedReturnValue();
    BOOL v299 = error != v303;
    if (error == v303) {
      goto LABEL_103;
    }
    uint64_t v17 = self->_error;
    if (v17)
    {
      v301 = objc_msgSend_error(v4, v253, v254, v255, v256);
      if (v301)
      {
        v261 = self->_error;
        uint64_t v298 = objc_msgSend_error(v336, v257, v258, v259, v260);
        if (!objc_msgSend_isEqual_(v261, v262, v298, v263, v264))
        {
          *(_DWORD *)&v345[4] = 1;
          v345[8] = 0;
          int v28 = 1;
          *(_DWORD *)&v344[32] = v59;
          *(_DWORD *)v345 = HIDWORD(v347[2]);
          *(_DWORD *)&v344[24] = v75;
          *(_DWORD *)&v344[28] = 1;
          *(_DWORD *)&v344[16] = 1;
          *(_DWORD *)&v344[20] = 1;
          *(_DWORD *)&v344[8] = 1;
          *(_DWORD *)&v344[12] = v111;
          int v30 = v347[6];
          DWORD2(v343) = 1;
          HIDWORD(v343) = HIDWORD(v347[5]);
          LODWORD(v342) = 1;
          HIDWORD(v342) = v347[5];
          int v32 = v347[4];
          *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
          int v34 = v347[3];
          *(_DWORD *)v344 = HIDWORD(v347[3]);
          *(_DWORD *)&v344[4] = 1;
          int v31 = 1;
          int v33 = 1;
          int v35 = 1;
          int v36 = 1;
          LODWORD(v17) = 1;
          goto LABEL_109;
        }
LABEL_103:
        unsigned int EAP8021XSupplicantState = self->_EAP8021XSupplicantState;
        if (EAP8021XSupplicantState == objc_msgSend_EAP8021XSupplicantState(v336, v253, v254, v255, v256))
        {
          unsigned int EAP8021XControlMode = self->_EAP8021XControlMode;
          if (EAP8021XControlMode == objc_msgSend_EAP8021XControlMode(v336, v266, v267, v268, v269))
          {
            unsigned int EAP8021XControlState = self->_EAP8021XControlState;
            if (EAP8021XControlState == objc_msgSend_EAP8021XControlState(v336, v271, v272, v273, v274))
            {
              int EAP8021XClientStatus = self->_EAP8021XClientStatus;
              if (EAP8021XClientStatus == objc_msgSend_EAP8021XClientStatus(v336, v276, v277, v278, v279))
              {
                int autoJoin = self->_autoJoin;
                id v4 = v336;
                *(_DWORD *)&v345[4] = 1;
                v345[8] = autoJoin == objc_msgSend_isAutoJoin(v336, v281, v282, v283, v284);
                int v28 = 1;
                *(_DWORD *)&v344[32] = v59;
                *(_DWORD *)v345 = HIDWORD(v347[2]);
                *(_DWORD *)&v344[24] = v75;
                *(_DWORD *)&v344[28] = 1;
                *(_DWORD *)&v344[16] = 1;
                *(_DWORD *)&v344[20] = 1;
                *(_DWORD *)&v344[8] = 1;
                *(_DWORD *)&v344[12] = v111;
                int v30 = v347[6];
                DWORD2(v343) = 1;
                HIDWORD(v343) = HIDWORD(v347[5]);
                LODWORD(v342) = 1;
                HIDWORD(v342) = v347[5];
                int v32 = v347[4];
                *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
                int v34 = v347[3];
                *(_DWORD *)v344 = HIDWORD(v347[3]);
                *(_DWORD *)&v344[4] = 1;
                int v31 = 1;
                int v33 = 1;
                int v35 = 1;
                int v36 = v299;
                LODWORD(v17) = v299;
LABEL_110:
                uint64_t v15 = v298;
                goto LABEL_116;
              }
            }
          }
        }
        *(_DWORD *)&v345[4] = 1;
        v345[8] = 0;
        int v28 = 1;
        *(_DWORD *)&v344[32] = v59;
        *(_DWORD *)v345 = HIDWORD(v347[2]);
        *(_DWORD *)&v344[24] = v75;
        *(_DWORD *)&v344[28] = 1;
        *(_DWORD *)&v344[16] = 1;
        *(_DWORD *)&v344[20] = 1;
        *(_DWORD *)&v344[8] = 1;
        *(_DWORD *)&v344[12] = v111;
        int v30 = v347[6];
        DWORD2(v343) = 1;
        HIDWORD(v343) = HIDWORD(v347[5]);
        LODWORD(v342) = 1;
        HIDWORD(v342) = v347[5];
        int v32 = v347[4];
        *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
        int v34 = v347[3];
        *(_DWORD *)v344 = HIDWORD(v347[3]);
        *(_DWORD *)&v344[4] = 1;
        int v31 = 1;
        int v33 = 1;
        int v35 = 1;
        int v36 = v299;
        LODWORD(v17) = v299;
LABEL_109:
        id v4 = v336;
        goto LABEL_110;
      }
      v301 = 0;
      LODWORD(v17) = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      int v28 = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = HIDWORD(v347[2]);
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      int v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v347[5];
      int v32 = v347[4];
      uint64_t v15 = HIDWORD(v347[4]);
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      int v34 = v347[3];
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      *(_DWORD *)&v344[4] = 1;
      int v31 = 1;
      int v33 = 1;
      int v35 = 1;
      int v36 = 1;
    }
    else
    {
      int v36 = 0;
      *(_DWORD *)&v345[4] = 1;
      v345[8] = 0;
      int v28 = 1;
      *(_DWORD *)&v344[32] = v59;
      *(_DWORD *)v345 = HIDWORD(v347[2]);
      *(_DWORD *)&v344[24] = v75;
      *(_DWORD *)&v344[28] = 1;
      *(_DWORD *)&v344[16] = 1;
      *(_DWORD *)&v344[20] = 1;
      *(_DWORD *)&v344[8] = 1;
      *(_DWORD *)&v344[12] = v111;
      int v30 = v347[6];
      DWORD2(v343) = 1;
      HIDWORD(v343) = HIDWORD(v347[5]);
      LODWORD(v342) = 1;
      HIDWORD(v342) = v347[5];
      int v32 = v347[4];
      uint64_t v15 = HIDWORD(v347[4]);
      *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
      int v34 = v347[3];
      *(_DWORD *)v344 = HIDWORD(v347[3]);
      *(_DWORD *)&v344[4] = 1;
      int v31 = 1;
      int v33 = 1;
      int v35 = 1;
    }
  }
  else
  {
    int v35 = 0;
    int v36 = 0;
    LODWORD(v17) = 0;
    *(_DWORD *)&v345[4] = 1;
    v345[8] = 0;
    int v28 = 1;
    *(_DWORD *)&v344[32] = v59;
    *(_DWORD *)v345 = HIDWORD(v347[2]);
    *(_DWORD *)&v344[24] = v75;
    *(_DWORD *)&v344[28] = 1;
    *(_DWORD *)&v344[16] = 1;
    *(_DWORD *)&v344[20] = 1;
    *(_DWORD *)&v344[8] = 1;
    *(_DWORD *)&v344[12] = v347[0];
    int v30 = v347[6];
    DWORD2(v343) = 1;
    HIDWORD(v343) = HIDWORD(v347[5]);
    LODWORD(v342) = 1;
    HIDWORD(v342) = v347[5];
    int v32 = v347[4];
    uint64_t v15 = HIDWORD(v347[4]);
    *(void *)&long long v343 = HIDWORD(v347[4]) | 0x100000000;
    *(_DWORD *)v344 = HIDWORD(v347[3]);
    *(_DWORD *)&v344[4] = 1;
    int v31 = 1;
    int v33 = 1;
    LODWORD(v347[3]) = 1;
    int v34 = 1;
  }
  id v4 = v336;
LABEL_116:
  if (v17)
  {
    id v337 = v4;
    int v286 = v30;
    int v287 = v31;
    int v288 = v32;
    int v289 = v33;
    int v290 = v34;
    BOOL v291 = v29;
    int v292 = v35;
    int v293 = v28;
    BOOL v294 = v27;
    int v295 = v36;

    int v296 = v295;
    LODWORD(v27) = v294;
    int v28 = v293;
    int v35 = v292;
    LODWORD(v29) = v291;
    int v34 = v290;
    int v33 = v289;
    int v32 = v288;
    int v31 = v287;
    int v30 = v286;
    id v4 = v337;
    if (!v296) {
      goto LABEL_118;
    }
  }
  else if (!v36)
  {
LABEL_118:
    if (v35) {
      goto LABEL_119;
    }
LABEL_123:
    if (!v34) {
      goto LABEL_125;
    }
    goto LABEL_124;
  }

  if (!v35) {
    goto LABEL_123;
  }
LABEL_119:

  if (v34) {
LABEL_124:
  }

LABEL_125:
  if (LODWORD(v347[3]))
  {

    if (!v33) {
      goto LABEL_127;
    }
  }
  else if (!v33)
  {
LABEL_127:
    if (!v32) {
      goto LABEL_129;
    }
    goto LABEL_128;
  }

  if (v32) {
LABEL_128:
  }

LABEL_129:
  if (LODWORD(v347[4])) {

  }
  if (v31) {
  if (*(_DWORD *)v344)
  }

  if (HIDWORD(v347[3])) {
  if (DWORD1(v343))
  }

  if (v343) {
  if (HIDWORD(v347[4]))
  }

  if (v342) {
  if (HIDWORD(v342))
  }

  if (LODWORD(v347[5])) {
  if (DWORD2(v343))
  }

  if (HIDWORD(v343)) {
  if (HIDWORD(v347[5]))
  }

  if (*(_DWORD *)&v344[4]) {
  if (v30)
  }

  if (LODWORD(v347[6])) {
  if (*(_DWORD *)&v344[8])
  }

  if (*(_DWORD *)&v344[12]) {
  if (LODWORD(v347[0]))
  }

  if (*(_DWORD *)&v344[16]) {
  if (v29)
  }

  if (HIDWORD(v347[0])) {
  if (*(_DWORD *)&v344[20])
  }

  if (*(_DWORD *)&v344[24]) {
  if (LODWORD(v347[1]))
  }

  if (*(_DWORD *)&v344[28]) {
  if (*(_DWORD *)&v344[32])
  }
  {

    if (!HIDWORD(v347[1])) {
      goto LABEL_183;
    }
  }
  else if (!HIDWORD(v347[1]))
  {
LABEL_183:
    if (v28) {
      goto LABEL_184;
    }
    goto LABEL_199;
  }

  if (v28)
  {
LABEL_184:

    if (!v27) {
      goto LABEL_185;
    }
    goto LABEL_200;
  }
LABEL_199:
  if (!v27)
  {
LABEL_185:
    if (!LODWORD(v347[2])) {
      goto LABEL_187;
    }
    goto LABEL_186;
  }
LABEL_200:

  if (LODWORD(v347[2])) {
LABEL_186:
  }

LABEL_187:
  if (*(_DWORD *)&v345[4]) {

  }
  if (*(_DWORD *)v345) {
  if (HIDWORD(v347[2]))
  }

  return v345[8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFJoinStatus *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToJoinStatus = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToJoinStatus = objc_msgSend_isEqualToJoinStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToJoinStatus = 0;
  }

  return isEqualToJoinStatus;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
  uint64_t v16 = objc_msgSend_hash(self->_startedAt, v12, v13, v14, v15);
  uint64_t v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_endedAt, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_hash(self->_associationEndedAt, v22, v23, v24, v25);
  uint64_t v31 = v26 ^ objc_msgSend_hash(self->_authenticationEndedAt, v27, v28, v29, v30);
  uint64_t v36 = v21 ^ v31 ^ objc_msgSend_hash(self->_linkUpAt, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_hash(self->_IPv4AssignedAt, v37, v38, v39, v40);
  uint64_t v46 = v41 ^ objc_msgSend_hash(self->_IPv4PrimaryAt, v42, v43, v44, v45);
  uint64_t v51 = v46 ^ objc_msgSend_hash(self->_IPv6AssignedAt, v47, v48, v49, v50);
  uint64_t v56 = v36 ^ v51 ^ objc_msgSend_hash(self->_IPv6PrimaryAt, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_hash(self->_scanResult, v57, v58, v59, v60);
  uint64_t v66 = v61 ^ objc_msgSend_hash(self->_knownNetworkProfile, v62, v63, v64, v65);
  return v56 ^ v66 ^ objc_msgSend_hash(self->_error, v67, v68, v69, v70) ^ self->_EAP8021XSupplicantState ^ self->_EAP8021XControlMode ^ self->_EAP8021XControlState ^ (unint64_t)self->_EAP8021XClientStatus ^ self->_autoJoin;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFJoinStatus, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setStartedAt_(v11, v18, (uint64_t)self->_startedAt, v19, v20);
  objc_msgSend_setEndedAt_(v11, v21, (uint64_t)self->_endedAt, v22, v23);
  objc_msgSend_setAssociationEndedAt_(v11, v24, (uint64_t)self->_associationEndedAt, v25, v26);
  objc_msgSend_setAuthenticationEndedAt_(v11, v27, (uint64_t)self->_authenticationEndedAt, v28, v29);
  objc_msgSend_setLinkUpAt_(v11, v30, (uint64_t)self->_linkUpAt, v31, v32);
  objc_msgSend_setIPv4AssignedAt_(v11, v33, (uint64_t)self->_IPv4AssignedAt, v34, v35);
  objc_msgSend_setIPv4PrimaryAt_(v11, v36, (uint64_t)self->_IPv4PrimaryAt, v37, v38);
  objc_msgSend_setIPv6AssignedAt_(v11, v39, (uint64_t)self->_IPv6AssignedAt, v40, v41);
  objc_msgSend_setIPv6PrimaryAt_(v11, v42, (uint64_t)self->_IPv6PrimaryAt, v43, v44);
  objc_msgSend_setScanResult_(v11, v45, (uint64_t)self->_scanResult, v46, v47);
  objc_msgSend_setKnownNetworkProfile_(v11, v48, (uint64_t)self->_knownNetworkProfile, v49, v50);
  objc_msgSend_setError_(v11, v51, (uint64_t)self->_error, v52, v53);
  objc_msgSend_setEAP8021XSupplicantState_(v11, v54, self->_EAP8021XSupplicantState, v55, v56);
  objc_msgSend_setEAP8021XControlMode_(v11, v57, self->_EAP8021XControlMode, v58, v59);
  objc_msgSend_setEAP8021XControlState_(v11, v60, self->_EAP8021XControlState, v61, v62);
  objc_msgSend_setEAP8021XClientStatus_(v11, v63, self->_EAP8021XClientStatus, v64, v65);
  objc_msgSend_setAutoJoin_(v11, v66, self->_autoJoin, v67, v68);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v43 = a3;
  objc_msgSend_encodeObject_forKey_(v43, v5, (uint64_t)UUID, @"_UUID", v6);
  objc_msgSend_encodeObject_forKey_(v43, v7, (uint64_t)self->_interfaceName, @"_interfaceName", v8);
  objc_msgSend_encodeObject_forKey_(v43, v9, (uint64_t)self->_startedAt, @"_startedAt", v10);
  objc_msgSend_encodeObject_forKey_(v43, v11, (uint64_t)self->_endedAt, @"_endedAt", v12);
  objc_msgSend_encodeObject_forKey_(v43, v13, (uint64_t)self->_associationEndedAt, @"_associationEndedAt", v14);
  objc_msgSend_encodeObject_forKey_(v43, v15, (uint64_t)self->_authenticationEndedAt, @"_authenticationEndedAt", v16);
  objc_msgSend_encodeObject_forKey_(v43, v17, (uint64_t)self->_linkUpAt, @"_linkUpAt", v18);
  objc_msgSend_encodeObject_forKey_(v43, v19, (uint64_t)self->_IPv4AssignedAt, @"_IPv4AssignedAt", v20);
  objc_msgSend_encodeObject_forKey_(v43, v21, (uint64_t)self->_IPv6AssignedAt, @"_IPv6AssignedAt", v22);
  objc_msgSend_encodeObject_forKey_(v43, v23, (uint64_t)self->_IPv4PrimaryAt, @"_IPv4PrimaryAt", v24);
  objc_msgSend_encodeObject_forKey_(v43, v25, (uint64_t)self->_IPv6PrimaryAt, @"_IPv6PrimaryAt", v26);
  objc_msgSend_encodeObject_forKey_(v43, v27, (uint64_t)self->_error, @"_error", v28);
  objc_msgSend_encodeObject_forKey_(v43, v29, (uint64_t)self->_scanResult, @"_scanResult", v30);
  objc_msgSend_encodeObject_forKey_(v43, v31, (uint64_t)self->_knownNetworkProfile, @"_knownNetworkProfile", v32);
  objc_msgSend_encodeInteger_forKey_(v43, v33, self->_EAP8021XSupplicantState, @"_EAP8021XSupplicantState", v34);
  objc_msgSend_encodeInteger_forKey_(v43, v35, self->_EAP8021XControlState, @"_EAP8021XControlState", v36);
  objc_msgSend_encodeInteger_forKey_(v43, v37, self->_EAP8021XControlMode, @"_EAP8021XControlMode", v38);
  objc_msgSend_encodeInteger_forKey_(v43, v39, self->_EAP8021XClientStatus, @"_EAP8021XClientStatus", v40);
  objc_msgSend_encodeBool_forKey_(v43, v41, self->_autoJoin, @"_autoJoin", v42);
}

- (CWFJoinStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CWFJoinStatus;
  uint64_t v5 = [(CWFJoinStatus *)&v92 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_UUID", v8);
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_interfaceName", v13);
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"_startedAt", v18);
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"_endedAt", v23);
    endedAt = v5->_endedAt;
    v5->_endedAt = (NSDate *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"_associationEndedAt", v28);
    associationEndedAt = v5->_associationEndedAt;
    v5->_associationEndedAt = (NSDate *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"_authenticationEndedAt", v33);
    authenticationEndedAt = v5->_authenticationEndedAt;
    v5->_authenticationEndedAt = (NSDate *)v34;

    uint64_t v36 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"_linkUpAt", v38);
    linkUpAt = v5->_linkUpAt;
    v5->_linkUpAt = (NSDate *)v39;

    uint64_t v41 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"_IPv4AssignedAt", v43);
    IPv4AssignedAt = v5->_IPv4AssignedAt;
    v5->_IPv4AssignedAt = (NSDate *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"_IPv6AssignedAt", v48);
    IPv6AssignedAt = v5->_IPv6AssignedAt;
    v5->_IPv6AssignedAt = (NSDate *)v49;

    uint64_t v51 = objc_opt_class();
    uint64_t v54 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, @"_IPv4PrimaryAt", v53);
    IPv4PrimaryAt = v5->_IPv4PrimaryAt;
    v5->_IPv4PrimaryAt = (NSDate *)v54;

    uint64_t v56 = objc_opt_class();
    uint64_t v59 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, @"_IPv6PrimaryAt", v58);
    IPv6PrimaryAt = v5->_IPv6PrimaryAt;
    v5->_IPv6PrimaryAt = (NSDate *)v59;

    uint64_t v61 = objc_opt_class();
    uint64_t v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, @"_error", v63);
    error = v5->_error;
    v5->_error = (NSError *)v64;

    uint64_t v66 = objc_opt_class();
    uint64_t v69 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"_scanResult", v68);
    scanResult = v5->_scanResult;
    v5->_scanResult = (CWFScanResult *)v69;

    uint64_t v71 = objc_opt_class();
    uint64_t v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, @"_knownNetworkProfile", v73);
    knownNetworkProfile = v5->_knownNetworkProfile;
    v5->_knownNetworkProfile = (CWFNetworkProfile *)v74;

    v5->_unsigned int EAP8021XSupplicantState = objc_msgSend_decodeIntegerForKey_(v4, v76, @"_EAP8021XSupplicantState", v77, v78);
    v5->_unsigned int EAP8021XControlMode = objc_msgSend_decodeIntegerForKey_(v4, v79, @"_EAP8021XControlMode", v80, v81);
    v5->_unsigned int EAP8021XControlState = objc_msgSend_decodeIntegerForKey_(v4, v82, @"_EAP8021XControlState", v83, v84);
    v5->_int EAP8021XClientStatus = objc_msgSend_decodeIntegerForKey_(v4, v85, @"_EAP8021XClientStatus", v86, v87);
    v5->_int autoJoin = objc_msgSend_decodeBoolForKey_(v4, v88, @"_autoJoin", v89, v90);
  }

  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
}

- (CWFNetworkProfile)knownNetworkProfile
{
  return self->_knownNetworkProfile;
}

- (void)setKnownNetworkProfile:(id)a3
{
}

- (unsigned)EAP8021XSupplicantState
{
  return self->_EAP8021XSupplicantState;
}

- (void)setEAP8021XSupplicantState:(unsigned int)a3
{
  self->_unsigned int EAP8021XSupplicantState = a3;
}

- (unsigned)EAP8021XControlMode
{
  return self->_EAP8021XControlMode;
}

- (void)setEAP8021XControlMode:(unsigned int)a3
{
  self->_unsigned int EAP8021XControlMode = a3;
}

- (unsigned)EAP8021XControlState
{
  return self->_EAP8021XControlState;
}

- (void)setEAP8021XControlState:(unsigned int)a3
{
  self->_unsigned int EAP8021XControlState = a3;
}

- (int)EAP8021XClientStatus
{
  return self->_EAP8021XClientStatus;
}

- (void)setEAP8021XClientStatus:(int)a3
{
  self->_int EAP8021XClientStatus = a3;
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSDate)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(id)a3
{
}

- (NSDate)associationEndedAt
{
  return self->_associationEndedAt;
}

- (void)setAssociationEndedAt:(id)a3
{
}

- (NSDate)authenticationEndedAt
{
  return self->_authenticationEndedAt;
}

- (void)setAuthenticationEndedAt:(id)a3
{
}

- (NSDate)linkUpAt
{
  return self->_linkUpAt;
}

- (void)setLinkUpAt:(id)a3
{
}

- (NSDate)IPv4AssignedAt
{
  return self->_IPv4AssignedAt;
}

- (void)setIPv4AssignedAt:(id)a3
{
}

- (NSDate)IPv4PrimaryAt
{
  return self->_IPv4PrimaryAt;
}

- (void)setIPv4PrimaryAt:(id)a3
{
}

- (NSDate)IPv6AssignedAt
{
  return self->_IPv6AssignedAt;
}

- (void)setIPv6AssignedAt:(id)a3
{
}

- (NSDate)IPv6PrimaryAt
{
  return self->_IPv6PrimaryAt;
}

- (void)setIPv6PrimaryAt:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isAutoJoin
{
  return self->_autoJoin;
}

- (void)setAutoJoin:(BOOL)a3
{
  self->_int autoJoin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_IPv6PrimaryAt, 0);
  objc_storeStrong((id *)&self->_IPv6AssignedAt, 0);
  objc_storeStrong((id *)&self->_IPv4PrimaryAt, 0);
  objc_storeStrong((id *)&self->_IPv4AssignedAt, 0);
  objc_storeStrong((id *)&self->_linkUpAt, 0);
  objc_storeStrong((id *)&self->_authenticationEndedAt, 0);
  objc_storeStrong((id *)&self->_associationEndedAt, 0);
  objc_storeStrong((id *)&self->_endedAt, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_knownNetworkProfile, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)JSONCompatibleKeyValueMap
{
  v283[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = objc_msgSend_UUID(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"uuid", v15);

  uint64_t v20 = objc_msgSend_interfaceName(self, v16, v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, @"interface_name", v22);

  BOOL v27 = objc_msgSend_scanResult(self, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_JSONCompatibleKeyValueMap(v27, v28, v29, v30, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, @"scan_result", v34);

  uint64_t v39 = objc_msgSend_error(self, v35, v36, v37, v38);
  if (objc_msgSend_code(v39, v40, v41, v42, v43) <= 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, 0, @"error", v47);
  }
  else
  {
    v282[0] = @"description";
    uint64_t v48 = objc_msgSend_error(self, v44, v45, v46, v47);
    uint64_t v53 = objc_msgSend_localizedDescription(v48, v49, v50, v51, v52);
    v282[1] = @"code";
    v283[0] = v53;
    uint64_t v54 = NSNumber;
    uint64_t v59 = objc_msgSend_error(self, v55, v56, v57, v58);
    uint64_t v64 = objc_msgSend_code(v59, v60, v61, v62, v63);
    uint64_t v68 = objc_msgSend_numberWithInteger_(v54, v65, v64, v66, v67);
    v283[1] = v68;
    uint64_t v70 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v69, (uint64_t)v283, (uint64_t)v282, 2);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v71, (uint64_t)v70, @"error", v72);
  }
  uint64_t v73 = NSNumber;
  uint64_t isAutoJoin = objc_msgSend_isAutoJoin(self, v74, v75, v76, v77);
  double v82 = objc_msgSend_numberWithBool_(v73, v79, isAutoJoin, v80, v81);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v83, (uint64_t)v82, @"is_auto_join", v84);

  uint64_t v89 = objc_msgSend_startedAt(self, v85, v86, v87, v88);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v90, (uint64_t)v89, @"started_at", v91);

  uint64_t v96 = objc_msgSend_endedAt(self, v92, v93, v94, v95);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v97, (uint64_t)v96, @"ended_at", v98);

  unint64_t v99 = NSNumber;
  objc_msgSend_duration(self, v100, v101, v102, v103);
  uint64_t v108 = objc_msgSend_numberWithUnsignedInteger_(v99, v105, (unint64_t)(v104 * 1000.0), v106, v107);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v108, @"duration", v110);

  uint64_t v115 = objc_msgSend_associationEndedAt(self, v111, v112, v113, v114);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v116, (uint64_t)v115, @"associated_ended_at", v117);

  v118 = NSNumber;
  objc_msgSend_durationUntilAssociationEnded(self, v119, v120, v121, v122);
  v127 = objc_msgSend_numberWithUnsignedInteger_(v118, v124, (unint64_t)(v123 * 1000.0), v125, v126);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v128, (uint64_t)v127, @"duration_until_association_ended", v129);

  uint64_t v134 = objc_msgSend_authenticationEndedAt(self, v130, v131, v132, v133);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v135, (uint64_t)v134, @"authentication_ended_at", v136);

  v137 = NSNumber;
  objc_msgSend_durationUntilAuthenticationEnded(self, v138, v139, v140, v141);
  v146 = objc_msgSend_numberWithUnsignedInteger_(v137, v143, (unint64_t)(v142 * 1000.0), v144, v145);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v147, (uint64_t)v146, @"duration_until_authentication_ended", v148);

  uint64_t v153 = objc_msgSend_linkUpAt(self, v149, v150, v151, v152);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v154, (uint64_t)v153, @"link_up_at", v155);

  v156 = NSNumber;
  objc_msgSend_durationUntilLinkUp(self, v157, v158, v159, v160);
  BOOL v165 = objc_msgSend_numberWithUnsignedInteger_(v156, v162, (unint64_t)(v161 * 1000.0), v163, v164);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v166, (uint64_t)v165, @"duration_until_link_up", v167);

  uint64_t v172 = objc_msgSend_IPv4AssignedAt(self, v168, v169, v170, v171);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v173, (uint64_t)v172, @"ipv4_assigned_at", v174);

  uint64_t v175 = NSNumber;
  objc_msgSend_durationUntilIPv4Assigned(self, v176, v177, v178, v179);
  BOOL v184 = objc_msgSend_numberWithUnsignedInteger_(v175, v181, (unint64_t)(v180 * 1000.0), v182, v183);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v185, (uint64_t)v184, @"duration_until_ipv4_assigned", v186);

  uint64_t v191 = objc_msgSend_IPv4PrimaryAt(self, v187, v188, v189, v190);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v192, (uint64_t)v191, @"ipv4_primary_at", v193);

  BOOL v194 = NSNumber;
  objc_msgSend_durationUntilIPv4Primary(self, v195, v196, v197, v198);
  uint64_t v203 = objc_msgSend_numberWithUnsignedInteger_(v194, v200, (unint64_t)(v199 * 1000.0), v201, v202);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v204, (uint64_t)v203, @"duration_until_ipv4_primary", v205);

  uint64_t v210 = objc_msgSend_IPv6AssignedAt(self, v206, v207, v208, v209);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v211, (uint64_t)v210, @"ipv4_assigned_at", v212);

  uint64_t v213 = NSNumber;
  objc_msgSend_durationUntilIPv6Assigned(self, v214, v215, v216, v217);
  BOOL v222 = objc_msgSend_numberWithUnsignedInteger_(v213, v219, (unint64_t)(v218 * 1000.0), v220, v221);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v223, (uint64_t)v222, @"duration_until_ipv6_assigned", v224);

  v229 = objc_msgSend_IPv6PrimaryAt(self, v225, v226, v227, v228);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v230, (uint64_t)v229, @"ipv6_primary_at", v231);

  uint64_t v232 = NSNumber;
  objc_msgSend_durationUntilIPv6Primary(self, v233, v234, v235, v236);
  uint64_t v241 = objc_msgSend_numberWithUnsignedInteger_(v232, v238, (unint64_t)(v237 * 1000.0), v239, v240);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v242, (uint64_t)v241, @"duration_until_ipv6_primary", v243);

  uint64_t v244 = NSString;
  unsigned int v249 = objc_msgSend_EAP8021XSupplicantState(self, v245, v246, v247, v248);
  if (v249 > 8) {
    objc_msgSend_stringWithCString_encoding_(v244, v250, (uint64_t)"<unknown>", 4, v251);
  }
  else {
  v252 = objc_msgSend_stringWithCString_encoding_(v244, v250, (uint64_t)off_1E60BDBB0[v249], 4, v251);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v253, (uint64_t)v252, @"supplicant_state", v254);

  uint64_t v259 = objc_msgSend_descriptionForEAPOLControlMode(self, v255, v256, v257, v258);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v260, (uint64_t)v259, @"eapol_control_mode", v261);

  v266 = objc_msgSend_descriptionForEAP8021XControlState(self, v262, v263, v264, v265);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v267, (uint64_t)v266, @"eapol_control_state", v268);

  uint64_t v273 = objc_msgSend_descriptionForEAPOLClientStatus(self, v269, v270, v271, v272);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v274, (uint64_t)v273, @"eapol_client_status", v275);

  uint64_t v279 = sub_1B4F59CC8(v3, 0, 1u);
  if (v279)
  {
    v280 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v276, (uint64_t)v279, v277, v278);
  }
  else
  {
    v280 = 0;
  }

  return v280;
}

- (id)descriptionForEAPOLClientStatus
{
  int v6 = objc_msgSend_EAP8021XClientStatus(self, a2, v2, v3, v4);
  int v11 = v6;
  if (v6 > 999)
  {
    switch(v6)
    {
      case 1000:
        uint64_t v12 = @"Errno Error";
        break;
      case 1001:
        uint64_t v12 = @"Security Error";
        break;
      case 1002:
        uint64_t v12 = @"Plugin Specific Error";
        break;
      default:
LABEL_28:
        uint64_t v13 = NSString;
        int v14 = objc_msgSend_EAP8021XClientStatus(self, v7, v8, v9, v10);
        objc_msgSend_stringWithFormat_(v13, v15, @"? (%ld)", v16, v17, v14);
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    uint64_t v12 = @"OK";
    switch(v11)
    {
      case 0:
        break;
      case 1:
        uint64_t v12 = @"Failed";
        break;
      case 2:
        uint64_t v12 = @"Allocation Failed";
        break;
      case 3:
        uint64_t v12 = @"User Input Required";
        break;
      case 4:
        uint64_t v12 = @"Configuration Invalid";
        break;
      case 5:
        uint64_t v12 = @"Protocol Not Supported";
        break;
      case 6:
        uint64_t v12 = @"Certificate Not Trusted";
        break;
      case 7:
        uint64_t v12 = @"Inner Protocol Not Supported";
        break;
      case 8:
        uint64_t v12 = @"Internal Error";
        break;
      case 9:
        uint64_t v12 = @"User Cancelled Authentication";
        break;
      case 10:
        uint64_t v12 = @"Unknown Root Certificate";
        break;
      case 11:
        uint64_t v12 = @"No Root Certificate";
        break;
      case 12:
        uint64_t v12 = @"Certificate Expired";
        break;
      case 13:
        uint64_t v12 = @"Certificate Not Yet Valid";
        break;
      case 14:
        uint64_t v12 = @"Certificate Requires Confirmation";
        break;
      case 15:
        uint64_t v12 = @"User Input Not Possible";
        break;
      case 16:
        uint64_t v12 = @"Resource Unavailable";
        break;
      case 17:
        uint64_t v12 = @"Protocol Error";
        break;
      case 18:
        uint64_t v12 = @"Authentication Stalled";
        break;
      case 19:
        uint64_t v12 = @"Identity Decryption Error";
        break;
      default:
        goto LABEL_28;
    }
  }
  return v12;
}

- (id)descriptionForEAPOLControlMode
{
  unsigned int v6 = objc_msgSend_EAP8021XControlMode(self, a2, v2, v3, v4);
  if (v6 >= 4)
  {
    uint64_t v12 = NSString;
    unsigned int v13 = objc_msgSend_EAP8021XControlMode(self, v7, v8, v9, v10);
    objc_msgSend_stringWithFormat_(v12, v14, @"? (%ld)", v15, v16, v13);
    int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v11 = off_1E60BDBF8[v6];
  }
  return v11;
}

- (id)descriptionForEAP8021XControlState
{
  unsigned int v6 = objc_msgSend_EAP8021XControlState(self, a2, v2, v3, v4);
  if (v6 >= 4)
  {
    uint64_t v12 = NSString;
    unsigned int v13 = objc_msgSend_EAP8021XControlState(self, v7, v8, v9, v10);
    objc_msgSend_stringWithFormat_(v12, v14, @"? (%ld)", v15, v16, v13);
    int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v11 = off_1E60BDC18[v6];
  }
  return v11;
}

@end