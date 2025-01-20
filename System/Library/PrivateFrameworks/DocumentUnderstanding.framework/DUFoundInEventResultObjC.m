@interface DUFoundInEventResultObjC
- (DUFoundInEventResultObjC)initWithDUFoundInEventResult:(id)a3;
@end

@implementation DUFoundInEventResultObjC

- (DUFoundInEventResultObjC)initWithDUFoundInEventResult:(id)a3
{
  id v3 = a3;
  unsigned int v121 = objc_msgSend_detectedEventPolarity(v3, v4, v5, v6, v7);
  v132 = objc_msgSend_reservationIdError(v3, v8, v9, v10, v11);
  v131 = objc_msgSend_reservationId(v3, v12, v13, v14, v15);
  v129 = objc_msgSend_reservationNameError(v3, v16, v17, v18, v19);
  v120 = objc_msgSend_reservationName(v3, v20, v21, v22, v23);
  v118 = objc_msgSend_startAddressError(v3, v24, v25, v26, v27);
  v130 = objc_msgSend_startAddress(v3, v28, v29, v30, v31);
  v128 = objc_msgSend_startAddressComponents(v3, v32, v33, v34, v35);
  v127 = objc_msgSend_endAddressError(v3, v36, v37, v38, v39);
  v117 = objc_msgSend_endAddress(v3, v40, v41, v42, v43);
  v126 = objc_msgSend_endAddressComponents(v3, v44, v45, v46, v47);
  v125 = objc_msgSend_startPlaceError(v3, v48, v49, v50, v51);
  v124 = objc_msgSend_startPlace(v3, v52, v53, v54, v55);
  v116 = objc_msgSend_endPlaceError(v3, v56, v57, v58, v59);
  v123 = objc_msgSend_endPlace(v3, v60, v61, v62, v63);
  v122 = objc_msgSend_startDateError(v3, v64, v65, v66, v67);
  v115 = objc_msgSend_startDate(v3, v68, v69, v70, v71);
  v114 = objc_msgSend_endDateError(v3, v72, v73, v74, v75);
  v80 = objc_msgSend_endDate(v3, v76, v77, v78, v79);
  v85 = objc_msgSend_hotelNameError(v3, v81, v82, v83, v84);
  v113 = objc_msgSend_hotelName(v3, v86, v87, v88, v89);
  v112 = objc_msgSend_guestNameError(v3, v90, v91, v92, v93);
  v98 = objc_msgSend_guestName(v3, v94, v95, v96, v97);
  v103 = objc_msgSend_movieNameError(v3, v99, v100, v101, v102);
  v108 = objc_msgSend_movieName(v3, v104, v105, v106, v107);

  v133.receiver = self;
  v133.super_class = (Class)DUFoundInEventResultObjC;
  v109 = -[DUFoundInEventClientAbstractResult initWithFields:reservationIdError:reservationId:reservationNameError:reservationName:startAddressError:startAddress:startAddressComponents:endAddressError:endAddress:endAddressComponents:startPlaceError:startPlace:endPlaceError:endPlace:startDateError:startDate:endDateError:endDate:hotelNameError:hotelName:guestNameError:guestName:movieNameError:movieName:](&v133, sel_initWithFields_reservationIdError_reservationId_reservationNameError_reservationName_startAddressError_startAddress_startAddressComponents_endAddressError_endAddress_endAddressComponents_startPlaceError_startPlace_endPlaceError_endPlace_startDateError_startDate_endDateError_endDate_hotelNameError_hotelName_guestNameError_guestName_movieNameError_movieName_, v121, v132, v131, v129, v120, v118, v130, v128, v127, v117, v126, v125, v124, v116, v123, v122, v115,
           v114,
           v80,
           v85,
           v113,
           v112,
           v98,
           v103,
           v108);

  if (v109) {
    v110 = v109;
  }

  return v109;
}

@end